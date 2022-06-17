//
//  PromotionViewController.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 01/06/2022.
//

import Foundation
import UIKit
class PromotionViewController: UIViewController {
    
    @IBOutlet weak var viwTittle: UIView!
    @IBOutlet weak var tbvPromotion: UITableView!
    lazy var refreshControl: UIRefreshControl = {
        let rfc  = UIRefreshControl()
        return rfc
    }()
    
    var promotionModel: PromotionModel?
    var promotion : [PromotionModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvPromotion.register(UINib(nibName: "PromotionTableViewCell", bundle: nil), forCellReuseIdentifier: "PromotionTableViewCell")
        self.refreshControl.addTarget(self, action: #selector(fetchPromotionNewsFeed), for: .valueChanged)
        tbvPromotion.delegate = self
        tbvPromotion.dataSource = self
        tbvPromotion.refreshControl = refreshControl
        fetchPromotionNewsFeed()
        configureViews()
    }
    func configureViews(){
        viwTittle.layer.cornerRadius = 8
        viwTittle.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        viwTittle.layer.shadowOpacity = 1
        viwTittle.layer.shadowRadius = 25
        viwTittle.layer.shadowOffset = CGSize(width: 0, height: 4)
        viwTittle.clipsToBounds = false
       
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
    @IBAction func backHomeScreen(_ sender: Any) {
            navigationController?.popViewController(animated: true)
        }
}

extension PromotionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
}
extension PromotionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        vc!.linkURL = promotionModel?.promotionScreenList[indexPath.row].link ?? ""
        navigationController?.pushViewController(vc!, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promotionModel?.promotionScreenList.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromotionTableViewCell", for: indexPath) as! PromotionTableViewCell
        cell.configureViews(promotion: promotionModel?.promotionScreenList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
