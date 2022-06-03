//
//  NewsCollectionViewCell.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 25/05/2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgIllustration: UIImageView!
    @IBOutlet weak var lblDatetime: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblTittle: UILabel!
    let imagePlaeholder = UIImage(named: "icon-ImagePlaceholder")
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureViews( news: ArticleListModel?) {
        let imageURL = news?.picture
        let tittle = news?.title
        let category = news?.category_name
        let datetime = news?.created_at
        configureViews(imageURL: imageURL, tittle: tittle, catergory: category, datetime: datetime)
    }
    
    func configureViews( promotion: PromotionListModel?) {
        let imageURL = promotion?.picture
        let tittle = promotion?.name
        let category = promotion?.category_name
        let datetime = promotion?.created_at
        configureViews(imageURL: imageURL, tittle: tittle, catergory: category, datetime: datetime)
    }
    
    func configureViews( imageURL: String?, tittle: String?, catergory: String?, datetime: String?) {
        UItilities.loadImage(imgIllustration, strURL: imageURL ?? "", placeHolder: imagePlaeholder)
        lblTittle.text = tittle ?? ""
        lblCategory.text = catergory ?? ""
        lblDatetime.text = datetime ?? ""
    }
}
