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

    @IBOutlet weak var positionField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    let datePicker = UIDatePicker()
    let pickerView = UIPickerView()
    let loc = Locale(identifier: "en")
    enum applicationAddInfoType{
        case positions
        case location
        case type
        case status
        case referral
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        createPositionPicker()
        pickerView.dataSource = self
        pickerView.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Add", style: .done, target: self, action: #selector(addResume))
    }
    
    @objc fileprivate func addResume(sender: UIBarButtonItem){
        
    }
}

//create position picker view
extension AddApplicationVC : UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return positions.count
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return positions[row]
    }
    
    func createPositionPicker(){
        positionField.inputView = pickerView
        positionField.inputAccessoryView = createToolbar()
    }
}

//creating data picker and toolbar
extension AddApplicationVC {
    //create datepicker and change text alignment for the text in the date field.
    func createDatePicker() {
        self.datePicker.locale = loc
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        dateField.textAlignment = .center
        dateField.inputView = datePicker
        dateField.inputAccessoryView = createToolbar()
    }
}

//creating date picker and toolbar for it.
extension AddApplicationVC{
    //create toolbar
    func createToolbar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
       //done button
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
//        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(select))
        
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
    }
    
    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
//    @objc func donePressed(_ pickerSelector : Int){
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .none
//        dateField.text = dateFormatter.string(from: datePicker.date)
//        self.view.endEditing(true)
//    }
}

//
//func doneButtonClass(_ pickerSelector : Int) {
//    let pickerSelector : Int = pickerSelector
//
//    @objc func donePressed(){
//        switch pickerSelector {
//            case 1 :
//            break
//        case 2:
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateStyle = .medium
//                dateFormatter.timeStyle = .none
//                dateField.text = dateFormatter.string(from: datePicker.date)
//                self.view.endEditing(true)
//            break
//        }
//}
    
//function when done button pressed



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

