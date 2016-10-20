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
    
    // Tells whether the given task is completed or not
    var isCompleted: Bool
    
    var isPast24Hours: Bool
    
    var timer: Timer!
    
    private let twentyFourHourMark: Int = 86400
    
    var timeElapsed = 0
    
    init(_ task: String, descriptionOfTask description: String) {
        self.task = task
        self.taskDescription = description
        self.isCompleted = false
        self.isPast24Hours = false
        self.timer = nil
    }
    
    convenience init() {
        self.init("Random Task", descriptionOfTask: "There is no available information on the task at hand.")
    }
    
    func getName() -> String {
        return task
    }
    
    func getDescription() -> String {
        return taskDescription
    }
    
    @objc func updateTimeStatus(timer: Timer) {
        self.timeElapsed += 1
        print(task + ": \(self.timeElapsed)")
        if self.timeElapsed >= self.twentyFourHourMark {
            self.isPast24Hours = true
        }
    }
}
