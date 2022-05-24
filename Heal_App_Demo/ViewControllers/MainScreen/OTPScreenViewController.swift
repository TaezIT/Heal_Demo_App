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
    @IBOutlet weak var btnNextHomeScreen: UIButton!
    @IBOutlet weak var tfOTP1: UITextField!
    @IBOutlet weak var tfOTP2: UITextField!
    @IBOutlet weak var tfOTP3: UITextField!
    @IBOutlet weak var tfOTP4: UITextField!
    @IBOutlet weak var tfOTP5: UITextField!
    @IBOutlet weak var tfOTP6: UITextField!
    
    var dateStart = Date()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    var editingBorderColor: UIColor? = nil
    var nonEditingborderColor: UIColor? = nil
    func configureViews(){
        tfOTP1.configureShadow()
        tfOTP2.configureShadow()
        tfOTP3.configureShadow()
        tfOTP4.configureShadow()
        tfOTP5.configureShadow()
        tfOTP6.configureShadow()
    }
    private func updateResendOTPButtonUI(enable: Bool) {
        btnResendCode.isEnabled = enable
        btnResendCode.borderColor = enable ? UIColor(red: 0, green: 0, blue: 0, alpha: 0.08) : UIColor(red: 0.173, green: 0.525, blue: 0.404, alpha: 1)
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
