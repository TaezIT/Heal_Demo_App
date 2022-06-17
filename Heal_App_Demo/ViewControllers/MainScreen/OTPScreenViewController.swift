//
//  OTPScreen.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 19/05/2022.
//

import Foundation
import UIKit

class OTPScreenViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var stvCodeOTP: OTPStackView!
    @IBOutlet weak var lblNotification: UILabel!
    @IBOutlet weak var btnBackLoginScreen: UIButton!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var btnResendCode: UIButton!
    @IBOutlet weak var btnNextHomeScreen: UIButton!
    
    var valuePhoneNumber = String()
    var dateStart = Date()
    var otpValueDidChanged: ((String) -> ())? = nil
    var textFieldArray = [OTPTextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        startCountDown()
        registerObserver()
    }
    
    func setupView() {
        lblError.text = nil
        lblError.isHidden = true
        self.updateResendOTPButtonUI(enable: false)
        self.updateButtonUI(btnNextHomeScreen, enable: false, color: UIColor(red: 0.173, green: 0.525, blue: 0.404, alpha: 1))
        
        let otpFont = UIFont(name: "NunitoSans-SemiBold", size: 20)
        stvCodeOTP.configTextFieldView(borderStyle: .none,
                                       font: otpFont,
                                       editingBorderColor: UIColor(red: 0.173, green: 0.525, blue: 0.404, alpha: 1),
                                       nonEditingborderColor: .white,
                                       borderWidth: 1,
                                       cornerRadius: 8)
        
        stvCodeOTP.otpValueDidChanged = {[weak self] in
            guard let self = self else { return}
            
            self.updateButtonUI(self.btnNextHomeScreen, enable: $0.count == 6, color: UIColor(red: 0.173, green: 0.525, blue: 0.404, alpha: 1))
        }
        
        stvCodeOTP.becomeFirstResponder()
        
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
            lblError.text = nil
            lblError.isHidden = true
            return
        }
        lblError.text = error
        lblError.isHidden = false
    }
    
    private func resetCountDown() {
        dateStart = Date()
        updateResendOTPButtonUI(enable: false)
        startCountDown()
    }
    
    private func updateResendOTPButtonUI(enable: Bool) {
        btnResendCode.isEnabled = enable
        btnResendCode.borderColor = enable ? UIColor(red: 0.173, green: 0.525, blue: 0.404, alpha: 1) : UIColor(red: 0, green: 0, blue: 0, alpha: 0.08)
        btnResendCode.setTitleColor(enable ? UIColor(red: 0.173, green: 0.525, blue: 0.404, alpha: 1) : UIColor(red: 0, green: 0, blue: 0, alpha: 0.08) , for: .normal)
    }
    
    private func startCountDown(){
        let counter = Int(60 + dateStart.timeIntervalSinceNow)
        guard counter >= 0 else { return }
        
        var counterStr = counter < 10 ? "0\(counter)" : "\(counter)"
        counterStr += "s"
        btnResendCode.setTitle("Gửi lại mã sau" + " " + counterStr, for: .disabled)
        if counter == 0 {
            self.updateResendOTPButtonUI(enable: true)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
        {[weak self] in
            guard let self = self else { return }
            self.startCountDown()
        }
    }

    func clearCurrentOTP() {
        textFieldArray.forEach({ $0.text = "" })
    }
    
    func getOTPString() -> String {
        let otps = textFieldArray.compactMap({ $0.text}).joined()
        return otps
    }
    func updateButtonUI(_ btn: UIButton, enable: Bool, color: UIColor) {
        btn.isEnabled = enable
        btn.backgroundColor = enable ? color : color.withAlphaComponent(0.3)
    }
    
    private func updateNextButtonUI(enable: Bool) {
        btnNextHomeScreen.isEnabled = enable
        btnNextHomeScreen.alpha = enable ? 1 : 0.3
    }
    

    //    ----------- ----------- ----------- -----------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerObserver()
        clearCurrentOTP()
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
    
    @IBAction func tappedResendOTP(_ sender: Any) {
        resetCountDown()
    }
    @IBAction func backLoginScreen(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextHomeScreen(_ sender: Any) {
        if stvCodeOTP.getOTPString() == "111111" {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else
        {
            updateAPIErrorLabel(error: "Nhập sai mã xác thực")
        }
    }
    
}
