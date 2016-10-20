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
    
    var navigation: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskListTableViewCell.self, forCellReuseIdentifier: "taskCell")
        
        let navigationBar = navigation.navigationBar
        navigationBar.topItem?.title = "Todos"
        
        let stats = UIBarButtonItem.init(title: "Stats", style: .plain, target: self, action: #selector(openStatsPressed))
        let addTask = UIBarButtonItem.init(title: "+", style: .plain, target: self, action: #selector(addTaskPressed))
        
        navigationBar.topItem?.leftBarButtonItem = stats
        navigationBar.topItem?.rightBarButtonItem = addTask
        
        navigationBar.backgroundColor = UIColor.blue
        
        tableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.view.frame.height)
        
        self.view.addSubview(tableView)
    }
    
    init(frame: CGRect) {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func openStatsPressed(sender: UIButton!) {
        let statsVC = StatisticsViewController(frame: self.view.frame)
        print("Opening the statistics")
        self.navigation.pushViewController(statsVC, animated: true)
        self.navigation.view.addSubview(statsVC.view)
        statsVC.tasks = self.tasks
    }
    
    @objc private func addTaskPressed(sender: UIButton!) {
        let addTaskVC = AddTaskViewController(frame: self.view.frame, navigationBy: navigation)
        print("Adding a new task")
        self.navigation.pushViewController(addTaskVC, animated: true)
        self.navigation.view.addSubview(addTaskVC.view)
        addTaskVC.tasks = self.tasks
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
            tasks.completeTask(at: indexPath.row)
            taskCell.isCheckedOff = true
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            tasks.revisitTask(at: indexPath.row)
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

