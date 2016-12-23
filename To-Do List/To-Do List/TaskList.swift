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
    
    var timer: Timer!
    
    var numberOfCompletedTasksWithin24Hours: Int {
        get {
            var i = 0
            var count = 0
            while (i < taskList.count) {
                if (taskList[i].isCompleted) {
                    count += 1
                }
                i += 1
            }
            return count
        }
    }
    
    var count: Int {
        get {
            return taskList.count
        }
    }
    
    var oldestTaskCompleted: TaskItem! {
        get {
            var oldestTask: TaskItem? = nil
            for task in taskList {
                if oldestTask === nil && task.isCompleted {
                    oldestTask = task
                } else if task.isCompleted && task.timeElapsed > (oldestTask?.timeElapsed)! {
                    oldestTask = task
                }
            }
            return oldestTask
        }
    }
    
    var mostRecentTaskCompleted: TaskItem! {
        get {
            var recentTask: TaskItem? = nil
            for task in taskList {
                if recentTask === nil && task.isCompleted {
                    recentTask = task
                } else if task.isCompleted && task.timeElapsed < (recentTask?.timeElapsed)! {
                    recentTask = task
                }
            }
            return recentTask
        }
    }
    
    init() {
        taskList = []
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: deleteTimedOutTasks(timer:))
    }
    
    convenience init(listOfTasks: [TaskItem]) {
        self.init()
        self.taskList = listOfTasks
        
    }
    
    @objc private func deleteTimedOutTasks(timer: Timer) {
        var i = 0
        while (i < taskList.count) {
            if taskList[i].isPast24Hours {
                taskList.remove(at: i)
            }
            i += 1
        }
    }
    
    func get(index: Int) -> TaskItem {
        return taskList[index]
    }
    
    func append(_ task: TaskItem) {
        taskList.append(task)
    }
    
    func remove(at index: Int) {
        taskList.remove(at: index)
    }
    
    func completeTask(at index: Int) {
        let item = self.taskList[index]
        item.isCompleted = true
        item.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: item.updateTimeStatus(timer:))
    }
    
    func revisitTask(at index: Int) {
        let item = self.taskList[index]
        item.isCompleted = false
        item.timer.invalidate()
    }
    
}
