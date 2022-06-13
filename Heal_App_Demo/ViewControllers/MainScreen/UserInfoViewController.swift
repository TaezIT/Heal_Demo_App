//
//  UserInfomationScreen.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 07/06/2022.
//

import Foundation
import UIKit
class UserInfoViewController: UIViewController {
    @IBOutlet weak var sgcGender: UISegmentedControl!
    @IBOutlet weak var txfLastName: UITextField!
    @IBOutlet weak var txfFirstName: UITextField!
    @IBOutlet weak var txfBirthday: UITextField!
    @IBOutlet weak var txfPhoneNumber: UITextField!
    @IBOutlet weak var txfEmail: UITextField!
    @IBOutlet weak var txfCity: UITextField!
    @IBOutlet weak var txfDistrict: UITextField!
    @IBOutlet weak var txfWard: UITextField!
    @IBOutlet weak var txfFullAddress: UITextField!
    @IBOutlet weak var txfBloodName: UITextField!
    
    var userModel: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func backHomeScreen(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func setUpViews() {
        
    }
}
