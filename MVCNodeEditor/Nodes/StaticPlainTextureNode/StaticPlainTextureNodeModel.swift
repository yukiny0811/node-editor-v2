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
    let uuid: UUID = UUID()
    var subscriptions = Set<AnyCancellable>()
    @Published var outputId: UUID? = nil
    var value = PassthroughSubject<String, Never>()
    init() {
        value.send("float4 color = float4(0.0, 0.0, 0.0, 1.0);")
    }
}
