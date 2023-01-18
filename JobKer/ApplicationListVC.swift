//
//  ApplicationListVC.swift
//  JobKer
//
//  Created by Roy's Saxy MacBook on 1/10/23.
//

import Foundation
import UIKit

class ApplicationListVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(openAddApplication))
    }
    
    @objc fileprivate func openAddApplication(sender: UIBarButtonItem){
        let story = UIStoryboard(name: "ApplicationList", bundle: nil)
        let addApplicationVC = story.instantiateViewController(identifier: "AddApplicationVC") as! AddApplicationVC
        self.navigationController?.pushViewController(addApplicationVC, animated: true)
//        self.present(controller, animated: true, completion: nil)
//        let navigation = UINavigationController(rootViewController: controller)
//        self.view.addSubview(navigation.view)
//        self.addChild(navigation)
//        navigation.didMove(toParent: self)
    }
}

