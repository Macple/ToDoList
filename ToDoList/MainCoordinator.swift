//
//  MainCoordinator.swift
//  ToDoList
//
//  Created by Maciej Plewko on 10.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()
    weak var parent: Coordinator?
    fileprivate let sourceNavigationController: UINavigationController

    init(sourceNC: UINavigationController) {
        self.sourceNavigationController = sourceNC
    }

    func start() {
        let mainVC = StoryboardScene.Main.instantiateMainViewController()
        mainVC.dataSource = self

        sourceNavigationController.setViewControllers([mainVC], animated: true)
    }
}

extension MainCoordinator: MainDataSource {

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfItemsIn(_ section: Int) -> Int {
        return 10
    }
}
