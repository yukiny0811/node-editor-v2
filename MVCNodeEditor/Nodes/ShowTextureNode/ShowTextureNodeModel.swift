//
//  ShowTextureNodeModel.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/17.
//

import Foundation
import Combine
import Cocoa

class ShowTextureNodeModel : NodeModelBase {
    let uuid: String = UUID().uuidString
    var subscriptions = Set<AnyCancellable>()
    @Published var inputId: String? = nil
    @Published var value: String = ""
    init() {
    }
}
