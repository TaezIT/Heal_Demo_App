//
//  HomeModel.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 26/05/2022.
//

import Foundation
class HomeModel: NSObject, JsonInitObject {
    
    var articleList: [ArticleListModel] = []
    var promotionList: [PromotionListModel] = []
    var  doctorList: [DoctorListModel] = []
    
    convenience init(articleList: [ArticleListModel],
                     promotionList: [PromotionListModel],
                     doctorList: [DoctorListModel]) {
        self.init()
        self.articleList = articleList
        self.promotionList = promotionList
        self.doctorList = doctorList
        
    }
    required convenience init(json: [String : Any]) {
        self.init()
            if let wrapValue = json["articleList"] as? [[String: Any]] {
                let jsonValue = wrapValue.map({ArticleListModel(json: $0)})
                self.articleList  = jsonValue
            }
            if let wrapValue = json["promotionList"] as? [[String: Any]] {
                let jsonValue = wrapValue.map({PromotionListModel(json: $0)})
                self.promotionList  = jsonValue
            }
            if let wrapValue = json["doctorList"] as? [[String: Any]] {
                let jsonValue = wrapValue.map({DoctorListModel(json: $0)})
                self.doctorList  = jsonValue
            }
    }
}
