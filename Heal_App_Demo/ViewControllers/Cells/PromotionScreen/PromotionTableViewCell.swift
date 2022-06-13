//
//  PromotionTableViewCell.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 02/06/2022.
//

import UIKit

class PromotionTableViewCell: UITableViewCell {

    @IBOutlet weak var viwBackGround: UIView!
    @IBOutlet weak var imgIllustration: UIImageView!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblDatetime: UILabel!
    @IBOutlet weak var imgSymbolic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureViews(promotion:PromotionScreenListModel?) {
        let imgURL = promotion?.picture
        let content = promotion?.name
        let datetime = promotion?.created_at
        configureViews(imgURL: imgURL, content: content, datetime: datetime)
    }
    func configureViews(imgURL: String?, content: String?, datetime: String?) {
        lblDatetime.text = datetime ?? ""
        lblContent.text = content ?? ""
        UItilities.loadImage(imgIllustration, strURL: imgURL ?? "", placeHolder: nil)
    }
    
    
}
