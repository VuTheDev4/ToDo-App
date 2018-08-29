//
//  CompleteToDoVC.swift
//  ToDoList
//
//  Created by Vu Duong on 8/27/18.
//  Copyright © 2018 Vu Duong. All rights reserved.
//

import UIKit

class CompleteToDoVC: UIViewController {

    
    @IBOutlet weak var toDoLbl: UILabel!
    var toDo : ToDoCD? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoLbl.text = toDo?.name
        
        
    }

    @IBAction func completeBtnPressed(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDo = toDo {
            context.delete(toDo)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    
}
