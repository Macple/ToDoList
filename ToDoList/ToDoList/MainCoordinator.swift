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

    init(with sourceNC: UINavigationController) {
        self.sourceNavigationController = sourceNC
    }

    func start() {
        let mainVC = StoryboardScene.Main.instantiateMainViewController()
        mainVC.dataSource = self
        mainVC.delegate = self

        sourceNavigationController.setViewControllers([mainVC], animated: true)
    }
}

extension MainCoordinator: MainVCDataSource {

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfItemsIn(_ section: Int) -> Int {
        return realm.objects(Task.self).count
    }

    func item(atIndex: Int) -> Task? {
        return realm.objects(Task.self)[atIndex]
    }
}

extension MainCoordinator: MainVCDelegate {

    func addTaskTapped() {
        self.startChild(coordinator: SingleTaskCoordinator(with: sourceNavigationController))
    }

    func editTaskTapped(atIndex: Int) {
        let editedTask = realm.objects(Task.self)[atIndex]
        self.startChild(coordinator: SingleTaskCoordinator(with: sourceNavigationController, task: editedTask))
    }
}
