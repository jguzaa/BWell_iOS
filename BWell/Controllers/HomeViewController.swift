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
    
    var habitCreateVC: HabitCreateViewController?
    
    var habits: Results<Habit>?
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            
        habitCreateVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HabitCreate") as? HabitCreateViewController
        habitCreateVC!.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
                
        loadData()
        
    }
    
    @IBAction func addHabitPressed(_ sender: UIBarButtonItem) {
        //self.performSegue(withIdentifier: K.Segue.DashboardToCreateHabit, sender: self)
        self.present(habitCreateVC!, animated: true, completion: nil)
    }
    
    //MARK: - Data Manipulate
    func loadData(){
        habits = realm.objects(Habit.self)
        tableView.reloadData()
    }
}

//MARK: - UITableView

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.DashboardCell, for: indexPath)
        cell.textLabel?.text = habits?[indexPath.row].name ?? "No habit added yet"
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}

extension HomeViewController: TableViewManagement{
    
    func reloadWhenDismissed() {
        print("Reload table")
        tableView.reloadData()
    }
       
}



