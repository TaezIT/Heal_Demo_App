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
    @IBOutlet weak var viwGenderBoy: UIView!
    @IBOutlet weak var viwGenderGirl: UIView!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblDistrict: UILabel!
    
    @IBOutlet weak var lblBloodName: UILabel!
    @IBOutlet weak var lblFullAddress: UILabel!
    @IBOutlet weak var lblWard: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblBirthday: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    
    @IBOutlet weak var imgGirl: UIImageView!
    @IBOutlet weak var imgBoy: UIImageView!
    @IBOutlet weak var lblGirl: UILabel!
    @IBOutlet weak var lblBoy: UILabel!
    @IBOutlet weak var viwBloodName: UIView!
    @IBOutlet weak var viwFullAddress: UIView!
    @IBOutlet weak var viwWard: UIView!
    @IBOutlet weak var viwDistrict: UIView!
    @IBOutlet weak var viwCity: UIView!
    @IBOutlet weak var viwEmail: UIView!
    @IBOutlet weak var viwPhoneNumber: UIView!
    @IBOutlet weak var viwFirstName: UIView!
    @IBOutlet weak var viwLastName: UIView!
    @IBOutlet weak var viwBirtday: UIView!
    @IBOutlet weak var viwContentBoy: UIView!
    
    @IBOutlet weak var viwContentGirl: UIView!
    var ward = ""
    var province = ""
    var district = ""
    var valueSegmented: Int?
    var userModel: UserModel?
    var locationModel: LocationModel?
    var lblSetUp: [UILabel] = []
    var viwSetUp: [UIView] = []
    let greenHightlight = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
    let grayNonHightlight = UIColor(red: 0.59, green: 0.61, blue: 0.67, alpha: 1.00)
    lazy var refreshControl: UIRefreshControl = {
        let rfc  = UIRefreshControl()
        return rfc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl.addTarget(self, action: #selector(fetchPatienUserFeed), for: .valueChanged)
        self.refreshControl.addTarget(self, action: #selector(fetchPatientLocationFeed), for: .valueChanged)
        sgcGender.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        sgcGender.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .touchUpInside)
        fetchPatienUserFeed()
        setUpViews()
        makeArr()
        setUpSGC()
    }
    func makeArr() {
        lblSetUp.append(lblLastName)
        lblSetUp.append(lblFirstName)
        lblSetUp.append(lblBirthday)
        lblSetUp.append(lblPhoneNumber)
        lblSetUp.append(lblEmail)
        lblSetUp.append(lblFullAddress)
        viwSetUp.append(viwLastName)
        viwSetUp.append(viwFirstName)
        viwSetUp.append(viwBirtday)
        viwSetUp.append(viwPhoneNumber)
        viwSetUp.append(viwEmail)
        viwSetUp.append(viwFullAddress)
        txfCity.isUserInteractionEnabled = false
        txfWard.isUserInteractionEnabled = false
        txfDistrict.isUserInteractionEnabled = false
        txfBloodName.isUserInteractionEnabled = false
    }
    func setUpSGC() {
        viwGenderBoy.isUserInteractionEnabled = false
        viwGenderGirl.isUserInteractionEnabled = false
        viwContentGirl.isUserInteractionEnabled = false
        viwContentBoy.isUserInteractionEnabled = false
        lblBoy.isUserInteractionEnabled = false
        lblGirl.isUserInteractionEnabled = false
        imgBoy.isUserInteractionEnabled = false
        imgGirl.isUserInteractionEnabled = false
    }
    func loadData() {
        self.setUpViewsUser()
        self.fetchPatientLocationFeed()
    }
    func setUpViews(){
        txfLastName.delegate = self
        txfFirstName.delegate = self
        txfBirthday.delegate = self
        txfPhoneNumber.delegate = self
        txfEmail.delegate = self
        txfCity.delegate = self
        txfDistrict.delegate = self
        txfWard.delegate = self
        txfFullAddress.delegate = self
        txfBloodName.delegate = self
    }
    @objc func fetchPatienUserFeed() {
        APIUtilities.requestUserInfor { [weak self] patientUserFeed, error in
            guard let self = self else { return}
            self.refreshControl.endRefreshing()
            guard let patientUserFeed = patientUserFeed, error == nil else {
                return
            }
            self.userModel = patientUserFeed
            self.loadData()
        }
    }
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0  {
            lblBoy.textColor = greenHightlight
            lblGirl.textColor = grayNonHightlight
            imgBoy.tintColor = greenHightlight
            imgGirl.tintColor = grayNonHightlight
        }
        else {
            lblBoy.textColor = grayNonHightlight
            lblGirl.textColor = greenHightlight
            imgBoy.tintColor = grayNonHightlight
            imgGirl.tintColor = greenHightlight
        }
    }
    func setUpViewsUser(){
        txfFirstName.text = userModel?.last_name ?? ""
        txfLastName.text = userModel?.name ?? ""
        txfBirthday.text = userModel?.birth_date ?? ""
        txfPhoneNumber.text = userModel?.phone ?? ""
        txfEmail.text = userModel?.contact_email ?? ""
        txfFullAddress.text = userModel?.address ?? ""
        txfBloodName.text = userModel?.blood_name ?? ""
        if userModel?.sex == 0 {
            sgcGender.selectedSegmentIndex = 0
            lblBoy.textColor = greenHightlight
            lblGirl.textColor = grayNonHightlight
            imgBoy.tintColor = greenHightlight
            imgGirl.tintColor = grayNonHightlight
        }
        else {
            sgcGender.selectedSegmentIndex = 1
            lblBoy.textColor = grayNonHightlight
            lblGirl.textColor = greenHightlight
            imgBoy.tintColor = grayNonHightlight
            imgGirl.tintColor = greenHightlight
        }
        
        province = userModel?.province_code ?? ""
        ward = userModel?.ward_code ?? ""
        district = userModel?.district_code ?? ""
        valueSegmented = userModel?.sex ?? 0
    
    }
    
    @objc func fetchPatientLocationFeed() {
        
        APIUtilities.requestLocationInfor(province: (userModel?.province_code)!, district: (userModel?.district_code)!, ward: (userModel?.ward_code)!) { [weak self] patientLocationFeed, error in
            guard let self = self else { return}
            self.refreshControl.endRefreshing()
            guard let patientLocationFeed = patientLocationFeed, error == nil else {
                return
            }
            self.locationModel = patientLocationFeed
            self.setUpViewAddress()
        }
        
    }
    
    func setUpViewAddress(){
        txfCity.text = locationModel?.province_name ?? ""
        txfWard.text = locationModel?.ward_name ?? ""
        txfDistrict.text = locationModel?.district_name ?? ""
        
    }
    
    @IBAction func backHomeScreen(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UserInfoViewController: UITextFieldDelegate,UIGestureRecognizerDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        var tag = 0
        tag = textField.tag
        for i in 0..<lblSetUp.count {
            if lblSetUp[i].tag == tag {
                lblSetUp[i].textColor = greenHightlight
                viwSetUp[i].backgroundColor = greenHightlight
            }
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        var tag = 0
        tag = textField.tag
        for i in 0..<lblSetUp.count {
            if lblSetUp[i].tag == tag {
                lblSetUp[i].textColor = grayNonHightlight
                viwSetUp[i].backgroundColor = grayNonHightlight
            }
        }
    }
}
