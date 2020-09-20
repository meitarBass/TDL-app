//
//  ViewController.swift
//  TDL-app
//
//  Created by Meitar Basson on 20/09/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskTable: UITableView!
    
    var data: Data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taskTable.delegate = self
        taskTable.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTable.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        cell.setTaskCell(task: data.task[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = taskTable.cellForRow(at: indexPath) as! TaskCell
        data.task[indexPath.row] = cell.changeAccessoryType(task: data.task[indexPath.row])
        data.saveData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.deleteTask(index: indexPath.row)
            taskTable.reloadData()
        }
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        presentAlert(title: "Alert", message: "Custom alert", actionText: "Working") { text in
            self.data.addNewTask(taskTitle: text)
            self.taskTable.reloadData()
        }
    }
}

