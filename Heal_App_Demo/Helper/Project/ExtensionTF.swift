//
//  ExtensionTF.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 23/05/2022.
//

import Foundation
import UIKit
extension UITextField {
    func configureShadow() {
        self.layer.shadowColor = UIColor(red: 0.0, green: 0, blue: 0, alpha: 0.08).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 8
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        
    }
}
