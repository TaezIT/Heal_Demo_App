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
        for (key,value) in json {
            if key == "id", let wrapValue = value as? Int {
                let jsonValue = wrapValue
                self.id = jsonValue
            }
            if key == "full_name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.full_name = jsonValue
            }
            if key == "name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.name = jsonValue
            }
            if key == "last_name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.last_name = jsonValue
            }
            if key == "contact_email", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.contact_email = jsonValue
            }
            if key == "phone", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.phone = jsonValue
            }
            if key == "avatar", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.avatar = jsonValue
            }
            if key == "majors_name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.majors_name = jsonValue
            }
            if key == "ratio_star", let wrapValue = value as? Double {
                let jsonValue = wrapValue
                self.ratio_star = jsonValue
            }
            if key == "number_of_reviews", let wrapValue = value as? Int {
                let jsonValue = wrapValue
                self.number_of_reviews = jsonValue
            }
            if key == "number_of_stars", let wrapValue = value as? Double {
                let jsonValue = wrapValue
                self.number_of_stars = jsonValue
            }
        }
    }
}
