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
        for(key,value) in json {
            if key == "id", let wrapValue = value as? Int {
                let jsonValue = wrapValue
                self.id = jsonValue
            }
            if key == "category_id", let wrapValue = value as? Int  {
                let jsonValue = wrapValue
                self.category_id = jsonValue
            }
            if key == "title", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.title = jsonValue
            }
            if key == "slug", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.slug = jsonValue
            }
            if key == "picture", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.picture = jsonValue
            }
            if key == "picture_caption", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.picture_caption = jsonValue
            }
            if key == "created_at", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.created_at = jsonValue
            }
            if key == "category_name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.category_name = jsonValue
            }
            if key == "link", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.link = jsonValue
            }
            
        }
        
    }
}
