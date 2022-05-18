//
//  InputModel.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/18.
//

import Foundation
import Combine


class InputModel<T>: InputModelBase{
    @Published var value: T? = nil
}
