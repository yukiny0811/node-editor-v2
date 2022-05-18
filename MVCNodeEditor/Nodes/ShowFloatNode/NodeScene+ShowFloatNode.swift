//
//  NodeScene+ShowFloatNode.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/12.
//

import Foundation
import Cocoa
import Combine

extension NodeScene {
    func addShowFloatNode(frame: NSRect) {
        
        let nodeModel = NodeModel<Float>()
        nodeModels[nodeModel.uuid] = nodeModel
        let nodeView = ShowFloatNode(frame: frame)
        nodeViews[nodeModel.uuid] = nodeView
        
        let inputModel = InputModel<Float>()
        inputPinModels[inputModel.uuid] = inputModel
        let inputView = InputPin(frame: NSRect(x: 0, y: 30, width: 30, height: 30))
        inputPinViews[inputModel.uuid] = inputView
        
        nodeView.addSubview(inputView)
        self.addSubview(nodeView)
        
        
        inputModel.$value.sink {value in
            guard let value = value else {
                return
            }
            nodeModel.value = value
        }.store(in: &inputModel.subscriptions)
        
        nodeModel.$value.sink {value in
            guard let value = value else {
                return
            }
            nodeView.textField.stringValue = String(value)
        }.store(in: &nodeModel.subscriptions)
        
        setHoverBinding(model: inputModel)
        
        
    }
}
