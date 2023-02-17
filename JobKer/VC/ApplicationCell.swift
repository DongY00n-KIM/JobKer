//
//  ApplicationCellVC.swift
//  JobKer
//
//  Created by Roy's Saxy MacBook on 1/29/23.
//

import Foundation
import UIKit

protocol getCellID{
    static var cellID : String{
        get
    }
}

protocol getNibID{
    static var nibID : UINib{
        get
    }
}

extension getCellID{
    static var cellID : String{
        return String(describing: Self.self)
    }
}

extension getNibID{
    static var nibID : UINib{
        return UINib(nibName: String(describing: Self.self), bundle: .main)
    }
}

extension UITableViewCell : getCellID{}
extension UITableViewCell : getNibID{}

//
//extension UITableViewCell{
//    var cellID : String{
//        return String(describing: Self.self)
//    }
//}
//
//extension UICollectionViewCell{
//    var cellID : String{
//        return String(describing: Self.self)
//    }
//}

class ApplicationCell : UITableViewCell{
    
    @IBOutlet weak var companyCell: UILabel!
    @IBOutlet weak var statusCell: UILabel!
    @IBOutlet weak var positionCell: UILabel!
    @IBOutlet weak var dateCell: UILabel!
    @IBOutlet weak var editBtnCell: UIButton!
    
    var delegate: ApplicationListDelegate? = nil
    var cellData: ApplicationInfo? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- <#comment#>")
        editBtnCell.addTarget(self, action: #selector(editButtonTapped(_:)), for: .touchUpInside)
    }
    
    func configureCell(data: ApplicationInfo, delegate: ApplicationListDelegate){
        self.cellData = data
        self.positionCell.text = data.position
        self.statusCell.text = data.status
        self.delegate = delegate
    }
    
    @objc fileprivate func editButtonTapped(_ sender: UIButton){
        print(#fileID, #function, #line, "- <#comment#>")

        if let cellData = cellData{
            delegate?.editBtnTapped(cellData)
        }
    }
}


