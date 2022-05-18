//
//  OutputModel.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/18.
//

import Foundation
import Combine

class OutputModel<T>: OutputModelBase {
    @Published var value: T? = nil
}

