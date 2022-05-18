//
//  InputPin.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/18.
//

import Foundation
import Cocoa
import Combine

class InputPin: NSView {
    var subscriptions = Set<AnyCancellable>()
    
    @Published var isHovering = false
    
    override init(frame: NSRect) {
        super.init(frame: frame)
        wantsLayer = true
        layer?.backgroundColor = NSColor.gray.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func mouseEntered(with event: NSEvent) {
        self.layer?.backgroundColor = NSColor.yellow.cgColor
        isHovering = true
    }
    
    override func mouseExited(with event: NSEvent) {
        self.layer?.backgroundColor = NSColor.gray.cgColor
        isHovering = false
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
