//
//  Data.swift
//  TDL-app
//
//  Created by Meitar Basson on 20/09/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit
import CoreData

struct Data {
    
    var task: [Task] = [Task]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init() {
        getData()
    }
    
    func saveData() {
        do {
            try context.save()
//            taskTable.reloadData()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    mutating func getData() {
        let request : NSFetchRequest<Task> = Task.fetchRequest()
        do {
            self.task = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
    
    mutating func deleteTask(index: Int) {
        context.delete(task[index])
        task.remove(at: index)
        saveData()
    }
    
    mutating func addNewTask(taskTitle: String) {
        let newTask = Task(context: self.context)
        newTask.title = taskTitle
        task.append(newTask)
        saveData()
    }
}
