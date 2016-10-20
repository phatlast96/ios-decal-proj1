//
//  TaskList.swift
//  To-Do List
//
//  Created by Phat Pham on 10/18/16.
//  Copyright © 2016 Phat Pham. All rights reserved.
//

import UIKit

class TaskList {
    
    private var taskList: [TaskItem]
    
    private var completedTasks: [TaskItem]
    
    var numberOfCompletedTasksWithin24Hours: Int {
        get {
            return completedTasks.count
        }
    }
    
    var count: Int {
        get {
            return taskList.count
        }
    }
    
    init(listOfTasks: [TaskItem]) {
        self.taskList = listOfTasks
        self.completedTasks = []
    }
    
    init() {
        self.taskList = [TaskItem("Create tasks", descriptionOfTask: "Put some tasks in the todo list."),
                         TaskItem("Do Laundry", descriptionOfTask: "There are stacks of laundry."),
                         TaskItem("Eat food", descriptionOfTask: "Remember the proteins!")]
        self.completedTasks = []
    }
    
    func get(index: Int) -> TaskItem {
        return taskList[index]
    }
    
    func append(_ task: TaskItem) {
        taskList += [task]
        taskList.append(task)
    }
    
    func remove(at index: Int) {
        taskList.remove(at: index)
    }
    
    func completeTask(at index: Int) {
        completedTasks.append(self.taskList[index])
    }
    
    func revisitTask(at index: Int) {
        completedTasks.remove(at: index)
    }
    
}
