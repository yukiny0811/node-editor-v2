//
//  NodeScene+AddShowTextureNode.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/16.
//

import Foundation
import Cocoa
import Combine

extension NodeScene {
    func addShowTextureNode(frame: NSRect) {
        
        let nodeModel = NodeModel<String>()
        nodeModels[nodeModel.uuid] = nodeModel
        let nodeView = ShowTextureNode(frame: frame)
        nodeViews[nodeModel.uuid] = nodeView
        
        let inputModel = InputModel<String>()
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
            ShaderCore.shared.setNewLibrary(source: "#include <metal_stdlib> \n using namespace metal; kernel void test(   texture2d<float, access::write> tex [[texture(0)]],texture2d<float, access::read> subRead1 [[texture(1)]], texture2d<float, access::write> subWrite1 [[texture(2)]],device float* args [[buffer(0)]], ushort2 gid [[thread_position_in_grid]]) {" + value + "tex.write(color, gid);}")
            nodeView.renderer = Renderer(functionName: "test", width: 512, height: 512)
            nodeView.metalView.delegate = nodeView.renderer
        }.store(in: &nodeModel.subscriptions)
        
        setHoverBinding(model: inputModel)
    }
}
