//
//  TaskCompleteViewController.swift
//  semana5Teo
//
//  Created by mbtec22 on 4/8/21.
//

import UIKit

class TaskCompleteViewController: UIViewController {
    @IBOutlet weak var taskLabel: UILabel!
    var task = Task()
    var previousVC = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        if task.importante {
            taskLabel.text = "☕ \(task.name)"
        }else{
            taskLabel.text = task.name
        }
        
    }
    @IBAction func completeTask(_ sender: UIButton) {
        previousVC.tasks.remove(at: previousVC.indexSelected)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
}
