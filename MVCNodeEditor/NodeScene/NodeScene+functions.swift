//
//  NodeScene+functions.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/18.
//

import Foundation
import Combine
import Cocoa

extension NodeScene {
    
    func setHoverBinding<T>(model: InputModel<T>) {
        inputPinViews[model.uuid]?.$isHovering.sink {value in
            if value == true {
                self.hoveringPinId = model.uuid
            } else {
                self.hoveringPinId = nil
            }
        }.store(in: &inputPinViews[model.uuid]!.subscriptions)
    }
    
    func setHoverBinding<T>(model: OutputModel<T>) {
        outputPinViews[model.uuid]?.$isHovering.sink {value in
            if value == true {
                self.hoveringPinId = model.uuid
            } else {
                self.hoveringPinId = nil
            }
        }.store(in: &outputPinViews[model.uuid]!.subscriptions)
    }
}
