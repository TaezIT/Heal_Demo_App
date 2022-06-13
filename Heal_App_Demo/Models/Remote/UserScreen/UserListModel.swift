//
//  UserListModel.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 07/06/2022.
//

import Foundation
class UserListModel {
    var name: String?
    var last_name: String?
    var birth_date: String?
    var sex: Int?
    var phone: String?
    var contact_email: String?
    var full_address: String?
    var blood_name: String?
    convenience init(name: String?,
                     last_name: String?,
                     birth_date: String?,
                     sex: Int?,
                     phone: String?,
                     contact_email: String?,
                     full_address: String?,
                     blood_name: String?) {
        self.init()
        self.name = name
        self.last_name = last_name
        self.birth_date = birth_date
        self.sex = sex
        self.phone = phone
        self.contact_email = contact_email
        self.full_address = full_address
        self.blood_name = blood_name
    }
    
    convenience init(json: [String: Any]) {
        self.init()
        
        if let wrapValue = json["name"] as? String {
            self.name = wrapValue
        }
        if let wrapValue = json["last_name"] as? String {
            self.last_name = wrapValue
        }
        if let wrapValue = json["birth_date"] as? String {
            self.birth_date = wrapValue
        }
        if let wrapValue = json["sex"] as? Int {
            self.sex = wrapValue
        }
        if let wrapValue = json["phone"] as? String {
            self.phone = wrapValue
        }
        if let wrapValue = json["contact_email"] as? String {
            self.contact_email = wrapValue
        }
        if let wrapValue = json["full_address"] as? String {
            self.full_address = wrapValue
        }
        if let wrapValue = json["blood_name"] as? String {
            self.blood_name = wrapValue
        }
        
    }
}
