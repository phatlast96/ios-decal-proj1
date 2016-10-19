//
//  ViewController.swift
//  To-Do List
//
//  Created by Phat Pham on 10/8/16.
//  Copyright © 2016 Phat Pham. All rights reserved.
//

import UIKit

class TaskListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks: TaskList = TaskList()
    
    var tableView: UITableView!
    
    var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskListTableViewCell.self, forCellReuseIdentifier: "taskCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellFrame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 45)
        let cell: UITableViewCell = TaskListTableViewCell(frame: cellFrame, taskInfo: self.tasks.get(index: indexPath.row))
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        let taskCell = tableView.cellForRow(at: indexPath) as! TaskListTableViewCell
        if !taskCell.isCheckedOff {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            taskCell.isCheckedOff = true
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            taskCell.isCheckedOff = false
        }
        self.tasks.get(index: indexPath.row).isCompleted = taskCell.isCheckedOff
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

