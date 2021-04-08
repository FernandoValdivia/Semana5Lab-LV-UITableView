//
//  AddTaskViewController.swift
//  semana5Teo
//
//  Created by mbtec22 on 4/8/21.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var inputTask: UITextField!
    @IBOutlet weak var swImportant: UISwitch!
    
    var previousVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func btnAddTask(_ sender: UIButton) {
        let task = Task()
        task.name = inputTask.text!
        task.importante = swImportant.isOn
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    

}
