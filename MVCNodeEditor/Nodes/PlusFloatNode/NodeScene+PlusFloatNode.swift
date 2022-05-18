//
//  NodeScene+PlusFloatNode.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/13.
//

import Foundation
import Cocoa
import Combine

extension NodeScene {
    func addPlusFloatNode(frame: NSRect) {
        
        let nodeModel = NodeModel<Float>()
        nodeModels[nodeModel.uuid] = nodeModel
        let nodeView = PlusFloatNode(frame: frame)
        nodeViews[nodeModel.uuid] = nodeView
        
        let inputModel = InputModel<Float>()
        inputPinModels[inputModel.uuid] = inputModel
        let inputView = InputPin(frame: NSRect(x: 0, y: 30, width: 30, height: 30))
        inputPinViews[inputModel.uuid] = inputView
        
        let outputModel = OutputModel<Float>()
        outputPinModels[outputModel.uuid] = outputModel
        let outputView = OutputPin(frame: NSRect(x: frame.width - 30, y: 30, width: 30, height: 30))
        outputPinViews[outputModel.uuid] = outputView
        
        nodeView.addSubview(inputView)
        nodeView.addSubview(outputView)
        self.addSubview(nodeView)
        
        inputModel.$value.sink {value in
            guard let value = value else {
                return
            }
            if nodeModel.value == nil {
                return
            }
            outputModel.value = nodeModel.value! + value
        }.store(in: &inputModel.subscriptions)
        
        NotificationCenter.default
            .publisher(for: NSControl.textDidChangeNotification, object: nodeView.textField)
            .map { value in
                (value.object as! NSTextField).stringValue
            }.sink { value in
                if let value = Float(value) {
                    nodeModel.value = value
                }
            }.store(in: &nodeView.subscriptions)
        
        nodeModel.$value.sink {value in
            if inputModel.value == nil {
                return
            }
            guard let value = value else {
                return
            }
            outputModel.value = inputModel.value! + value
        }.store(in: &nodeModel.subscriptions)
        
        outputModel.$value.sink { [self] value in
            if outputModel.inputId != nil {
                (inputPinModels[outputModel.inputId!] as? InputModel<Float>)?.value = value
            }
        }.store(in: &outputModel.subscriptions)
        
        outputModel.$inputId.sink { [self] value in
            if outputModel.inputId != nil {
                (inputPinModels[outputModel.inputId!] as? InputModel<Float>)?.value = outputModel.value
            }
        }.store(in: &outputModel.subscriptions)
        
        setHoverBinding(model: inputModel)
        setHoverBinding(model: outputModel)
        
        
    }
}
