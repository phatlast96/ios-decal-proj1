//
//  StatisticsViewController.swift
//  To-Do List
//
//  Created by Phat Pham on 10/10/16.
//  Copyright © 2016 Phat Pham. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var completedTasksDisplay: UILabel!
    
    var tasks: TaskList!
    
    var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        completedTasksDisplay = UILabel.init(frame: self.view.frame)
        if let taskList = tasks {
            completedTasksDisplay.text = "Completed: \(taskList.count)"
        } else {
            completedTasksDisplay.text = "Completed: 0"
        }
        
        completedTasksDisplay.font.withSize(CGFloat(30))
        completedTasksDisplay.backgroundColor = UIColor.lightGray
        self.view.addSubview(completedTasksDisplay)
    }
    
    init(frame: CGRect, taskList: TaskList) {
        super.init(nibName: nil, bundle: nil)
        self.view.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
