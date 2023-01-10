//
//  ViewController.swift
//  JobKer
//
//  Created by Roy's Saxy MacBook on 12/21/22.
//

import UIKit
import Foundation

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func linkedInBtn(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.linkedin.com")! as URL, options: [:], completionHandler: nil)
    }
}

