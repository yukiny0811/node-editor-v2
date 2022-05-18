//
//  NodeScene+mouse.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/18.
//

import Foundation
import Combine
import Cocoa

extension NodeScene {
    override func mouseDragged(with event: NSEvent) {
        super.mouseDragged(with: event)
        self.needsDisplay = true
        mousePoint = event.locationInWindow
        if selectedPinId == nil {
            return
        }
    }
    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        self.needsDisplay = true
        mousePoint = event.locationInWindow
        self.selectedPinId = self.hoveringPinId
    }
    
    override func mouseUp(with event: NSEvent) {
        super.mouseUp(with: event)
        self.needsDisplay = true
        if self.selectedPinId != nil {
            if self.hoveringPinId != nil {
                self.targetPinId = self.hoveringPinId
                guard outputPinModels[self.selectedPinId!] != nil else {
                    return
                }
                guard inputPinModels[self.targetPinId!] != nil else {
                    return
                }
                outputPinModels[selectedPinId!]?.inputId = targetPinId
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
