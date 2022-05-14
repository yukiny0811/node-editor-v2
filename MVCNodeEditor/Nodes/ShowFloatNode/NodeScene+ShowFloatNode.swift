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
        
        let nodeModel = ShowFloatNodeModel()
        nodeModels[nodeModel.uuid] = nodeModel
        let nodeView = ShowFloatNode(frame: frame)
        nodeViews[nodeModel.uuid] = nodeView
        
        let inputModel = FloatInputPinModel()
        inputPinModels[inputModel.uuid] = inputModel
        let inputView = FloatInputPin(frame: NSRect(x: 0, y: 30, width: 30, height: 30))
        inputPinViews[inputModel.uuid] = inputView
        
        nodeView.addSubview(inputView)
        self.addSubview(nodeView)
        
        
        inputModel.$value.sink {value in
            nodeModel.value = value
        }.store(in: &inputModel.subscriptions)
        
        nodeModel.$value.sink {value in
            nodeView.textField.stringValue = String(value)
        }.store(in: &nodeModel.subscriptions)
        
        inputView.$isHovering.sink { value in
            if value == true {
                self.hoveringPinId = inputModel.uuid
            } else {
                self.hoveringPinId = nil
            }
        }.store(in: &inputView.subscriptions)
        
        
    }
}
