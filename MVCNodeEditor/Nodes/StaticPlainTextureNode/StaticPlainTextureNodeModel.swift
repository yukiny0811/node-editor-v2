//
//  StaticPlainTextureNodeModel.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/16.
//

import Foundation
import Cocoa
import Combine

class StaticPlainTextureNodeModel: NodeModelBase {
    let uuid: String = UUID().uuidString
    var subscriptions = Set<AnyCancellable>()
    @Published var outputId: String? = nil
    var value = CurrentValueSubject<String, Never>("float4 color = float4(0.0, 1.0, 0.0, 1.0);")
    init() {
    }
}
