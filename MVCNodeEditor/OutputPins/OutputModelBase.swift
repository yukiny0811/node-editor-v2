//
//  OutputModelBase.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/18.
//

import Foundation
import Combine

class OutputModelBase {
    let uuid: String = UUID().uuidString
    var subscriptions = Set<AnyCancellable>()
    @Published var inputId: String? = nil
}
