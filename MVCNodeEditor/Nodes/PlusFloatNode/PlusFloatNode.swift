//
//  PlusFloatNode.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/13.
//

import Foundation
import Combine
import Cocoa

class PlusFloatNode: Node {
    let textField: NSTextField
    override init(frame: NSRect) {
        textField = NSTextField()
        super.init(frame: frame)
        textField.allowsEditingTextAttributes = false
        self.layer?.backgroundColor = NSColor.blue.cgColor
        textField.frame = NSRect(x: 0, y: 0, width: frame.width, height: 30)
        self.addSubview(textField)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
