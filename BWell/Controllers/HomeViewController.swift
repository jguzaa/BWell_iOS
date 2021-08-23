//
//  ViewController.swift
//  BWell
//
//  Created by Jongjet Wongsarapee on 23/8/21.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()
    
    //var habits: Results<Habit>?
    var habits = [
        Habit(name: "test1"),
        Habit(name: "test2"),
        Habit(name: "test3"),
        Habit(name: "test4")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
    }
    
    //MARK: - Data Manipulate
    
}

//MARK: - UITableView

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return habits?.count ?? 1
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.DashboardCell, for: indexPath)
//        cell.textLabel?.text = habits?[indexPath.row].name ?? "No habit added yet"
        cell.textLabel?.text = habits[indexPath.row].name
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}



