//
//  PlusFloatNodeModel.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/13.
//

import Foundation
import Cocoa
import Combine

class PlusFloatNodeModel: NodeModelBase {
    let uuid: String = UUID().uuidString
    var subscriptions = Set<AnyCancellable>()
    @Published var outputId: String? = nil
    @Published var inputId: String? = nil
    @Published var value: Float = 0.0
    init() {
        
    }
}
