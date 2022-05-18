//
//  NodeModelBase.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/12.
//

import Foundation
import Combine

class NodeModelBase {
    let uuid: String = UUID().uuidString
    var subscriptions = Set<AnyCancellable>()
}
