//
//  AppCoordinator.swift
//  ToDoList
//
//  Created by Maciej Plewko on 10.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {

    static let PresentAsRootController = "PresentAsRootController"
    static let CoordinatorKey = "coordinator"

    var childCoordinators: [Coordinator] = [Coordinator]()
    weak var parent: Coordinator?

    private weak var navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        observeNotification()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func start() {
        startChild(coordinator: MainCoordinator(sourceNC: navigationController))
    }

    private func observeNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(presentAsRootControllerNotification(notification:)),
                                               name: NSNotification.Name(rawValue: AppCoordinator.PresentAsRootController), object: nil)
    }

    @objc private func presentAsRootControllerNotification(notification: Notification) {
        DispatchQueue.main.async {
            guard let coordinator = notification.userInfo?[AppCoordinator.CoordinatorKey] as? Coordinator else {
                return
            }

            self.childCoordinators.removeAll()
            self.startChild(coordinator: coordinator)
        }
    }
}
