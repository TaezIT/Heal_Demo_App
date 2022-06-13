//
//  ArticleListModel.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 26/05/2022.
//

import Foundation
class ArticleListModel {
    var id: Int?
    var category_id: Int?
    var title: String?
    var slug: String?
    var picture: String?
    var picture_caption: String?
    var created_at: String?
    var category_name: String?
    var link: String?
    
    
    convenience init(id: Int?,
                     category_id: Int?,
                     title: String?,
                     slug: String?,
                     picture: String?,
                     picture_caption: String?,
                     created_at: String?,
                     category_name: String?,
                     link: String?) {
        self.init()
        self.id = id
        self.category_id = category_id
        self.title = title
        self.slug = slug
        self.picture = picture
        self.picture_caption = picture_caption
        self.created_at = created_at
        self.category_name = category_name
        self.link = link
    }
    convenience init( json: [String: Any]) {
        self.init()
        if let wrapValue = json["id"] as? Int {
            self.id = wrapValue
        }
        if let wrapValue = json["category_id"] as? Int  {
            self.category_id = wrapValue
        }
        if let wrapValue = json["title"] as? String {
            self.title = wrapValue
        }
        if let wrapValue = json["slug"] as? String {
            self.slug = wrapValue
        }
        if let wrapValue = json["picture"] as? String {
            self.picture = wrapValue
        }
        if let wrapValue = json["picture_caption"] as? String {
            self.picture_caption = wrapValue
        }
        if let wrapValue = json["created_at"] as? String {
            self.created_at = wrapValue
        }
        if let wrapValue = json["category_name"] as? String {
            self.category_name = wrapValue
        }
        if let wrapValue = json["link"] as? String {
            self.link = wrapValue
        }
        
    }
}
