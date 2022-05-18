//
//  NodeScene.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/12.
//

import Foundation
import Cocoa
import Combine

class NodeScene: NSView {
    
    var nodeModels: [String: NodeModelBase] = [:]
    var nodeViews: [String: Node] = [:]
    
    var inputPinModels: [String: InputModelBase] = [:]
    var inputPinViews: [String: InputPin] = [:]
    
    var outputPinModels: [String: OutputModelBase] = [:]
    var outputPinViews: [String: OutputPin] = [:]
    
    var hoveringPinId: String? = nil
    var selectedPinId: String? = nil
    var targetPinId: String? = nil
    
    var connections: [(output: String, input: String)] = []
    
    var mousePoint: NSPoint? = nil
    
    var selectedNodeId: String? = nil
    
    override init(frame: NSRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("erorrrrr")
    }
}
