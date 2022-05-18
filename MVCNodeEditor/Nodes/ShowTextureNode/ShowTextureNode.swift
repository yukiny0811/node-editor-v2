//
//  ShowTextureNode.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/16.
//

import Foundation
import Combine
import Cocoa
import MetalKit
import simd

class ShowTextureNode: Node {
    
    var renderer: Renderer?
    var metalView: MTKView!
    override init(frame: NSRect) {
        super.init(frame: frame)
        
        ///MARK testing
        ShaderCore.shared.setNewLibrary(source: "#include <metal_stdlib> \n using namespace metal; kernel void test(   texture2d<float, access::write> tex [[texture(0)]],texture2d<float, access::read> subRead1 [[texture(1)]], texture2d<float, access::write> subWrite1 [[texture(2)]],device float* args [[buffer(0)]], ushort2 gid [[thread_position_in_grid]]) {float4 color = float4(0.0, 0.0, 0.0, 1.0);tex.write(color, gid);}")
        renderer = Renderer(functionName: "test", width: 512, height: 512)
        
        metalView = MTKView(frame: NSRect(x: 0, y: 0, width: 512, height: 512), device: ShaderCore.shared.device)
        metalView.colorPixelFormat = .bgra8Unorm
        metalView.framebufferOnly = false
        metalView.drawableSize = metalView.frame.size
        metalView.delegate = renderer
        self.addSubview(metalView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

