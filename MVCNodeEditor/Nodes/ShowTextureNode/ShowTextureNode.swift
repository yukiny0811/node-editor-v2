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

class ShowTextureNode: NSView {
    
    var renderer: Renderer?
    var subscriptions = Set<AnyCancellable>()
    override init(frame: NSRect) {
        super.init(frame: frame)
        
        renderer = Renderer(functionName: "test", width: 512, height: 512)
        
        let metalView = MTKView(frame: NSRect(x: 0, y: 0, width: 512, height: 512), device: ShaderCore.shared.device)
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

