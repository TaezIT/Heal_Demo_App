//
//  HomeViewController.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 23/05/2022.
//

import Foundation
import UIKit
class HomeViewController: UIViewController {
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var tbvHome: UITableView!
    @IBOutlet weak var viewHoldTBV: UIView!
    
    lazy var refreshControl: UIRefreshControl = {
        let rfc  = UIRefreshControl()
        return rfc
    }()
    
    var homeModel: HomeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvHome.register(UINib(nibName: "HomeSuggestDoctorTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeSuggestDoctorTableViewCell")
        tbvHome.register(UINib(nibName: "NewsAndPromotionTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsAndPromotionTableViewCell")
        self.refreshControl.addTarget(self, action: #selector(fetchPatientNewFeed), for: .valueChanged)
        fetchPatientNewFeed()
        tbvHome.refreshControl = refreshControl
        tbvHome.dataSource = self
        tbvHome.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        viewHoldTBV.cornerRadius = 25
        imgAvatar.cornerRadius = 21
    }
    @objc func fetchPatientNewFeed() {
        //self.showLoaderView()
        APIUtilities.requestHomeFeed { [weak self] patientNewFeed, error in
            guard let self = self else { return}
          //  self.dismissLoaderView()
            self.refreshControl.endRefreshing()

            guard let patientNewFeed = patientNewFeed, error == nil else {
                return
            }

            self.homeModel = patientNewFeed

            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}

                self.tbvHome.reloadData()
            }
        }
    }
   
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 2 {
            return 260
        }
        return 300
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsAndPromotionTableViewCell", for: indexPath) as! NewsAndPromotionTableViewCell
            cell.configureViews(articleList: homeModel?.articleList)
            return cell
        }
        if indexPath.item == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsAndPromotionTableViewCell", for: indexPath) as! NewsAndPromotionTableViewCell
            cell.configureViews(promotionList: homeModel?.promotionList)
            return cell
        }
        if indexPath.item == 2 {
           let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSuggestDoctorTableViewCell", for: indexPath) as! HomeSuggestDoctorTableViewCell
            cell.configure(doctorList: homeModel?.doctorList)
            return cell
        }
        fatalError()
    }
    
    
}
