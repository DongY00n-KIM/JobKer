//
//  AddApplicationVC.swift
//  JobKer
//
//  Created by Roy's Saxy MacBook on 1/10/23.
//


import UIKit
import Foundation

//data arrays
let positions:[String] = [
    "FrontEnd", "BackEnd", "Cloud Developer","Web Developer", "SoftWate Development", "IT Services and IT Consultion", "Computer and Network Security"
]

let status:[String] = [
   "In Progress", "Rejected", "Accepted"
]

let type:[String] = [
    "Intern", "Contract", "Full-Time", "Part-Time"
]

let referral:[String] = [
    "No", "Yes"
]

let locations:[String] = [
    "AL", "AK",
    "AZ", "AR",
    "CA", "CO",
    "CT", "DE",
    "FL", "GA",
    "HI", "ID",
    "IL", "IN",
    "IA", "KS",
    "KY", "LA",
    "ME", "MD",
    "MA", "MI",
    "MN", "MS",
    "MO", "MT",
    "NE", "NV",
    "NH", "NJ",
    "NM", "NY",
    "NY", "NC",
    "ND", "OH",
    "OK", "OR",
    "PA", "RI",
    "SC", "SD",
    "TN", "TX",
    "UT", "VT",
    "VA", "WA",
    "WV", "WI",
    "WY", "Remote"
]


class AddApplicationVC: UIViewController {

    //textField vars
    @IBOutlet weak var referralField: UITextField!
    @IBOutlet weak var statusField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var positionField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    
    //picker vars
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
    
//    var selectedApplicationAddInfoType : String? = nil
    var textFieldType : applicationAddInfoType? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        createPositionPicker()
        createStatusPicker()
        createLocationPicker()
        createReferralPicker()
        createTypePicker()
        pickerView.dataSource = self
        pickerView.delegate = self
        
        //add Target for each textfiled.
        positionField.addTarget(self, action: #selector(textFieldTypeSelector(_:)), for: .editingDidBegin)
        locationField.addTarget(self, action: #selector(textFieldTypeSelector(_:)), for: .editingDidBegin)
        typeField.addTarget(self, action: #selector(textFieldTypeSelector(_:)), for: .editingDidBegin)
        statusField.addTarget(self, action: #selector(textFieldTypeSelector(_:)), for: .editingDidBegin)
        referralField.addTarget(self, action: #selector(textFieldTypeSelector(_:)), for: .editingDidBegin)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Add", style: .done, target: self, action: #selector(addResume))
    }
    
    //check what which textfield is selected.
    @objc fileprivate func textFieldTypeSelector(_ textField : UITextField){
        if textField == positionField{
            print("position Field selected")
            textFieldType = .positions
        }
        else if textField == locationField {
            print("locationField selected")
            textFieldType = .location
        }
        else if textField == typeField {
            print("typeField selected")
            textFieldType = .type
        }
        else if textField == statusField {
            print("statusField Selected")
            textFieldType = .status
        }
        else if textField == referralField {
            print("referral field selected")
            textFieldType = .referral
        }
        else{
            print("nil selected")
            textFieldType = nil
        }
        
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
        if textFieldType == .positions{
            return positions.count
        }
        else if textFieldType == .location {
            return locations.count
        }
        else if textFieldType == .type {
            return type.count
        }
        else if textFieldType == .status {
            return status.count
        }
        else if textFieldType == .referral {
            return referral.count
        }
        return 0
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if textFieldType == .positions{
            return positions[row]
        }
        else if textFieldType == .location {
            return locations[row]
        }
        else if textFieldType == .type {
            return type[row]
        }
        else if textFieldType == .status {
            return status[row]
        }
        else if textFieldType == .referral {
            return referral[row]
        }
        return nil
    }
    
    func createPositionPicker(){
        positionField.inputView = pickerView
        positionField.inputAccessoryView = createToolbar()
    }
    func createStatusPicker(){
        statusField.inputView = pickerView
        statusField.inputAccessoryView = createToolbar()
    }
    func createLocationPicker(){
        locationField.inputView = pickerView
        locationField.inputAccessoryView = createToolbar()
    }
    func createTypePicker(){
        typeField.inputView = pickerView
        typeField.inputAccessoryView = createToolbar()
    }
    func createReferralPicker(){
        referralField.inputView = pickerView
        referralField.inputAccessoryView = createToolbar()
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
        
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
    }
    
    @objc func donePressed(){
        if textFieldType == .positions{
            
        }
        else if textFieldType == .location {
            
        }
        else if textFieldType == .type {
            
        }
        else if textFieldType == .status {
            
        }
        else if textFieldType == .referral {
            
        }
        else{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            dateField.text = dateFormatter.string(from: datePicker.date)
        }
        self.view.endEditing(true)
        textFieldType = nil
    }
}
