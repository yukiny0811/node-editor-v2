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
    let uuid: UUID = UUID()
    var subscriptions = Set<AnyCancellable>()
    @Published var outputId: UUID? = nil
    @Published var inputId: UUID? = nil
    @Published var value: Float = 0.0
    init() {
        
    }
}
