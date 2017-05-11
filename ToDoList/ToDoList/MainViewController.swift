//
//  MainViewController.swift
//  ToDoList
//
//  Created by Maciej Plewko on 08.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import UIKit

protocol MainDataSource: class {
    func numberOfSections() -> Int
    func numberOfItemsIn(_ section: Int) -> Int
    func item(atIndex: Int) -> Task?
}

class MainViewController: UIViewController {

    @IBOutlet fileprivate weak var tableView: UITableView!

    weak var dataSource: MainDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.backgroundColor = UIColor.clear
        tableView.register(MainTableViewCell.nib, forCellReuseIdentifier: MainTableViewCell.nibName)
    }
}

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected.")
    }
}

extension MainViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections() ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.numberOfItemsIn(section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.nibName, for: indexPath)

        if let cell = cell as? MainTableViewCell, let item = dataSource?.item(atIndex: indexPath.row) {
            cell.configureWith(MainTableViewCellModel(title: item.title, description: item.info))
        }

        return cell
    }
}
