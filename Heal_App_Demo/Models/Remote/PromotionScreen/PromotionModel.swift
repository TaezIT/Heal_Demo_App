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
        
            if let wrapValue = json["items"] as? [[String: Any]] {
                let jsonValue = wrapValue.map({PromotionScreenListModel(json: $0)})
                self.promotionScreenList = jsonValue
            }

    }
    
}
