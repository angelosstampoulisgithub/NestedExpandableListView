//
//  ViewController.swift
//  NestedExpandableListView
//
//  Created by Angelos Staboulis on 22/9/25.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let tableView = UITableView()
    let viewModel = ViewModel()
    var flatList: [(Node, Int)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        viewModel.createData()
        flatList = viewModel.flattenTree(viewModel.rootNode)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flatList.count
    }
    func initTableView(){
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension ViewController{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let (node, depth) = flatList[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = node.title
        cell.indentationLevel = depth
        cell.accessoryType = node.children.isEmpty ? .none : .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let (node, _) = flatList[indexPath.row]
        if !node.children.isEmpty {
            node.isExpanded.toggle()
            flatList = viewModel.flattenTree(viewModel.rootNode)
            tableView.reloadData()
        }
    }
}
