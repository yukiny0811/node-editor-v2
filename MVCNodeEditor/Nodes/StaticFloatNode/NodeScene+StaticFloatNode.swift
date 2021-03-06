//
//  NodeScene+StaticFloatNode.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/12.
//

import Foundation
import Cocoa
import Combine

extension NodeScene {
    func addStaticFloatNode(frame: NSRect) {
        
        let nodeModel = NodeModel<Float>()
        nodeModels[nodeModel.uuid] = nodeModel
        let nodeView = StaticFloatNode(frame: frame)
        nodeViews[nodeModel.uuid] = nodeView
        
        let outputModel = OutputModel<Float>()
        outputPinModels[outputModel.uuid] = outputModel
        let outputView = OutputPin(frame: NSRect(x: frame.width - 30, y: 30, width: 30, height: 30))
        outputPinViews[outputModel.uuid] = outputView
        
        nodeView.addSubview(outputView)
        self.addSubview(nodeView)
        
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
            outputModel.value = value
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
        
        setHoverBinding(model: outputModel)
        
        
    }
}
