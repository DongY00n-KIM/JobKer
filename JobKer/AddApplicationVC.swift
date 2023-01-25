//
//  AddApplicationVC.swift
//  JobKer
//
//  Created by Roy's Saxy MacBook on 1/10/23.
//


import UIKit
import Foundation

let positions:[String] = [
    "FrontEnd", "BackEnd", "Cloud Developer","Web Developer", "SoftWate Development", "IT Services and IT Consultion", "Computer and Network Security"
]

let status:[String] = [
   "InProgress", "Rejected", "Accepted"
]

class AddApplicationVC: UIViewController {

    @IBOutlet weak var dateField: UITextField!
    let datePicker = UIDatePicker()
    let loc = Locale(identifier: "en")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Add", style: .done, target: self, action: #selector(addResume))
    }
    
    func createToolbar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
       //done button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
    }
    
    func createDatePicker() {
        self.datePicker.locale = loc
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        dateField.textAlignment = .center
        dateField.inputView = datePicker
        dateField.inputAccessoryView = createToolbar()
    }
    
    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.dateField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc fileprivate func addResume(sender: UIBarButtonItem){
        
    }
}


//extension AddApplicationVC: UIPickerViewDataSource{
//    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return positions.count
//    }
//}
//
//extension AddApplicationVC: UIPickerViewDelegate{
//    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return positions[row]
//    }
//}

