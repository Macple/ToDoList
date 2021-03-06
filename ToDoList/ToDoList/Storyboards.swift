// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable type_body_length

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: StoryboardSegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

struct StoryboardScene {
  enum LaunchScreen: StoryboardSceneType {
    static let storyboardName = "LaunchScreen"
  }
  enum Main: String, StoryboardSceneType {
    static let storyboardName = "Main"

    static func initialViewController() -> UINavigationController {
      guard let vc = storyboard().instantiateInitialViewController() as? UINavigationController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case mainViewControllerScene = "MainViewController"
    static func instantiateMainViewController() -> ToDoList.MainViewController {
      guard let vc = StoryboardScene.Main.mainViewControllerScene.viewController() as? ToDoList.MainViewController
      else {
        fatalError("ViewController 'MainViewController' is not of the expected class ToDoList.MainViewController.")
      }
      return vc
    }
  }
  enum SingleTask: String, StoryboardSceneType {
    static let storyboardName = "SingleTask"

    static func initialViewController() -> UINavigationController {
      guard let vc = storyboard().instantiateInitialViewController() as? UINavigationController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case singleTaskViewControllerScene = "SingleTaskViewController"
    static func instantiateSingleTaskViewController() -> ToDoList.SingleTaskViewController {
      guard let vc = StoryboardScene.SingleTask.singleTaskViewControllerScene.viewController() as? ToDoList.SingleTaskViewController
      else {
        fatalError("ViewController 'SingleTaskViewController' is not of the expected class ToDoList.SingleTaskViewController.")
      }
      return vc
    }
  }
}

struct StoryboardSegue {
}
