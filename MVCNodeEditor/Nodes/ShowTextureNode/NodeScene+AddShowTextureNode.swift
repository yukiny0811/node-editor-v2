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
        
        let nodeView = ShowTextureNode(frame: frame)
        self.addSubview(nodeView)
    }
}
