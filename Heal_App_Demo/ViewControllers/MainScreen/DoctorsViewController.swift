//
//  DoctorViewController.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 06/06/2022.
//

import Foundation
import UIKit
class DoctorsViewController: UIViewController {
    
    @IBOutlet weak var tbvDoctor: UITableView!
    lazy var refreshControl: UIRefreshControl = {
        let rfc  = UIRefreshControl()
        return rfc
    }()
    var doctorModel: DoctorModel?
    var doctor : [DoctorScreenListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvDoctor.register(UINib(nibName: "DoctorTableViewCell", bundle: nil), forCellReuseIdentifier: "DoctorTableViewCell")
        self.refreshControl.addTarget(self, action: #selector(fetchDoctorFeed), for: .valueChanged)
        tbvDoctor.refreshControl = refreshControl
        tbvDoctor.dataSource = self
        tbvDoctor.delegate = self
        fetchDoctorFeed()
    }
    @objc func fetchDoctorFeed() {
        //self.showLoaderView()
        APIUtilities.requestDoctorFeed { [weak self] doctorFeed, error in
            guard let self = self else { return}
          //  self.dismissLoaderView()
            self.refreshControl.endRefreshing()

            guard let doctorFeed = doctorFeed, error == nil else {
                return
            }
            
            self.doctorModel = doctorFeed
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}
                self.tbvDoctor.reloadData()
            }
        }
    }
    @IBAction func backHomeScreen(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension DoctorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
}

extension DoctorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctorModel?.doctorScreenList.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorTableViewCell", for: indexPath) as! DoctorTableViewCell
        cell.configure(doctor: doctorModel?.doctorScreenList[indexPath.row])
        return cell
    }
    
    
}
