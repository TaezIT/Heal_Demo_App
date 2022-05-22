//
//  OTPScreen.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 19/05/2022.
//

import Foundation
import UIKit
class OTPScreenViewController: UIViewController {
    
    @IBOutlet weak var lblNotification: UILabel!
    @IBOutlet weak var btnBackLoginScreen: UIButton!
    @IBOutlet weak var stvOTP: UIStackView!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var btnResendCode: UIButton!
    @IBOutlet weak var nextHomeScreen: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    func configureViews(){
        btnBackLoginScreen.layer.cornerRadius = 16
    }
    @IBAction func backLoginScreen(_ sender: Any) {
    }
    @IBAction func nextHomeScreen(_ sender: Any) {
    }
    
}
