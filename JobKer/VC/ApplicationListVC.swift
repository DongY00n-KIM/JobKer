//
//  ApplicationListVC.swift
//  JobKer
//
//  Created by Roy's Saxy MacBook on 1/10/23.
//

import Foundation
import UIKit

//table view
//cell
//data source -

class ApplicationListVC: UIViewController {
    
    @IBOutlet weak var applicationListTableView: UITableView!
    var applicationList : [ApplicationInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(openAddApplication))
        
        applicationListTableView.dataSource = self
        
        applicationListTableView.register(ApplicationCell.nibID, forCellReuseIdentifier: ApplicationCell.cellID)
    }
    
    @objc fileprivate func openAddApplication(sender: UIBarButtonItem){
        let story = UIStoryboard(name: "ApplicationList", bundle: nil)
        let addApplicationVC = story.instantiateViewController(identifier: "AddApplicationVC") as! AddApplicationVC
        addApplicationVC.applicationListDelegate = self
        self.navigationController?.pushViewController(addApplicationVC, animated: true)
    }
}

extension ApplicationListVC:UITableViewDataSource{
    //how many datas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applicationList.count
    }
    
    // how many types of cell
    // cell setting?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print(#fileID, #function, #line, "- <#comment#>")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ApplicationCell.cellID, for:indexPath) as? ApplicationCell else {
            return UITableViewCell()
        }
        
        let cellData = applicationList[indexPath.row]
        cell.positionCell.text = cellData.position
        cell.statusCell.text = cellData.status
        cell.companyCell.text = cellData.companyName
        cell.dateCell.text = cellData.date
       
        return cell
    }
}

extension ApplicationListVC : ApplicationListDelegate{
    func addApplicationInfo(_ applicationInfo: ApplicationInfo) {
        self.applicationList.append(applicationInfo)
        self.applicationListTableView.reloadData()
    }
}
