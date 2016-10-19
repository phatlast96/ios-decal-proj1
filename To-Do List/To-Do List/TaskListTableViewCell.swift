//
//  TaskListTableViewCell.swift
//  To-Do List
//
//  Created by Phat Pham on 10/17/16.
//  Copyright © 2016 Phat Pham. All rights reserved.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {
    
    var taskName: UILabel!
    
    var taskDescription: UILabel!
    
    var isCheckedOff: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    init(frame: CGRect, taskInfo task: TaskItem?) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: "taskCell")
        
        taskName = UILabel(frame: CGRect(x: 10, y: 0, width: frame.width - 10, height: frame.height * 0.6))
        taskName.font = UIFont(name: "ArialMT", size: CGFloat(18))
        
        
        taskDescription = UILabel(frame: CGRect(x: 10, y: taskName.bounds.height, width: frame.width - 10, height: frame.height * 0.4))
        taskDescription.font = UIFont(name: "ChalkboardSE-Light", size: CGFloat(14))
        
        taskName.text = task?.getName()
        taskDescription.text = task?.getDescription()
        
        self.addSubview(taskName)
        self.addSubview(taskDescription)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
