//
//  ShowFloatNodeModel.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/12.
//

import Foundation
import Combine
import Cocoa

class ShowFloatNodeModel : NodeModelBase {
    let uuid: UUID = UUID()
    var subscriptions = Set<AnyCancellable>()
    @Published var inputId: UUID? = nil
    @Published var value: Float = 0.0
    init() {
    }
}
