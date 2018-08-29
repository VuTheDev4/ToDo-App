//
//  AddVC.swift
//  ToDoList
//
//  Created by Vu Duong on 8/27/18.
//  Copyright © 2018 Vu Duong. All rights reserved.
//

import UIKit


class AddVC: UIViewController {

    @IBOutlet weak var nameTextfField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    var toDoTableVC : ToDoVC? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func addPressed(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newToDo = ToDoCD(context: context)
            newToDo.important = importantSwitch.isOn
            if let name = nameTextfField.text {
                newToDo.name = name
            }
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        
        //Dismiss View
        navigationController?.popViewController(animated: true)
    }
    

}
