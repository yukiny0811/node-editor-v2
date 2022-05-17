//
//  StringOutputPinModel.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/17.
//

import Foundation
import Cocoa
import Combine

class StringOutputPinModel: OutputModelBase {
    let uuid: UUID = UUID()
    var subscriptions = Set<AnyCancellable>()
    @Published var value: String = ""
    override init() {
        
    }
}
