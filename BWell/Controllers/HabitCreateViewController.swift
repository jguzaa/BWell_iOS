//
//  HabitCreateViewController.swift
//  BWell
//
//  Created by Jongjet Wongsarapee on 23/8/21.
//

import UIKit
import RealmSwift

class HabitCreateViewController: UIViewController {

    @IBOutlet weak var habitNameTextField: UITextField!
    @IBOutlet weak var habitTypePicker: UIPickerView!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    let realm = try! Realm()
    
    private var newHabit = Habit()
    
    var delegate: TableViewManagement?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        habitTypePicker.dataSource = self
        habitTypePicker.delegate = self
    }
    
    
    @IBAction func addHabitPressed(_ sender: UIButton) {
        newHabit.name = habitNameTextField.text ?? ""
        newHabit.notificationTime = timePicker.date
        
        //saveData()
        
        self.dismiss(animated: true) {
            
            self.delegate?.reloadWhenDismissed()
            print("View is dismissed")
        }
                       
    }
    
    private func saveData() {
        do {
            try realm.write(){
                realm.add(newHabit)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    

}

//MARK: - UIPickerView
extension HabitCreateViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return K.HabitTypes[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        newHabit.habitType = K.HabitTypes[row]
    }


}

protocol TableViewManagement {
    func reloadWhenDismissed()
}

