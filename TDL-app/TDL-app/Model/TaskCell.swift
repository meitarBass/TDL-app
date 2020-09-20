//
//  TaskCell.swift
//  TDL-app
//
//  Created by Meitar Basson on 20/09/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setTaskCell(task: Task) {
        taskLabel.text = task.title
        changeAccessory(task: task)
    }
    
    func changeAccessoryType(task: Task) -> Task {
        var changeableTask = task
        changeableTask.state = !task.state
        changeAccessory(task: changeableTask)
        return changeableTask
    }
    
    func changeAccessory(task: Task) {
        if task.state {
            self.accessoryType = .checkmark
        } else {
            self.accessoryType = .none
        }
    }

}
