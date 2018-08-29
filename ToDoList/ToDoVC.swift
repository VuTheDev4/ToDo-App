//
//  ToDoVC.swift
//  ToDoList
//
//  Created by Vu Duong on 8/27/18.
//  Copyright © 2018 Vu Duong. All rights reserved.
//

import UIKit

class ToDoVC: UITableViewController {
    
    var toDoCoreDatas = [ToDoCD]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDosFromCoreData = try? context.fetch(ToDoCD.fetchRequest()) {
                if let toDos = toDosFromCoreData as? [ToDoCD] {
                    toDoCoreDatas = toDos
                    tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoCoreDatas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let currentToDo = toDoCoreDatas[indexPath.row]
        
        if currentToDo.important {
            if let name = currentToDo.name {
                cell.textLabel?.text = " ❗️ " + name
            }
            
        } else {
            cell.textLabel?.text = currentToDo.name
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo = toDoCoreDatas[indexPath.row]
        performSegue(withIdentifier: "showToDoDetails", sender: selectedTodo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddVC {
            addVC.toDoTableVC = self
        }
        
        if let completeVC = segue.destination as? CompleteToDoVC {
            if let selectedToDo = sender as? ToDoCD {
                completeVC.toDo = selectedToDo
            }
            
        }
        
        
    }
}
