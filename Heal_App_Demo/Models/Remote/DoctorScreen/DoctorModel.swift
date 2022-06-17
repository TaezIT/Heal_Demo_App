//
//  DoctorsModel.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 06/06/2022.
//

import Foundation
class DoctorModel: NSObject, JsonInitObject {
    
    var doctorScreenList: [DoctorScreenListModel] = []
    convenience init(doctorScreenList: [DoctorScreenListModel]) {
        self.init()
        self.doctorScreenList = doctorScreenList
    }
    required convenience init(json: [String : Any]) {
        self.init()
        if let wrapValue = json["items"] as? [[String: Any]] {
            let jsonValue = wrapValue.map({DoctorScreenListModel(json: $0)})
            self.doctorScreenList = jsonValue
        }
    }
    
}
