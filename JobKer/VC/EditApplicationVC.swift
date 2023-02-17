//
//  EditApplicationVC.swift
//  JobKer
//
//  Created by Roy's Saxy MacBook on 2/13/23.
//

import Foundation
import UIKit

class EditApplicationVC: UIViewController {
    
    @IBOutlet weak var referralField: UITextField!
    @IBOutlet weak var statusField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var positionField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var salaryTextField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    //picker vars
    let datePicker = UIDatePicker()
    let pickerView = UIPickerView()
    
    var index : Int = 0
    var textFieldType : applicationAddInfoType? = nil
    
    let loc = Locale(identifier: "en")
    
    enum applicationAddInfoType{
        case positions
        case location
        case type
        case status
        case referral
        case date
        case name
    }
    
    var applicationListDelegate : ApplicationListDelegate? = nil
    
    var editApplicationInfo : ApplicationInfo? = nil {
        didSet {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "- <#comment#>")

        
        self.navigationItem.title = "Edit Application"
        
        if let editApplicationInfo = editApplicationInfo {
            positionField.text = editApplicationInfo.position
            locationField.text = editApplicationInfo.location
            typeField.text = editApplicationInfo.type
            statusField.text = editApplicationInfo.status
            referralField.text = editApplicationInfo.referral
            dateField.text = editApplicationInfo.date
            nameField.text = editApplicationInfo.name
            salaryTextField.text = editApplicationInfo.salary
        }
        
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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Edit", style: .done, target: self, action: #selector(editResume))
    }
    
    //check what which textfield is selected.
    @objc fileprivate func textFieldTypeSelector(_ textField : UITextField){
        if textField == positionField{
            textFieldType = .positions
        }
        else if textField == locationField {
            textFieldType = .location
        }
        else if textField == typeField {
            textFieldType = .type
        }
        else if textField == statusField {
            textFieldType = .status
        }
        else if textField == referralField {
            textFieldType = .referral
        }
        else{
            textFieldType = nil
        }
    }
    
    @objc fileprivate func editResume(sender: UIBarButtonItem){
        print(#fileID, #function, #line, "- ")
        
        
        guard let positionInput = positionField.text,
              let statusInput = statusField.text,
              let typeInput = typeField.text,
              let referralInput = referralField.text,
              let nameInput = nameField.text,
              let locationInput = locationField.text,
              let salaryInput = salaryTextField.text,
              let dateInput = dateField.text,
              var editApplicationInfo = editApplicationInfo else { return }
        
        editApplicationInfo.position = positionInput
        editApplicationInfo.status = statusInput
        editApplicationInfo.type = typeInput
        editApplicationInfo.referral = referralInput
        editApplicationInfo.name = nameInput
        editApplicationInfo.location = locationInput
        editApplicationInfo.salary = salaryInput
        editApplicationInfo.date = dateInput
        
        applicationListDelegate?.applicationInfoEdited(editApplicationInfo)
        self.navigationController?.popViewController(animated: true)
    }
}

//create position picker view
extension EditApplicationVC : UIPickerViewDataSource, UIPickerViewDelegate{
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
//        else if textFieldType == .date {
//            return referral.count
//        }
        return 0
    }
    
    // set index value with row value.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        index = row
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //picker view case
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
//        else if textFieldType == .date {
//            return date[row]
//        }
        return nil
    }
    
}

//creating data picker and toolbar
extension EditApplicationVC {
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
extension EditApplicationVC{
    //create pickers for each cases.
    func createPositionPicker(){
        positionField.inputView = pickerView
        positionField.inputAccessoryView = createToolbar()
        positionField.textAlignment = .center
    }
    func createStatusPicker(){
        statusField.inputView = pickerView
        statusField.inputAccessoryView = createToolbar()
        statusField.textAlignment = .center
    }
    func createLocationPicker(){
        locationField.inputView = pickerView
        locationField.inputAccessoryView = createToolbar()
        locationField.textAlignment = .center
    }
    func createTypePicker(){
        typeField.inputView = pickerView
        typeField.inputAccessoryView = createToolbar()
        typeField.textAlignment = .center
    }
    func createReferralPicker(){
        referralField.inputView = pickerView
        referralField.inputAccessoryView = createToolbar()
        referralField.textAlignment = .center
    }
    
    //create toolbar
    func createToolbar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
    }
    
    //done button pressed.
    @objc func donePressed(){
        
        if textFieldType == .positions{
            positionField.text = positions[index]
        }
        else if textFieldType == .location {
            locationField.text = locations[index]
        }
        else if textFieldType == .type {
            typeField.text = type[index]
        }
        else if textFieldType == .status {
            statusField.text = status[index]
        }
        else if textFieldType == .referral {
            referralField.text = referral[index]
        }
        else{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            dateField.text = dateFormatter.string(from: datePicker.date)
        }
        
        self.view.endEditing(true)
        pickerView.selectRow(0, inComponent: 0, animated: false)
        index = 0
        textFieldType = nil
    }
}

