//
//  OTPScreen.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 19/05/2022.
//

import Foundation
import UIKit

class OTPScreenViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lblNotification: UILabel!
    @IBOutlet weak var btnBackLoginScreen: UIButton!
    @IBOutlet weak var stvOTP: UIStackView!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var btnResendCode: UIButton!
    @IBOutlet weak var btnNextHomeScreen: UIButton!
    @IBOutlet weak var tfOTP1: OTPTextField!
    @IBOutlet weak var tfOTP2: OTPTextField!
    @IBOutlet weak var tfOTP3: OTPTextField!
    @IBOutlet weak var tfOTP4: OTPTextField!
    @IBOutlet weak var tfOTP5: OTPTextField!
    @IBOutlet weak var tfOTP6: OTPTextField!
    var valuePhoneNumber = String()
    var dateStart = Date()
    var otpValueDidChanged: ((String) -> ())? = nil
    var textFieldArray = [OTPTextField]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFields()
        setupView()
    }
    var editingBorderColor: UIColor? = nil
    var nonEditingborderColor: UIColor? = nil
    func setTF(){
        
    }
    func setTextFields(){
//        textFieldArray = []
//        textFieldArray.append(tfOTP1)
//        textFieldArray.append(tfOTP2)
//        textFieldArray.append(tfOTP3)
//        textFieldArray.append(tfOTP4)
//        textFieldArray.append(tfOTP5)
//        textFieldArray.append(tfOTP6)
//        for i in 0..<textFieldArray.count {
//            textFieldArray[i].delegate = self
//            i != 0 ? (textFieldArray[i].previousTextField = textFieldArray[i-1]) : ()
//            i != 0 ? (textFieldArray[i-1].nextTextFiled = textFieldArray[i]) : ()

//            textFieldArray[i].deleteBackwardHandler = { [weak self] in
//                guard let self = self else { return}
//
//                self.textFieldEditChanged(self.textFieldArray[i])
//            }
//        }
    }
    @objc func textFieldEditChanged(_ textField: UITextField) {
        otpValueDidChanged?(getOTPString())
    }
    private func updateResendOTPButtonUI(enable: Bool) {
        btnResendCode.isEnabled = enable
        btnResendCode.borderColor = enable ? UIColor(red: 0, green: 0, blue: 0, alpha: 0.08) : UIColor(red: 0.173, green: 0.525, blue: 0.404, alpha: 1)
    }
    func clearCurrentOTP() {
        textFieldArray.forEach({ $0.text = "" })
    }
    
    func getOTPString() -> String {
        let otps = textFieldArray.compactMap({ $0.text}).joined()
        return otps
    }
    //    private func startCountDown() {
    //        let secondLeft = Int(60 + dateStart.timeIntervalSinceNow)
    //        guard secondLeft >= 0 else { return }
    //
    //        let lbStr = LCString.resendOTP.localized
    //
    //        var secondLeftStr = secondLeft < 10 ? "0\(secondLeft)" : "\(secondLeft)"
    //        secondLeftStr += "s"
    //
    //        btnResendCode.setTitle(lbStr + " " + secondLeftStr, for: .disabled)
    //
    //        if secondLeft == 0 {
    //            updateResendOTPButtonUI(enable: true)
    //        }
    //
    //        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {[weak self] in
    //            guard let self = self else { return}
    //
    //            self.startCountDown()
    //        }
    //    }
    func setupView() {
        let fontText = UIFont(name: "NunitoSans-Regular", size: 14)
        let fontNumber = UIFont(name: "NunitoSans-Bold", size: 14)
        let headColor = UIColor(red: 0.09, green: 0.10, blue: 0.12, alpha: 1.00)
        let tailColor = UIColor(red: 0.21, green: 0.24, blue: 0.31, alpha: 1.00)
        
        let displayPhoneNumber = valuePhoneNumber.split(by: 3, fromEnd: false).joined(separator: " ")
        let attributedNoti = NSMutableAttributedString()
            .attrStr(text: "Vui lòng nhập mã gồm 6 chữ số đã được gửi đến bạn vào số điện thoại ", font: fontText, textColor: headColor, alignment: nil)
            .attrStr(text: "+84 \(displayPhoneNumber)", font: fontNumber, textColor: tailColor, alignment: nil)
        lblNotification.attributedText = attributedNoti
        
        
    }
    private func updateAPIErrorLabel(error: String?) {
        guard let error = error else {
            lblNotification.text = nil
            lblError.isHidden = true
            return
        }
        
        lblError.text = error
        lblError.isHidden = false
    }
    
//    private func updateResendOTPButtonUI(enable: Bool) {
//        btnResendCode.isEnabled = enable
//        btnResendCode.borderColor = enable ? UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00) : UIColor(red: 0.85, green: 0.86, blue: 0.88, alpha: 1.00)
//    }
    
    private func resetCountDown() {
        dateStart = Date()
        updateResendOTPButtonUI(enable: false)
        //startCountDown()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObserver()
    }
    
    private func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func updateNextButtonUI(enable: Bool) {
        btnNextHomeScreen.isEnabled = enable
        btnNextHomeScreen.alpha = enable ? 1 : 0.3
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
        let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0
        
        UIView.animate(withDuration: duration) {[weak self] in
            guard let self = self else { return}
            
            self.btnNextHomeScreen.transform = CGAffineTransform(translationX: 0, y: -keyboardSize.height + self.safeAreaInsets.bottom)
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0
        
        UIView.animate(withDuration: duration) {[weak self] in
            guard let self = self else { return}
            
            self.btnNextHomeScreen.transform = .identity
        }
    }
    
    @IBAction func backLoginScreen(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextHomeScreen(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
