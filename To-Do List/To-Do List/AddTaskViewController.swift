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
    
    init(frame: CGRect) {
        super.init(nibName: nil, bundle: nil)
        self.view.frame = frame
        taskName = UITextField.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height * 0.2))
        taskDetails = UITextField.init(frame: CGRect(x: 0, y: taskName.frame.height, width: self.view.frame.width, height: self.view.frame.height * 0.8))
        
        taskName.attributedPlaceholder = NSAttributedString(string: "Task Name", attributes: nil)
        taskDetails.attributedPlaceholder = NSAttributedString(string: "Task Name", attributes: nil)

        view.addSubview(taskName)
        view.addSubview(taskDetails)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
