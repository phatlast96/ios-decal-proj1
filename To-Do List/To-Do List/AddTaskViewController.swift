//
//  AddTaskViewController.swift
//  To-Do List
//
//  Created by Phat Pham on 10/10/16.
//  Copyright © 2016 Phat Pham. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    var taskName: UITextField!
    
    var taskDetails: UITextField!
    
    var enterButton: UIButton!
    
    var tasks: TaskList!
    
    var frame: CGRect!
    
    var navigation: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        let navigationBarHeight = navigation.navigationBar.frame.height + navigation.navigationBar.frame.origin.y
        
        taskName = UITextField.init(frame: CGRect(x: 0, y: navigationBarHeight, width: self.view.frame.width, height: self.view.frame.height * 0.1))
        taskDetails = UITextField.init(frame: CGRect(x: 0, y: navigationBarHeight + taskName.frame.height, width: self.view.frame.width, height: self.view.frame.height * 0.2))
        
        enterButton = UIButton(frame: CGRect(x: 0, y: navigationBarHeight + taskName.frame.height + taskDetails.frame.height, width: self.view.frame.width, height: taskDetails.frame.height))
        
        enterButton.backgroundColor = UIColor.green
        enterButton.setTitle("Enter", for: .normal)
        enterButton.setTitleColor(UIColor.white, for: .normal)
        enterButton.addTarget(self, action: #selector(updateList), for: .touchUpInside)
        
        taskName.attributedPlaceholder = NSAttributedString(string: "Task Name", attributes: nil)
        taskDetails.attributedPlaceholder = NSAttributedString(string: "Task Details", attributes: nil)
        
        taskName.backgroundColor = UIColor.lightGray
        taskDetails.backgroundColor = UIColor.lightGray
        view.addSubview(taskName)
        view.addSubview(taskDetails)
        view.addSubview(enterButton)
        
    }
    
    init(frame: CGRect, navigationBy navController: UINavigationController) {
        super.init(nibName: nil, bundle: nil)
        self.frame = frame
        self.navigation = navController
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func updateList(sender: UIButton) {
        print("Added an item!")
        print("Before: \(self.tasks.count)")
        print(taskName.text!)
        self.tasks.append(TaskItem(taskName.text!, descriptionOfTask: taskDetails.text!))
        print("After: \(self.tasks.count)")
        navigation.popViewController(animated: true)
    }
}
