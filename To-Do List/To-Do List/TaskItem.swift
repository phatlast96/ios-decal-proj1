//
//  TaskItem.swift
//  To-Do List
//
//  Created by Phat Pham on 10/9/16.
//  Copyright © 2016 Phat Pham. All rights reserved.
//

import Foundation

class TaskItem {
    
    // Name of the desired task
    private var task: String
    
    // Description of the desired task
    private var taskDescription: String
    
    init(_ task: String, _ descriptionOfTask: String) {
        self.task = task
        self.taskDescription = descriptionOfTask
    }
    
    convenience init() {
        self.init("Random Task", "There is no available information on the task at hand.")
    }
    
    func getName() -> String {
        return task
    }
    
    func getDescription() -> String {
        return taskDescription
    }
}
