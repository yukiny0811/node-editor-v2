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
    let uuid: UUID = UUID()
    var subscriptions = Set<AnyCancellable>()
    @Published var value: String = ""
    var outputId: UUID? = nil
    init() {
        
    }
}
