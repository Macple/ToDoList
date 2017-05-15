//
//  SingleTaskCoordinator.swift
//  ToDoList
//
//  Created by Maciej Plewko on 11.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import UIKit

class SingleTaskCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()
    weak var parent: Coordinator?
    fileprivate var taskToEdit: Task?
    fileprivate let sourceNavigationController: UINavigationController

    init(with sourceNC: UINavigationController, task: Task? = nil) {
        self.sourceNavigationController = sourceNC
        self.taskToEdit = task
    }

    func start() {
        let singleTaskVC = StoryboardScene.SingleTask.instantiateSingleTaskViewController()
        singleTaskVC.delegate = self
        singleTaskVC.dataSource = self

        sourceNavigationController.pushViewController(singleTaskVC, animated: true)
    }
}

extension SingleTaskCoordinator: SingleTaskVCDelegate {

    func saveButtonTapped(title: String, description: String) {
        if let task = taskToEdit {
            try? realm.write {
                task.title = title
                task.info = description
                realm.add(task, update: true)
            }
        } else {
            try? realm.write {
                realm.add(Task(title: title, info: description))
            }
        }

        sourceNavigationController.popViewController(animated: true)
        self.removeFromParentCoordinator()
    }
}

extension SingleTaskCoordinator: SingleTaskVCDataSource {

    func editedTask() -> Task? {
        return taskToEdit
    }
}
