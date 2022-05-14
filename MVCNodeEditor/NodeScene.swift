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
    
    var nodeModels: [UUID: NodeModelBase] = [:]
    var nodeViews: [UUID: NSView] = [:]
    
    var inputPinModels: [UUID: InputModelBase] = [:]
    var inputPinViews: [UUID: NSView] = [:]
    
    var outputPinModels: [UUID: OutputModelBase] = [:]
    var outputPinViews: [UUID: NSView] = [:]
    
    var hoveringPinId: UUID? = nil
    var selectedPinId: UUID? = nil
    var targetPinId: UUID? = nil
    
    var connections: [(output: UUID, input: UUID)] = []
    
    var mousePoint: NSPoint? = nil
    
    override init(frame: NSRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("erorrrrr")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        for connection in connections {
            print("test")
            let path = NSBezierPath()
            NSColor.red.setStroke()
            let outPoint = outputPinViews[connection.output]?.superview?.convert((outputPinViews[connection.output]?.frame.origin)!, to: self)
            let inPoint = inputPinViews[connection.input]?.superview?.convert((inputPinViews[connection.input]?.frame.origin)!, to: self)
//            path.move(to: NSPoint(
//                x: (outputPinViews[connection.output]?.layer?.position.x)!,
//                y: (outputPinViews[connection.output]?.layer?.position.y)!
//            ))
//            print(inputPinViews[connection.input]?.layer?.superlayer)
//            path.line(to: NSPoint(
//                x: (inputPinViews[connection.input]?.layer?.position.x)!,
//                y: (inputPinViews[connection.input]?.layer?.position.y)!
//            ))
            path.move(to: outPoint!)
            path.line(to: inPoint!)
            path.lineWidth = 5.0
            path.stroke()
            path.fill()
            path.close()
        }
        
        let path = NSBezierPath()
        if selectedPinId == nil {
            print("error1")
            return
        }
        if mousePoint == nil {
            print("error2")
            return
            
        }
        if outputPinViews[selectedPinId!] == nil {
            print("error3")
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
    
//    override func mouseMoved(with event: NSEvent) {
//        super.mouseMoved(with: event)
//        mousePoint = event.locationInWindow
//        if selectedPinId == nil { return }
//
//        self.needsDisplay = true
//    }
    
    override func mouseDragged(with event: NSEvent) {
        super.mouseDragged(with: event)
        self.needsDisplay = true
        mousePoint = event.locationInWindow
        if selectedPinId == nil {return}
        
    }
    
    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        self.needsDisplay = true
        print(self.hoveringPinId)
        mousePoint = event.locationInWindow
        self.selectedPinId = self.hoveringPinId
    }
    
    override func mouseUp(with event: NSEvent) {
        super.mouseUp(with: event)
        self.needsDisplay = true
        if self.selectedPinId != nil {
            if self.hoveringPinId != nil {
                self.targetPinId = self.hoveringPinId
                ///TODO
                guard outputPinModels[self.selectedPinId!] != nil else {
                    return
                }
                guard inputPinModels[self.targetPinId!] != nil else {
                    return
                }
                outputPinModels[self.selectedPinId!]!.inputId = self.targetPinId
                connections.append((output: self.selectedPinId!, input: self.targetPinId!))
                selectedPinId = nil
                targetPinId = nil
            } else {
                self.selectedPinId = nil
            }
        }
    }
    
    override func updateTrackingAreas() {
        super.updateTrackingAreas()

        for trackingArea in self.trackingAreas {
            self.removeTrackingArea(trackingArea)
        }
        
        let options: NSTrackingArea.Options = [.mouseEnteredAndExited, .activeAlways, .mouseMoved, .enabledDuringMouseDrag]
        let trackingArea = NSTrackingArea(rect: self.bounds, options: options, owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea)
    }
}
