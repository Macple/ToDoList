//
//  AddTaskCoordinator.swift
//  ToDoList
//
//  Created by Maciej Plewko on 11.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import UIKit

class SingleTaskCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()
    weak var parent: Coordinator?
    fileprivate let sourceNavigationController: UINavigationController

    init(with sourceNC: UINavigationController) {
        self.sourceNavigationController = sourceNC
    }

    func start() {
        let singleTaskVC = StoryboardScene.SingleTask.instantiateSingleTaskViewController()
        singleTaskVC.delegate = self

        sourceNavigationController.pushViewController(singleTaskVC, animated: true)
    }
}

extension SingleTaskCoordinator: SingleTaskVCDelegate {

    func saveButtonTapped(title: String, description: String) {
        try? realm.write {
            realm.add(Task(title: title, info: description))
        }

        sourceNavigationController.popViewController(animated: true)
        self.removeFromParentCoordinator()
    }
}
