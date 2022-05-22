//
//  SignUpScreenCollectionViewCell.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 17/05/2022.
//

import UIKit

class SignUpScreenCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageCollectionView: UIImageView!
    @IBOutlet weak var labelSubTittle: UILabel!
    @IBOutlet weak var labelIntro: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        labelSubTittle.configureLabel2()
        labelIntro.configureLabel()
    }
    func configure( with modelSign: ModelSignUp){
        self.imageCollectionView.image = UIImage(named: modelSign.imageBackground)
    }
}
