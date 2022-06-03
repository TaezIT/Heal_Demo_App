//
//  PromotionViewController.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 01/06/2022.
//

import Foundation
import UIKit
class PromotionViewController: UIViewController {
    
    @IBOutlet weak var tbvPromotion: UITableView!
    lazy var refreshControl: UIRefreshControl = {
        let rfc  = UIRefreshControl()
        return rfc
    }()
    
    var promotionModel: PromotionModel?
    var promotionScreenListModel: [PromotionScreenListModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvPromotion.register(UINib(nibName: "PromotionTableViewCell", bundle: nil), forCellReuseIdentifier: "PromotionTableViewCell")
        self.refreshControl.addTarget(self, action: #selector(fetchPromotionNewsFeed), for: .valueChanged)
        fetchPromotionNewsFeed()
        tbvPromotion.refreshControl = refreshControl
        tbvPromotion.dataSource = self
        tbvPromotion.delegate = self
       // tbvPromotion.backgroundColor = .blue
    }
    @objc func fetchPromotionNewsFeed() {
        //self.showLoaderView()
        APIUtilities.requestPromotionFeed { [weak self] promotionNewsFeed, error in
            guard let self = self else { return}
            //  self.dismissLoaderView()
            self.refreshControl.endRefreshing()
            
            guard let promotionNewsFeed = promotionNewsFeed, error == nil else {
                return
            }
            
            self.promotionModel = promotionNewsFeed
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}
                
                self.tbvPromotion.reloadData()
            }
        }
    }
    
}
extension PromotionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
}

extension PromotionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promotionScreenListModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromotionTableViewCell", for: indexPath) as! PromotionTableViewCell
        cell.configureViews(promotion: promotionScreenListModel?[indexPath.item])
        return cell
    }
}



