//
//  ViewController.swift
//  semana5Teo
//
//  Created by mbtec22 on 4/8/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var indexSelected:Int!

    @IBOutlet weak var tableView: UITableView!
    var tasks:[Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = createTask()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    @IBAction func newTask(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! AddTaskViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "taskSelectedSegue" {
            let nextVC = segue.destination as! TaskCompleteViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "taskSelectedSegue", sender: task)
        
    }
    
    func createTask() -> [Task]{
        let task1 = Task()
         task1.name = "Task One"
        task1.importante = true
    
        let task2 = Task()
         task2.name = "Task Two"
        task2.importante = true

        let task3 = Task()
         task3.name = "Task Three"
        task3.importante = false
    
    return [task1, task2, task3]
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.importante == true {
            cell.textLabel?.text = "😎 \(task.name)"
        }else{
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    


}

