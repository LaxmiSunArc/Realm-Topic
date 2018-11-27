//
//  TaskList.swift
//  RealmTasks
//
//  Created by Anand Suthar on 27/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import RealmSwift


class TaskList: Object {
    
    dynamic var name = ""
    dynamic var createdAt = NSDate()
    let tasks = List<Task>()
    

}
