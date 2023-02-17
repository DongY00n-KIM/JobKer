//
//  ApplicationListDelegate.swift
//  JobKer
//
//  Created by Roy's Saxy MacBook on 1/29/23.
//

import Foundation

protocol ApplicationListDelegate{
    func addApplicationInfo(_ applicationInfo: ApplicationInfo)
    func applicationInfoEdited(_ editedApplication: ApplicationInfo)
    func editBtnTapped(_ selected: ApplicationInfo)
}
