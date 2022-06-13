//
//  NewsModel.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 05/06/2022.
//

import Foundation
class NewsModel: NSObject,JsonInitObject {
    
    var newsScreenList: [NewsScreenListModel] = []
    
    convenience init(newsScreenList :[NewsScreenListModel]) {
        self.init()
        self.newsScreenList = newsScreenList
        
    }
    required convenience init(json: [String : Any]) {
        self.init()
        for (key,value) in json {
            if key == "items", let wrapValue = value as? [[String: Any]] {
                let jsonValue = wrapValue.map({NewsScreenListModel(json: $0)})
                self.newsScreenList = jsonValue
            }
        }
    }
    
}
