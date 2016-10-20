//
//  StatisticsViewController.swift
//  To-Do List
//
//  Created by Phat Pham on 10/10/16.
//  Copyright © 2016 Phat Pham. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var numberOfCompletedTasksDisplay: UILabel!
    
    var oldestCompletedTaskDisplay: UILabel!
    
    var mostRecentCompletedTaskDisplay: UILabel!
    
    var tasks: TaskList!
    
    var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        numberOfCompletedTasksDisplay = UILabel.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/3))
        
        oldestCompletedTaskDisplay = UILabel(frame: CGRect(x: 0, y: numberOfCompletedTasksDisplay.frame.height, width: self.view.frame.width, height: self.view.frame.height/3))
        
        let verticalDistanceFromTheTop = numberOfCompletedTasksDisplay.frame.height + oldestCompletedTaskDisplay.frame.height
        
        mostRecentCompletedTaskDisplay = UILabel(frame: CGRect(x: 0, y: verticalDistanceFromTheTop, width: self.view.frame.width, height: self.view.frame.height/3))
        if let taskList = tasks {
            numberOfCompletedTasksDisplay.text = "Completed: \(taskList.count)"
        } else {
            numberOfCompletedTasksDisplay.text = "Completed: 0"
        }
        
        numberOfCompletedTasksDisplay.font.withSize(CGFloat(30))
        numberOfCompletedTasksDisplay.textColor = UIColor.white
        numberOfCompletedTasksDisplay.backgroundColor = UIColor.lightGray
        
        oldestCompletedTaskDisplay.font.withSize(CGFloat(30))
        oldestCompletedTaskDisplay.textColor = UIColor.white
        oldestCompletedTaskDisplay.backgroundColor = UIColor.lightGray
        
        mostRecentCompletedTaskDisplay.font.withSize(CGFloat(30))
        mostRecentCompletedTaskDisplay.textColor = UIColor.white
        mostRecentCompletedTaskDisplay.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(numberOfCompletedTasksDisplay)
        self.view.addSubview(oldestCompletedTaskDisplay)
        self.view.addSubview(mostRecentCompletedTaskDisplay)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let taskList = tasks {
            numberOfCompletedTasksDisplay.text = "Completed: \(taskList.numberOfCompletedTasksWithin24Hours)"
            if let oldestTask = taskList.oldestTaskCompleted {
                oldestCompletedTaskDisplay.text = "Oldest Task Completed: \(oldestTask.getName())"
            }
            if let mostRecentTask = taskList.mostRecentTaskCompleted {
                mostRecentCompletedTaskDisplay.text = "Most Recent Task Completed: \(mostRecentTask.getName())"
            }
            
        } else {
            numberOfCompletedTasksDisplay.text = "Completed: 0"
        }
    }
    
    init(frame: CGRect, taskList: TaskList) {
        super.init(nibName: nil, bundle: nil)
        self.view.frame = frame
        self.tasks = taskList
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
