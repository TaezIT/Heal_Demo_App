//
//  DoctorListModel.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 26/05/2022.
//

import Foundation
class DoctorListModel {
    var id: Int?
    var full_name: String?
    var name: String?
    var last_name: String?
    var contact_email: String?
    var phone: String?
    var avatar: String?
    var majors_name: String?
    var ratio_star: Double?
    var number_of_reviews: Int?
    var number_of_stars: Double?
    convenience init(id: Int?,
                     full_name: String?,
                     name: String?,
                     last_name: String?,
                     contact_email: String?,
                     phone: String?,
                     avatar: String?,
                     majors_name: String?,
                     ratio_star: Double?,
                     number_of_reviews: Int?,
                     number_of_stars: Double?) {
        self.init()
        self.id = id
        self.full_name = full_name
        self.name = name
        self.last_name = last_name
        self.contact_email = contact_email
        self.phone = phone
        self.avatar = avatar
        self.majors_name = majors_name
        self.ratio_star = ratio_star
        self.number_of_reviews = number_of_reviews
        self.number_of_stars = number_of_stars
    }
    convenience init(json: [String: Any]) {
        self.init()
        
        if let wrapValue = json["id"] as? Int {
            self.id = wrapValue
        }
        if let wrapValue = json["full_name"] as? String {
            self.full_name = wrapValue
        }
        if let wrapValue = json["name"] as? String {
            self.name = wrapValue
        }
        if let wrapValue = json["last_name"] as? String {
            self.last_name = wrapValue
        }
        if let wrapValue = json["contact_email"] as? String {
            self.contact_email = wrapValue
        }
        if let wrapValue = json["phone"] as? String {
            self.phone = wrapValue
        }
        if let wrapValue = json["avatar"] as? String {
            self.avatar = wrapValue
        }
        if let wrapValue = json["majors_name"] as? String {
            self.majors_name = wrapValue
        }
        if let wrapValue = json["ratio_star"] as? Double {
            self.ratio_star = wrapValue
        }
        if let wrapValue = json["number_of_reviews"] as? Int {
            self.number_of_reviews = wrapValue
        }
        if let wrapValue = json["number_of_stars"] as? Double {
            self.number_of_stars = wrapValue
        }
        
    }
}
