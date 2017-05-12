//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Maciej Plewko on 11.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import UIKit

protocol SingleTaskVCDelegate: class {
    func saveButtonTapped(title: String, description: String)
}

class SingleTaskViewController: UIViewController {

    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var titleTextField: UITextField!
    @IBOutlet fileprivate weak var descriptionLabel: UILabel!
    @IBOutlet fileprivate weak var descriptionTextView: UITextView!

    weak var delegate: SingleTaskVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        delegate?.saveButtonTapped(title: titleTextField.text ?? "", description: descriptionTextView.text)
    }
}
