//
//  StringInputPinModel.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/17.
//

import Foundation
import Cocoa
import Combine


class StringInputPinModel: InputModelBase {
    let uuid: String = UUID().uuidString
    var subscriptions = Set<AnyCancellable>()
    @Published var value: String = ""
    var outputId: String? = nil
    init() {
        
    }
}
