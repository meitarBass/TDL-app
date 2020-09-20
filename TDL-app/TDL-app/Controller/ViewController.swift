//
//  ViewController.swift
//  TDL-app
//
//  Created by Meitar Basson on 20/09/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskTable: UITableView!
    
    let task: [Task] = [Task(title: "Hello", deadline: "", state: false)]
    var data: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taskTable.delegate = self
        taskTable.dataSource = self
        
        data = Data(task: task)
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
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        let alert = Alert(title: "Alert", message: nil, preferredStyle: .alert)
        alert.setAlert()
        present(alert, animated: true, completion: nil)
    }
    
}

