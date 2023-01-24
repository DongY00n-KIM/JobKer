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

    @IBOutlet weak var positionPicker: UIPickerView!
    @IBOutlet weak var statusPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        positionPicker.dataSource = self
//        positionPicker.delegate = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Add", style: .done, target: self, action: #selector(addResume))
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

