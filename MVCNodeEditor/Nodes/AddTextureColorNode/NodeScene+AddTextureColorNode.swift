//
//  NodeScene+AddTextureColorNode.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/18.
//

import Foundation
import Cocoa
import Combine

extension NodeScene {
    func addTextureColorNode(frame: NSRect) {
    
        let nodeModel = NodeModel<String>()
        nodeModels[nodeModel.uuid] = nodeModel
        let nodeView = StaticPlainTextureNode(frame: frame)
        nodeViews[nodeModel.uuid] = nodeView
        
        let outputModel = OutputModel<String>()
        outputPinModels[outputModel.uuid] = outputModel
        let outputView = OutputPin(frame: NSRect(x: frame.width - 30, y: 30, width: 30, height: 30))
        outputPinViews[outputModel.uuid] = outputView
        
        let textureInputModel = InputModel<String>()
        inputPinModels[textureInputModel.uuid] = textureInputModel
        let textureInputView = InputPin(frame: NSRect(x: 0, y: 30, width: 30, height: 30))
        inputPinViews[textureInputModel.uuid] = textureInputView
        
        let redInputModel = InputModel<Float>()
        inputPinModels[redInputModel.uuid] = redInputModel
        let redInputView = InputPin(frame: NSRect(x: 0, y: 70, width: 30, height: 30))
        inputPinViews[redInputModel.uuid] = redInputView
        
        let greenInputModel = InputModel<Float>()
        inputPinModels[greenInputModel.uuid] = greenInputModel
        let greenInputView = InputPin(frame: NSRect(x: 0, y: 110, width: 30, height: 30))
        inputPinViews[greenInputModel.uuid] = greenInputView
        
        let blueInputModel = InputModel<Float>()
        inputPinModels[blueInputModel.uuid] = blueInputModel
        let blueInputView = InputPin(frame: NSRect(x: 0, y: 150, width: 30, height: 30))
        inputPinViews[blueInputModel.uuid] = blueInputView
        
        
        nodeView.addSubview(outputView)
        nodeView.addSubview(textureInputView)
        nodeView.addSubview(redInputView)
        nodeView.addSubview(greenInputView)
        nodeView.addSubview(blueInputView)
        self.addSubview(nodeView)
        
        outputModel.$value.sink { [self] value in
            if outputModel.inputId != nil {
                (inputPinModels[outputModel.inputId!] as? InputModel<String>)?.value = value
            }
        }.store(in: &outputModel.subscriptions)

        outputModel.$inputId.sink { [self] value in
            if value != nil{
                (inputPinModels[value!] as? InputModel<String>)?.value = outputModel.value
            }

        }.store(in: &outputModel.subscriptions)
        
        textureInputModel.$value.sink {value in
            guard let value = value else {
                return
            }
            if redInputModel.value == nil {
                return
            }
            if greenInputModel.value == nil {
                return
            }
            if blueInputModel.value == nil {
                return
            }
            let color = "color = color + float4(" + String(describing: redInputModel.value!) + "," + String(describing: greenInputModel.value!) + ","+String(describing: blueInputModel.value!)+", 0.0);"
            outputModel.value = value + color
        }.store(in: &textureInputModel.subscriptions)
        
        redInputModel.$value.sink {value in
            guard let value = value else {
                return
            }
            if textureInputModel.value == nil {
                return
            }
            if greenInputModel.value == nil {
                return
            }
            if blueInputModel.value == nil {
                return
            }
            let color = "color = color + float4(" + String(describing: value) + "," + String(describing: greenInputModel.value!) + ","+String(describing: blueInputModel.value!)+", 0.0);"
            outputModel.value = textureInputModel.value! + color
        }.store(in: &redInputModel.subscriptions)
        
        greenInputModel.$value.sink {value in
            guard let value = value else {
                return
            }
            if textureInputModel.value == nil {
                return
            }
            if redInputModel.value == nil {
                return
            }
            if blueInputModel.value == nil {
                return
            }
            let color = "color = color + float4(" + String(describing: redInputModel.value!) + "," + String(describing: value) + ","+String(describing: blueInputModel.value!)+", 0.0);"
            outputModel.value = textureInputModel.value! + color
        }.store(in: &greenInputModel.subscriptions)
        
        blueInputModel.$value.sink {value in
            guard let value = value else {
                return
            }
            if textureInputModel.value == nil {
                return
            }
            if redInputModel.value == nil {
                return
            }
            if greenInputModel.value == nil {
                return
            }
            let color = "color = color + float4(" + String(describing: redInputModel.value!) + "," + String(describing: greenInputModel.value!) + ","+String(describing: value)+", 0.0);"
            print(color)
            outputModel.value = textureInputModel.value! + color
        }.store(in: &blueInputModel.subscriptions)
        
        
        setHoverBinding(model: outputModel)
        setHoverBinding(model: textureInputModel)
        setHoverBinding(model: redInputModel)
        setHoverBinding(model: greenInputModel)
        setHoverBinding(model: blueInputModel)
        
    }
}

