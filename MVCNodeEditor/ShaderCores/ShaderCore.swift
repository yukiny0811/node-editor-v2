//
//  ShaderCore.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/16.
//

import Foundation
import MetalKit

class ShaderCore {
    public static let shared = ShaderCore()
    
    private(set) public var device: MTLDevice!
    private(set) public lazy var library: MTLLibrary = {
        return self.device.makeDefaultLibrary()!
    }()
    private(set) public lazy var commandQueue: MTLCommandQueue = {
        return self.device.makeCommandQueue()!
    }()
    
    private init() {
        device = MTLCreateSystemDefaultDevice()
    }
    
    public func setNewLibrary(source: String) {
//        self.library = try! self.device.makeLibrary(source: source, options: nil)
        print("library set ??")
        do {
            self.library = try self.device.makeLibrary(source: source, options: nil)
        } catch {
            print("library error")
        }
    }
}
