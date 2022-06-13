//
//  NewsAndPromotionTableViewCell.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 25/05/2022.
//

import UIKit



class NewsAndPromotionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cltvNewsAndPromotion: UICollectionView!
    @IBOutlet weak var lblTittile: UILabel!
    
    //weak var delegate: UIViewController?
    weak var delegate: NewsAndPromotionTableViewCellProtocol?
    
    weak var viewController: UIViewController?
    var homeModel: HomeModel?
    var articleList: [ArticleListModel]?
    var promotionList: [PromotionListModel]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblTittile.text = ""
        cltvNewsAndPromotion.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        cltvNewsAndPromotion.register( UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        cltvNewsAndPromotion.delegate = self
        cltvNewsAndPromotion.dataSource = self
    }
    
    func configureViews( articleList:[ArticleListModel]?) {
        lblTittile.text = "Tin tức"
        self.articleList = articleList
        self.promotionList = nil
        cltvNewsAndPromotion.reloadData()
    }
    
    func configureViews( promotionList:[PromotionListModel]?) {
        lblTittile.text = "Khuyến mại"
        self.articleList = nil
        self.promotionList = promotionList
        cltvNewsAndPromotion.reloadData()
    }
    
    @IBAction func nextNewsAndPromotionScreen(_ sender: Any) {
        if let articleList = articleList {
            delegate?.didTapSeeAll(choose: chooseScreen.newsScreen)
        }
        else
        {
            delegate?.didTapSeeAll(choose: chooseScreen.promotionScreen)
        }
        
    }
}
extension NewsAndPromotionTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 258, height: collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}

extension NewsAndPromotionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let articleList = articleList {
            delegate?.moveDetailsScreen(choose: .newsScreen, index: indexPath.row)
        }
        else {
            delegate?.moveDetailsScreen(choose: .promotionScreen, index: indexPath.row)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let articleList = articleList {
            return articleList.count
        }
        else {
            return promotionList?.count ?? 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        if let articleList = articleList {
            cell.configureViews(news: articleList[indexPath.item])
            cell.setupView()
            return cell
        }
        else {
            cell.configureViews(promotion: promotionList?[indexPath.item])
            cell.setupView()
            return cell
        }
    }
    
    
}

