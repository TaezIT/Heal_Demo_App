//
//  TittleTableViewCell.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 17/06/2022.
//

import UIKit

class TittleTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDatetime: UILabel!
    @IBOutlet weak var lblTittle: UILabel!
    @IBOutlet weak var imgContent: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureViews(news:NewsScreenListModel?) {
        let imgURL = news?.picture
        let content = news?.title
        let datetime = news?.created_at
        configureViews(imgURL: imgURL, content: content, datetime: datetime)
    }
    func configureViews(imgURL: String?, content: String?, datetime: String?) {
        lblDatetime.text = datetime ?? ""
        lblTittle.text = content ?? ""
        UItilities.loadImage(imgContent, strURL: imgURL ?? "", placeHolder: nil)
    }
    
}
