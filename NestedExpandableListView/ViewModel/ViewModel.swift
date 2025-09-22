//
//  ViewModel.swift
//  NestedExpandableListView
//
//  Created by Angelos Staboulis on 22/9/25.
//

import Foundation
class ViewModel{
    var rootNode: Node!
    func createData(){
        rootNode = Node(title: "Root", children: [
        Node(title: "Fruits", children: [
        Node(title: "Apple"),
        Node(title: "Banana"),
        Node(title: "Citrus", children: [
        Node(title: "Orange"),
        Node(title: "Lemon")
                ])
        ]),
        Node(title: "Vegetables", children: [
                Node(title: "Carrot"),
                Node(title: "Broccoli")
            ])
    ])
}
    func flattenTree(_ node: Node, depth: Int = 0) -> [(Node, Int)] {
        var result: [(Node, Int)] = [(node, depth)]
        if node.isExpanded {
            for child in node.children {
                result += flattenTree(child, depth: depth + 1)
            }
        }
        return result
    }
}
