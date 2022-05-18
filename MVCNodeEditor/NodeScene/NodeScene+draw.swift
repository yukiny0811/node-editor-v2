//
//  NodeScene+draw.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/18.
//

import Foundation
import Combine
import Cocoa

extension NodeScene {
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let path = NSBezierPath()
        for connection in connections {
            
            NSColor.red.setStroke()
            let outPoint = outputPinViews[connection.output]?.superview?.convert((outputPinViews[connection.output]?.frame.origin)!, to: self)
            let inPoint = inputPinViews[connection.input]?.superview?.convert((inputPinViews[connection.input]?.frame.origin)!, to: self)
            path.move(to: outPoint!)
            path.line(to: inPoint!)
            path.lineWidth = 5.0
            path.stroke()
            path.fill()
            
        }
        path.close()
        
        let path2 = NSBezierPath()
        if selectedPinId == nil {
            return
        }
        if mousePoint == nil {
            return
            
        }
        if outputPinViews[selectedPinId!] == nil {
            return
            
        }
        NSColor.red.setStroke()
        let outPoint = outputPinViews[selectedPinId!]?.superview?.convert((outputPinViews[selectedPinId!]?.frame.origin)!, to: self)
        path2.move(to: outPoint!)
        path2.line(to: mousePoint!)
        path2.lineWidth = 5.0
        path2.stroke()
        path2.fill()
        path2.close()
        self.needsDisplay = true
    }
}
