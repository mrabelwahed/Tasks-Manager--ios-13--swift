//
//  ViewController.swift
//  TableViewDemo
//
//  Created by MahmoudRamadan on 3/12/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    var daily = [
        Task(name: "one1", type: .daily, completed: true, lastCompleted: nil),
        Task(name: "two1", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "three1", type: .daily, completed: false, lastCompleted: nil)
    ]
    var weekly = [
        Task(name: "one2", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "two2", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "three2", type: .weekly, completed: false, lastCompleted: nil)
    ]
    var monthly = [
        Task(name: "one3", type: .monthly, completed: false, lastCompleted: nil),
        Task(name: "two3", type: .monthly, completed: false, lastCompleted: nil),
        Task(name: "three3", type: .monthly, completed: false, lastCompleted: nil)
    ]
    
    @IBAction func resetData(_ sender: Any) {
        let alertController = UIAlertController.init(title: "Are you sure?", message: "reset all list", preferredStyle: .alert)
        let yesAction = UIAlertAction.init(title: "yes", style: .destructive){
            action in
            for i in 0..<self.daily.count{
                self.daily[i].completed = false
             }
             for i in 0..<self.weekly.count{
                self.weekly[i].completed = false
                    }
             for i in 0..<self.monthly.count{
                self.monthly[i].completed = false
                    }
             
            self.tasksTableView.reloadData()
        }
        
        let noAction = UIAlertAction.init(title: "No", style: .cancel){
            action in
            print("this is cancel option")
        }
        
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        present(alertController,animated: true,completion: nil)
        
        
 
        
    }
    
    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        if mySwitch.isOn{
            view.backgroundColor = UIColor.darkGray
        }else{
            view.backgroundColor = UIColor.white
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clear
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return daily.count
        case 1:
            return weekly.count
        case 2:
            return monthly.count
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell" ,for: indexPath)
        var task:Task!
        switch indexPath.section {
        case 0:
            task = daily[indexPath.row]
        case 1:
            task = weekly[indexPath.row]
        case 2:
            task = monthly[indexPath.row]
        default:
            task = nil
        }
        cell.textLabel?.text = task.name
        cell.imageView?.image = UIImage(named: "clock")
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = "test...."
        cell.backgroundColor = UIColor.clear
        if task.completed{
            cell.textLabel?.textColor = UIColor.lightGray
            cell.accessoryType = .checkmark
        }else{
            cell.textLabel?.textColor = UIColor.black
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "complete") { (action:UIContextualAction, sourceView:UIView,
            actionPerformed:(Bool) -> Void) in
            switch indexPath.section{
            case 0: self.daily[indexPath.row].completed = true
            case 1: self.weekly[indexPath.row].completed = true
            case 2: self.monthly[indexPath.row].completed = true
            default: break
            }
            tableView.reloadData()
            actionPerformed(true)
        }
        return UISwipeActionsConfiguration(actions: [completeAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you selected row \(indexPath.row) at section \(indexPath.section)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

