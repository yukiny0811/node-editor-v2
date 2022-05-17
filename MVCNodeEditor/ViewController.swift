//
//  ViewController.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/12.
//

import Cocoa
import Foundation
import Cocoa

class ViewController: NSViewController {
    
    var nodeScene: NodeScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nodeScene = NodeScene(frame: self.view.bounds)
        self.view.addSubview(nodeScene)
        
//        nodeScene.addStaticFloatNode(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
//        nodeScene.addPlusFloatNode(frame: NSRect(x: 100, y: 100, width: 100, height: 100))
//        nodeScene.addShowFloatNode(frame: NSRect(x: 200, y: 200, width: 100, height: 100))
        nodeScene.addStaticPlainTextureNode(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
        nodeScene.addShowTextureNode(frame: NSRect(x: 300, y: 300, width: 512, height: 512))

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

