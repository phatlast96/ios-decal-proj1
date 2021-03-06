//
//  ViewController.swift
//  To-Do List
//
//  Created by Phat Pham on 10/8/16.
//  Copyright © 2016 Phat Pham. All rights reserved.
//

import UIKit
import CoreData

class TaskListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks: TaskList = TaskList()
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskListTableViewCell.self, forCellReuseIdentifier: "taskCell")
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.topItem?.title = "Todos"
        
        let stats = UIBarButtonItem.init(title: "Stats", style: .plain, target: self, action: #selector(openStatsPressed))
        let addTask = UIBarButtonItem.init(title: "+", style: .plain, target: self, action: #selector(addTaskPressed))
        
        navigationBar?.topItem?.leftBarButtonItem = stats
        navigationBar?.topItem?.rightBarButtonItem = addTask
        
        navigationBar?.backgroundColor = UIColor.blue
        
        tableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.view.frame.height)
        print("TableView uploaded")
        self.view.addSubview(tableView)
        
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDel.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<TasksTable> = TasksTable.fetchRequest()
        do {
            let taskRecords = try managedContext.fetch(fetchRequest)
            if taskRecords.count > 0 {
                for item in taskRecords {
                    let taskName = item.value(forKey: "name")
                    let taskDescription = item.value(forKey: "details")
                    let taskItem = TaskItem.init(taskName as! String, descriptionOfTask: taskDescription as! String)
                    self.tasks.append(taskItem)
                }
                for shownItems in taskRecords {
                    managedContext.delete(shownItems)
                }
            }
        } catch {
            
        }     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    init(frame: CGRect) {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func openStatsPressed(sender: UIButton!) {
        let statsVC = StatisticsViewController(frame: self.view.frame, taskList: self.tasks)
        print("Opening the statistics")
        self.navigationController?.pushViewController(statsVC, animated: true)
    }
    
    @objc private func addTaskPressed(sender: UIButton!) {
        let addTaskVC = AddTaskViewController(frame: self.view.frame)
        print("Adding a new task")
        addTaskVC.tasks = self.tasks
        self.navigationController?.pushViewController(addTaskVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellFrame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 45)
        let cell: TaskListTableViewCell = TaskListTableViewCell(frame: cellFrame, taskInfo: self.tasks.get(index: indexPath.row))
        if self.tasks.get(index: indexPath.row).isCompleted {
            cell.accessoryType = .checkmark
            cell.isCheckedOff = true
        }
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

