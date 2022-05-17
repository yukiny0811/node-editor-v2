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
    
        let nodeModel = StaticPlainTextureNodeModel()
        nodeModels[nodeModel.uuid] = nodeModel
        let nodeView = StaticPlainTextureNode(frame: frame)
        nodeViews[nodeModel.uuid] = nodeView
        
        let outputModel = StringOutputPinModel()
        outputPinModels[outputModel.uuid] = outputModel
        let outputView = StringOutputPin(frame: NSRect(x: frame.width - 30, y: 30, width: 30, height: 30))
        outputPinViews[outputModel.uuid] = outputView
        
        nodeView.addSubview(outputView)
        self.addSubview(nodeView)
        
        nodeModel.value.sink { value in
            print("nodeModelValue:::", value)
            outputModel.value = value
        }.store(in: &nodeModel.subscriptions)
        
        outputModel.$value.sink { [self] value in
            print("outpu value: ", value)
            if outputModel.inputId != nil {
                print("yobareteru?")
                (inputPinModels[outputModel.inputId!] as? StringInputPinModel)?.value = value
            }
        }.store(in: &outputModel.subscriptions)

        outputModel.$inputId.sink { [self] value in

            print("inputid::: ", value)
            print("outputModel:::", outputModel.value)
            print("outputinput::", outputModel.inputId)
            nodeModel.value.send("float4 color = float4(0.0, 1.0, 0.0, 1.0);")

            if value != nil {
                (inputPinModels[value!] as? StringInputPinModel)?.value = outputModel.value
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
