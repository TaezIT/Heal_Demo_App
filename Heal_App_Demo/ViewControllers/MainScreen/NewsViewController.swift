//
//  NewsViewController.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 05/06/2022.
//

import Foundation
import UIKit
class NewsViewController: UIViewController {
    
    @IBOutlet weak var tbvNews: UITableView!
    lazy var refreshControl: UIRefreshControl = {
        let rfc  = UIRefreshControl()
        return rfc
    }()
    
    var newsModel: NewsModel?
    var news : [NewsScreenListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvNews.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        self.refreshControl.addTarget(self, action: #selector(fetchNewsFeed), for: .valueChanged)
        tbvNews.refreshControl = refreshControl
        tbvNews.dataSource = self
        tbvNews.delegate = self
        fetchNewsFeed()
    }
    @objc func fetchNewsFeed() {
        //self.showLoaderView()
        APIUtilities.requestNewsFeed { [weak self] newsFeed, error in
            guard let self = self else { return}
            //  self.dismissLoaderView()
            self.refreshControl.endRefreshing()
            
            guard let newsFeed = newsFeed, error == nil else {
                return
            }
            self.newsModel = newsFeed
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}
                self.tbvNews.reloadData()
            }
        }
    }
    
    @IBAction func backHomeScreen(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        vc!.linkURL = newsModel?.newsScreenList[indexPath.row].link ?? ""
        navigationController?.pushViewController(vc!, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModel?.newsScreenList.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.configureViews(news: newsModel?.newsScreenList[indexPath.row])
        return cell
    }
    
    
}
