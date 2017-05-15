//
//  Task.swift
//  ToDoList
//
//  Created by Maciej Plewko on 10.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import RealmSwift

class Task: Object {

    dynamic var taskID = UUID().uuidString
    dynamic var title = ""
    dynamic var info = ""
    dynamic var createdAt = NSDate()
    let subtasks = List<SubTask>()

    convenience init(title: String, info: String) {
        self.init()
        self.title = title
        self.info = info
    }

    override static func primaryKey() -> String? {
        return "taskID"
    }
}
