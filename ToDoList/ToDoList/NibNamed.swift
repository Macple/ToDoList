//
//  NibNamed.swift
//  ToDoList
//
//  Created by Maciej Plewko on 10.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import UIKit

protocol NibNamed {}

extension UITableViewCell: NibNamed {}
extension UICollectionViewCell: NibNamed {}

extension NibNamed where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
