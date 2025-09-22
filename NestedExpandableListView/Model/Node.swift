//
//  Node.swift
//  NestedExpandableListView
//
//  Created by Angelos Staboulis on 22/9/25.
//

import Foundation
class Node {
    let title: String
    var children: [Node]
    var isExpanded: Bool = false

    init(title: String, children: [Node] = []) {
        self.title = title
        self.children = children
    }
}
