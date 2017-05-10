//
//  Coordinator.swift
//  ToDoList
//
//  Created by Maciej Plewko on 10.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import UIKit

protocol Coordinator: class {

    var childCoordinators: [Coordinator] { get set }
    weak var parent: Coordinator? { set get }

    func start()
    func startChild(coordinator: Coordinator)
    func removeChildCoordinator(coordinator: Coordinator)
    func removeFromParentCoordinator()
}

extension Coordinator {

    func startChild(coordinator: Coordinator) {
        coordinator.parent = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }

    func removeChildCoordinator(coordinator: Coordinator) {
        guard let index = childCoordinators.index(where: {$0 === coordinator}) else {
            fatalError("Attempt to remove child coordinator that is no longer in a hierarchy.")
        }

        childCoordinators.remove(at: index)
    }

    func removeFromParentCoordinator() {
        for child in childCoordinators {
            removeChildCoordinator(coordinator: child)
        }

        parent?.removeChildCoordinator(coordinator: self)
    }
}
