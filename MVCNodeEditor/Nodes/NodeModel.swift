//
//  NodeModel.swift
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/18.
//

import Foundation
import Combine


class NodeModel<T>: NodeModelBase {
    @Published var value: T? = nil
    override init() {
        
    }
}
