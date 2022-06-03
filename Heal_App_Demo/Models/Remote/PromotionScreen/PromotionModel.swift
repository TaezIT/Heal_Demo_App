//
//  PromotionModel.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 01/06/2022.
//

import Foundation
class PromotionModel: NSObject,JsonInitObject {
    
    var promotionScreenList: [PromotionScreenListModel] = []
    
   convenience init(promotionScreenList :[PromotionScreenListModel]) {
       self.init()
       self.promotionScreenList = promotionScreenList
        
    }
    required convenience init(json: [String : Any]) {
        self.init()
        for (key,value) in json {
            if key == "items", let wrapValue = value as? [[String: Any]] {
                let jsonValue = wrapValue.map({PromotionScreenListModel(json: $0)})
                self.promotionScreenList = jsonValue
            }
        }
    }
        
}
