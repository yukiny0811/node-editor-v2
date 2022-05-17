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
    let uuid: String = UUID().uuidString
    var subscriptions = Set<AnyCancellable>()
    @Published var inputId: String? = nil
    @Published var value: Float = 0.0
    init() {
    }
}
