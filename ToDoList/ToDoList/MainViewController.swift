//
//  MainViewController.swift
//  ToDoList
//
//  Created by Maciej Plewko on 08.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import UIKit

protocol MainVCDataSource: class {
    func numberOfSections() -> Int
    func numberOfItemsIn(_ section: Int) -> Int
    func item(atIndex: Int) -> Task?
}

protocol MainVCDelegate: class {
    func addTaskTapped()
}

class MainViewController: UIViewController {

    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var addTaskButton: UIBarButtonItem!

    weak var dataSource: MainVCDataSource?
    weak var delegate: MainVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.backgroundColor = UIColor.clear
        tableView.register(MainTableViewCell.nib, forCellReuseIdentifier: MainTableViewCell.nibName)
    }

    @IBAction private func addTaskTapped(_ sender: Any) {
        delegate?.addTaskTapped()
    }
}

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
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
