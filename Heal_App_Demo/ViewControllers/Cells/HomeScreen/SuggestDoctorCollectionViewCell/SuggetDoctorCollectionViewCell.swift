//
//  SuggetDoctorCollectionViewCell.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 25/05/2022.
//

import UIKit

class SuggetDoctorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var imgIllustration: UIImageView!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblMajor: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    let doctorAvatarPlaceholder = UIImage(named: "icon-doctor-avatar-placeholder")
    
    override func awakeFromNib() {
            super.awakeFromNib()
    }
    
    func configureViews(doctor: DoctorListModel?) {
        let imgURL = doctor?.avatar
        let major = doctor?.majors_name
        let name = doctor?.name
        let star = doctor?.ratio_star
        let numberOfRate = doctor?.number_of_reviews
        configureViews(imgURL: imgURL, major: major, name: name, star: star, numberOfRate: numberOfRate)
        
    }
    
    func configureViews(imgURL: String?, major: String?, name: String?, star: Double?, numberOfRate: Int?  ){
        UItilities.loadImage(imgIllustration, strURL: imgURL ?? "", placeHolder: doctorAvatarPlaceholder)
        lblName.text = name ?? ""
        lblMajor.text = major ?? ""
        let fontAttributed = UIFont(name: "NunitoSans-Regular", size: 11)
        let headColor = UIColor(red: 0.09, green: 0.10, blue: 0.12, alpha: 1.00)
        let tailColor = UIColor(red: 0.59, green: 0.61, blue: 0.67, alpha: 1.00)
        let attributedScore = NSMutableAttributedString().attrStr(text: String(format: "%0.1f", star ?? 0), font: fontAttributed, textColor: headColor)
            .attrStr(text: "(\(numberOfRate ?? 0))", font: fontAttributed, textColor: tailColor)
        lblRate.attributedText = attributedScore
    }

}
