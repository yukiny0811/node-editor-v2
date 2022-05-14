//
//  FloatInputPinModel.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/12.
//

import Foundation
import Cocoa
import Combine


class FloatInputPinModel: InputModelBase {
    let uuid: UUID = UUID()
    var subscriptions = Set<AnyCancellable>()
    @Published var value: Float = 0.0
    var outputId: UUID? = nil
    init() {
        
    }
}
