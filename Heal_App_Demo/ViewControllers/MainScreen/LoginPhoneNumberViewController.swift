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
        tfPhoneNumber.addTarget(self, action: #selector(textFieldCheckEdit(_:)), for: .editingChanged)
        tfPhoneNumber.addTarget(self, action: #selector(textFieldDidBeginEdit(_:)), for: .editingDidBegin)
        tfPhoneNumber.addTarget(self, action: #selector(textFieldDidEndEdit(_:)), for: .editingDidEnd)
        checkValidInTextField()
        setUpContenView()
    }
    func setUpContenView(){
        btnChangeLanguage.layer.cornerRadius = 15
        btnBackScreen.layer.cornerRadius = 16
        btnNextScreen.layer.cornerRadius = 24
        btnNextScreen.setTitleColor(.white, for: .disabled)
        viewHotline.layer.cornerRadius = 24
        viewHoldPhoneNumber.layer.cornerRadius = 28
        viewHoldPhoneNumber.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        viewHoldPhoneNumber.layer.shadowOpacity = 1
        viewHoldPhoneNumber.layer.shadowRadius = 20
        viewHoldPhoneNumber.layer.borderColor = UIColor(red: 0.933, green: 0.937, blue: 0.957, alpha: 0.2).cgColor
        viewHoldPhoneNumber.layer.shadowOffset = CGSize(width: 0, height: 4)
        viewHoldPhoneNumber.layer.borderWidth = 1
    }
    let constants = Constants.self
    private func updateNextButtonUI(enable: Bool) {
        btnNextScreen.isEnabled = enable
        btnNextScreen.alpha = enable ? 1 : 0.3
    }
    func checkValidInTextField() {
        let phoneNumber = (tfPhoneNumber.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        var numberCurrent = phoneNumber.count == 9
        if phoneNumber.hasPrefix("0"){
            numberCurrent = phoneNumber.count == 10
        }
        updateNextButtonUI(enable: numberCurrent)
    }
//    func checkNumberInTextFied(){
//        for find in 0..<(tfPhoneNumber.text?.count ?? 1) {
//            if () {
//                
//            }
//        }
//    }
    @IBAction func backScreenSignup(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextToOTPScreen(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OTPScreenViewController") as? OTPScreenViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        vc?.valuePhoneNumber = tfPhoneNumber.text ?? ""
    }
}
extension LoginPhoneNumberViewController: UITextFieldDelegate {
    @objc private func textFieldDidBeginEdit(_ textField: UITextField) {
        viewHoldPhoneNumber.layer.borderColor = UIColor(red: 0.173, green: 0.525, blue: 0.404, alpha: 1).cgColor
    }
    @objc private func textFieldDidEndEdit(_ textField: UITextField) {
        viewHoldPhoneNumber.layer.borderColor = UIColor(red: 0.933, green: 0.937, blue: 0.957, alpha: 1).cgColor
    }
    @objc func textFieldCheckEdit(_ textField: UITextField) {
        checkValidInTextField()
    }
}
