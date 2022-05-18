//
//  NodeScene+StaticPlainTextureNode.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/17.
//

import Foundation
import Cocoa
import Combine

extension NodeScene {
    func addStaticPlainTextureNode(frame: NSRect) {
    
        let nodeModel = NodeModel<String>()
        nodeModels[nodeModel.uuid] = nodeModel
        let nodeView = StaticPlainTextureNode(frame: frame)
        nodeViews[nodeModel.uuid] = nodeView
        
        let outputModel = OutputModel<String>()
        outputPinModels[outputModel.uuid] = outputModel
        let outputView = OutputPin(frame: NSRect(x: frame.width - 30, y: 30, width: 30, height: 30))
        outputPinViews[outputModel.uuid] = outputView
        
        nodeView.addSubview(outputView)
        self.addSubview(nodeView)
        
        nodeModel.$value.sink { value in
            outputModel.value = value
        }.store(in: &nodeModel.subscriptions)
        
        outputModel.$value.sink { [self] value in
            if outputModel.inputId != nil {
                (inputPinModels[outputModel.inputId!] as? InputModel<String>)?.value = value
            }
        }.store(in: &outputModel.subscriptions)

        outputModel.$inputId.sink { [self] value in
            nodeModel.value = "float4 color = float4(0.0, 1.0, 0.0, 1.0);"
            if value != nil {
                (inputPinModels[value!] as? InputModel<String>)?.value = outputModel.value
            }

        }.store(in: &outputModel.subscriptions)
        
        
        outputView.$isHovering.sink { value in
            print("outputView hovering")
            if value == true {
                print("outputView hovering true")
                self.hoveringPinId = outputModel.uuid
            } else {
                print("outputView hovering false")
                self.hoveringPinId = nil
            }
        }.store(in: &outputView.subscriptions)
        
    }
}
