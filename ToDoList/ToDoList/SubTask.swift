//
//  SubTask.swift
//  ToDoList
//
//  Created by Maciej Plewko on 12.05.2017.
//  Copyright © 2017 Maciej Plewko. All rights reserved.
//

import RealmSwift

class SubTask: Object {

    dynamic var subtaskID = UUID().uuidString
    dynamic var title = ""
    dynamic var info = ""
    dynamic var createdAt = NSDate()

    override static func primaryKey() -> String? {
        return "subtaskID"
    }
}
