//
//  StaticFloatNodeModel.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/12.
//

import Foundation
import Cocoa
import Combine

class StaticFloatNodeModel: NodeModelBase {
    let uuid: String = UUID().uuidString
    var subscriptions = Set<AnyCancellable>()
    var outputId: String? = nil
    @Published var value: Float = 0.0
    init() {
        
    }
}

