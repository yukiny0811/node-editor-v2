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
    let uuid: UUID = UUID()
    var subscriptions = Set<AnyCancellable>()
    @Published var inputId: UUID? = nil
    @Published var value: String = "float4 color = float4(0.0, 0.0, 0.0, 1.0);"
    init() {
    }
}
