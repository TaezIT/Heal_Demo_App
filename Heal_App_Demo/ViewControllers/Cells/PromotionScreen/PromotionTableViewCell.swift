//
//  PromotionTableViewCell.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 02/06/2022.
//

import UIKit

class PromotionTableViewCell: UITableViewCell {

    @IBOutlet weak var imgIllustration: UIImageView!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblDatetime: UILabel!
    @IBOutlet weak var imgSymbolic: UIImageView!
    
    let imgPlaceholder = UIImage(named: "icon-doctor-avatar-placeholder")
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureViews(promotion: PromotionScreenListModel?) {
        let imgURL = promotion?.picture
        let content = promotion?.name
        let datetime = promotion?.created_at
        configureViews(imgURL: imgURL, content: content, datetime: datetime)
    }
    
    func configureViews(imgURL: String?, content: String?, datetime: String?) {
        lblContent.text = content ?? ""
        lblDatetime.text = datetime ?? ""
        imgIllustration.cornerRadius = 8
        UItilities.loadImage(imgIllustration, strURL: imgURL ?? "", placeHolder: imgPlaceholder)
    }
}
