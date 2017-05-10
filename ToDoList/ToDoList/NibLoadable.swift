//
//  NibLoadable.swift
//  ToDoList
//
//  Created by Maciej Plewko on 10.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import UIKit

public protocol NibLoadable: class {
    static var nib: UINib { get }
}

public extension NibLoadable {

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

public extension NibLoadable where Self: UIView {

    @discardableResult
    static func loadFromNibWithOwner(owner: Self = Self()) -> Self {
        let layoutAttributes: [NSLayoutAttribute] = [.top, .leading, .bottom, .trailing]
        for view in nib.instantiate(withOwner: owner, options: nil) {
            if let view = view as? UIView {
                view.translatesAutoresizingMaskIntoConstraints = false
                owner.addSubview(view)
                layoutAttributes.forEach { attribute in
                    owner.addConstraint(NSLayoutConstraint(item: view,
                                                           attribute: attribute,
                                                           relatedBy: .equal,
                                                           toItem: owner,
                                                           attribute: attribute,
                                                           multiplier: 1,
                                                           constant: 0.0))
                }
            }
        }
        return owner
    }

    static func loadFromNibWithoutOwner() -> Self {
        guard  let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("Nib does not contain an instance of \(String(describing: self)) as first member")
        }

        return view
    }
}
