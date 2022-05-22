//
//  ExtensionLabel.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 17/05/2022.
//

import Foundation
import UIKit
extension UILabel {
    func configureLabel() {
        self.textColor =  UIColor(red: 0.141, green: 0.165, blue: 0.38, alpha: 1)
      //  self.font = UIFont(name: "NunitoSans-Bold", size: 24)
        self.numberOfLines = 0
    }
    func configureLabel2() {
        self.textColor =   UIColor(red: 0.212, green: 0.239, blue: 0.306, alpha: 1)
       // self.font = UIFont(name: "NunitoSans-Regular", size: 14)
        self.numberOfLines = 0
    }
}
