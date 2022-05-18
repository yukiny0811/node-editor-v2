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
        
        for connection in connections {
            let path = NSBezierPath()
            NSColor.red.setStroke()
            let outPoint = outputPinViews[connection.output]?.superview?.convert((outputPinViews[connection.output]?.frame.origin)!, to: self)
            let inPoint = inputPinViews[connection.input]?.superview?.convert((inputPinViews[connection.input]?.frame.origin)!, to: self)
            path.move(to: outPoint!)
            path.line(to: inPoint!)
            path.lineWidth = 5.0
            path.stroke()
            path.fill()
            path.close()
        }
        
        let path = NSBezierPath()
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
        path.move(to: outPoint!)
        path.line(to: mousePoint!)
        path.lineWidth = 5.0
        path.stroke()
        path.fill()
        path.close()
    }
}
