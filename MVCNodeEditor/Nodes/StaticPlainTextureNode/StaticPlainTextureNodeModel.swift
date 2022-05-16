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
    var outputId: UUID? = nil
    @Published var value: String = ""
    init() {
        
    }
}
