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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- <#comment#>")
    }
}
