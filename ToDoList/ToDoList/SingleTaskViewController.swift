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

protocol SingleTaskVCDataSource: class {
    func editedTask() -> Task?
}

class SingleTaskViewController: UIViewController {

    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var titleTextField: UITextField!
    @IBOutlet fileprivate weak var descriptionLabel: UILabel!
    @IBOutlet fileprivate weak var descriptionTextView: UITextView!

    weak var delegate: SingleTaskVCDelegate?
    weak var dataSource: SingleTaskVCDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let task = dataSource?.editedTask() {
            setupView(with: task)
        }
    }

    private func setupView(with editedTask: Task) {
        titleTextField.text = editedTask.title
        descriptionTextView.text = editedTask.info
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        delegate?.saveButtonTapped(title: titleTextField.text ?? "", description: descriptionTextView.text)
    }
}
