//
//  UserModel.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 07/06/2022.
//

import Foundation
class UserModel: NSObject, JsonInitObject{

    var userList: [UserListModel] = []
    convenience init(userList: [UserListModel]) {
        self.init()
        self.userList = userList
    }
    required convenience init(json: [String : Any]) {
        self.init()
        if let wrapeValue = json["data"] as? [[String: Any]] {
            let jsonValue = wrapeValue.map({UserListModel(json: $0)})
            self.userList = jsonValue
        }
      }
}
