//
//  LocationModel.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 06/06/2022.
//

import Foundation
class LocationModel: NSObject, JsonInitObject{
    
    var locationList: [LocationListModel] = []
    convenience init(locationList: [LocationListModel]) {
        self.init()
        self.locationList = locationList
    }
    required convenience init(json: [String: Any]) {
        self.init()
        if let wrapeValue = json["data"] as? [[String: Any]] {
            let jsonValue = wrapeValue.map({LocationListModel(json: $0)})
            self.locationList = jsonValue
        }
    }
}
