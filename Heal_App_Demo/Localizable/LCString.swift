//
//  LCString.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 13/06/2022.
//

import Foundation
enum LCString: String {
    case loading
    
    var localized: String {
        return self.rawValue.localized
    }
}
