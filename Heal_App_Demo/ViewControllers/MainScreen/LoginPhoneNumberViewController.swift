//
//  LoginPhoneNumber.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 19/05/2022.
//

import Foundation
import UIKit
class LoginPhoneNumberViewController: UIViewController {
    @IBOutlet weak var btnChangeLanguage: UIButton!
    @IBOutlet weak var viewHotline: UIView!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var btnNextScreen: UIButton!
    @IBOutlet weak var lblHotline: UILabel!
    @IBOutlet weak var btnHotline: UIButton!
    @IBOutlet weak var viewHoldPhoneNumber: UIView!
    @IBOutlet weak var btnBackScreen: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVIew()
    }
    func setUpVIew(){
        btnChangeLanguage.layer.cornerRadius = 15
        btnBackScreen.layer.cornerRadius = 16
        btnNextScreen.layer.cornerRadius = 24
        //btnNextScreen.setTitleColor(.white, for: .normal)
        viewHoldPhoneNumber.layer.cornerRadius = 28
        viewHotline.layer.cornerRadius = 24
        viewHoldPhoneNumber.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        viewHoldPhoneNumber.layer.shadowOpacity = 1
        viewHoldPhoneNumber.layer.shadowRadius = 20
        viewHoldPhoneNumber.layer.shadowOffset = CGSize(width: 0, height: 4)
        viewHoldPhoneNumber.layer.borderWidth = 1
        tfPhoneNumber.addTarget(self, action: #selector(textFieldEdit(_:)), for: .editingChanged)
//        viewHoldPhoneNumber.layer.borderColor = UIColor(red: 0.933, green: 0.937, blue: 0.957, alpha: 1).cgColor
        checkValidInTextField()
    }
    let constants = Constants.self
    func updateTextFieldUI(_ txt: UITextField, toEditing: Bool) {
        let subviews = txt.superview?.subviews ?? []
        
        for sub in subviews {
            guard sub.tag == 1 else { continue }
            
            if let sub = sub as? UILabel {
                sub.textColor = toEditing ? constants.Color.greenBlue : constants.Color.gray3
            } else {
                sub.backgroundColor = toEditing ? constants.Color.greenBlue : constants.Color.neutral05
            }
        }
    }
    @objc func textFieldEdit(_ textField: UITextField) {
        checkValidInTextField()
    }
    private func updateNextButtonUI(enable: Bool) {
        btnNextScreen.isEnabled = enable
        btnNextScreen.alpha = enable ? 1 : 0.3
    }
    func checkValidInTextField() {
        let phoneNumber = (tfPhoneNumber.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        var numberCurrent = phoneNumber.count >= 9
        if phoneNumber.hasPrefix("0"){
            numberCurrent = phoneNumber.count >= 10
        }
        updateNextButtonUI(enable: numberCurrent)
    }
//    func checkNumberInTextFied(_ textField: UITextField){
//        for find in textField.text. - 1 {
//
//        }
//    }
    @IBAction func backScreenSignup(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextToOTPScreen(_ sender: Any) {
    }
}
extension LoginPhoneNumberViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        viewHoldPhoneNumber.layer.borderColor = UIColor(red: 0.173, green: 0.525, blue: 0.404, alpha: 1).cgColor
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewHoldPhoneNumber.layer.borderColor = UIColor(red: 0.933, green: 0.937, blue: 0.957, alpha: 1).cgColor
    }
    
}
