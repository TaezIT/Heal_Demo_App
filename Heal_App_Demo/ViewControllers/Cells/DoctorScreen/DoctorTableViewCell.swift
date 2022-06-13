//
//  DoctorTableViewCell.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 06/06/2022.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMajor: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    let doctorAvatarPlaceholder = UIImage(named: "icon-doctor-avatar-placeholder")
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(doctor:DoctorScreenListModel?) {
        let imgURL = doctor?.avatar
        let major = doctor?.majors_name
        let name = doctor?.name
        let rateStar = doctor?.ratio_star
        let numberOfRate = doctor?.number_of_reviews
        configure(imgURL: imgURL, name: name, major: major, rate: rateStar, numberOfReviews: numberOfRate)
    }
    func configure(imgURL: String?, name: String?, major: String?, rate: Double?, numberOfReviews: Int?) {
        UItilities.loadImage(imgAvatar, strURL: imgURL ?? "", placeHolder: doctorAvatarPlaceholder)
        let majorDoctor = "Chuyên ngành: " + (major ?? "")
        lblName.text = name
        lblMajor.text = majorDoctor
        let font = UIFont(name: "NunitoSans-Regular", size: 14)
        let headColor = UIColor(red: 0.09, green: 0.10, blue: 0.12, alpha: 1.00)
        let tailColor = UIColor(red: 0.59, green: 0.61, blue: 0.67, alpha: 1.00)
        let attributed = NSMutableAttributedString().attrStr(text: String(format: "%0.1f", rate ?? 0), font: font, textColor: headColor, alignment: .center).attrStr(text: "(\(numberOfReviews ?? 0) Đánh giá)", font: font, textColor: tailColor, alignment: .center)
        lblRate.attributedText = attributed
            
    }
}
