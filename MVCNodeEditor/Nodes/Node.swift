//
//  Node.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/18.
//

import Foundation
import Combine
import Cocoa

class Node: NSView {
    var subscriptions = Set<AnyCancellable>()
    override init(frame: NSRect) {
        super.init(frame: frame)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.magenta.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
