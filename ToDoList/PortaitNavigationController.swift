//
//  PortaitNavigationController.swift
//  ToDoList
//
//  Created by Maciej Plewko on 10.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import UIKit

class PortraitNavigationController: UINavigationController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    //swiftlint:disable:next variable_name
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
