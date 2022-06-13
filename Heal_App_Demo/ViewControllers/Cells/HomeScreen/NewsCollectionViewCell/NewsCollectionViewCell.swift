//
//  NewsCollectionViewCell.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 25/05/2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBG: UIView!
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
    func setupView() {
        viewBG.layer.cornerRadius = 8
        viewBG.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        viewBG.layer.shadowOpacity = 1
        viewBG.layer.shadowRadius = 20
        viewBG.layer.borderColor = UIColor(red: 0.933, green: 0.937, blue: 0.957, alpha: 0.2).cgColor
        viewBG.layer.shadowOffset = CGSize(width: 0, height: 4)
        viewBG.layer.borderWidth = 1
        viewBG.clipsToBounds = false
    }
}
