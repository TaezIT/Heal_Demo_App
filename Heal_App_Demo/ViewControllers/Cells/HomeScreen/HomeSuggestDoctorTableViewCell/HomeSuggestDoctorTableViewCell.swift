//
//  HomeSuggestDoctorTableViewCell.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 25/05/2022.
//

import UIKit
import CoreMedia

class HomeSuggestDoctorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cltvSuggestDoctor: UICollectionView!
    
    var doctorList: [DoctorListModel]?
    var homeModel :[HomeModel]?
    weak var delegate: NewsAndPromotionTableViewCellProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        cltvSuggestDoctor.register(UINib(nibName: "SuggetDoctorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SuggetDoctorCollectionViewCell")
        cltvSuggestDoctor.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        cltvSuggestDoctor.delegate = self
        cltvSuggestDoctor.dataSource = self
        
    }
    func configure(doctorList:[DoctorListModel]?) {
        self.doctorList = doctorList
        cltvSuggestDoctor.reloadData()
    }
        
    @IBAction func nextScreen(_ sender: Any) {
        if let doctorList = doctorList {
        delegate?.didTapSeeAll(choose: chooseScreen.doctorScreen)
        }
    }
}
extension HomeSuggestDoctorTableViewCell: UICollectionViewDelegate {
}

extension HomeSuggestDoctorTableViewCell:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 121, height: collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}

extension HomeSuggestDoctorTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  doctorList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SuggetDoctorCollectionViewCell", for: indexPath) as! SuggetDoctorCollectionViewCell
        cell.configureViews(doctor: doctorList?[indexPath.item])
        return cell
    }
}


