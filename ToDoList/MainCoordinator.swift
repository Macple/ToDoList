//
//  MainCoordinator.swift
//  ToDoList
//
//  Created by Maciej Plewko on 10.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import UIKit

import RealmSwift

class MainCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()
    weak var parent: Coordinator?
    fileprivate let sourceNavigationController: UINavigationController
    var realm: Realm?

    init(sourceNC: UINavigationController) {
        self.realm = try? Realm()
        self.sourceNavigationController = sourceNC
    }

    func start() {
        let mainVC = StoryboardScene.Main.instantiateMainViewController()
        mainVC.dataSource = self

        sourceNavigationController.setViewControllers([mainVC], animated: true)
    }

    private func addTask() {
        let task = Task()
        task.title = "Task"
        task.info = "Desription"

        try? realm?.write {
            realm?.add(task)
            print("Task added")
        }
    }
}

extension MainCoordinator: MainDataSource {

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfItemsIn(_ section: Int) -> Int {
        return realm?.objects(Task.self).count ?? 0
    }

    func item(atIndex: Int) -> Task? {
        return realm?.objects(Task.self)[atIndex]
    }
}
