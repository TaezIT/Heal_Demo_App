//
//  ViewController.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 17/05/2022.
//

import UIKit


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var pcIntro: UIPageControl!
    @IBOutlet weak var collectionViewImageBackground: UICollectionView!
    @IBOutlet weak var viewBackground: UIView!
    
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var buttonSignIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewImageBackground.register(UINib(nibName: "SignUpScreenCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SignUpScreenCollectionViewCell")
        collectionViewImageBackground.delegate = self
        collectionViewImageBackground.dataSource = self
        buttonSignIn.configureButton()
        buttonSignUp.configureButtonFrame()
        //updateUIWith(currentPage: self.currentPage)
    }
    //    var currentPage = 0 {
    //        didSet {
    //            DispatchQueue.main.async { [weak self] in
    //                guard let self = self else { return}
    //
    //                self.updateUIWith(currentPage: self.currentPage)
    //            }
    //        }
    //    }
    //        func updateUIWith(currentPage: Int) {
    //            pcIntro.currentPage = currentPage
    //        }
    var  currentPage = 0
    
    override func viewDidLayoutSubviews() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(red: 0.651, green: 0.945, blue: 0.969, alpha: 1).cgColor, UIColor(red: 0.953, green: 0.961, blue: 0.984, alpha: 1).cgColor]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradient.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        gradient.bounds = viewBackground.bounds.insetBy(dx: -0.5 * viewBackground.bounds.size.width, dy: -0.5 * viewBackground.bounds.size.height)
        gradient.position = viewBackground.center
        collectionViewImageBackground.backgroundView = viewBackground
        viewBackground.layer.addSublayer(gradient)
    }
    
    @IBAction func btnSignIn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginPhoneNumberViewController") as? LoginPhoneNumberViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func btnSignUp(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginPhoneNumberViewController") as? LoginPhoneNumberViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

extension SignUpViewController: UICollectionViewDelegate {
}


extension SignUpViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelSignUp.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewImageBackground.dequeueReusableCell(withReuseIdentifier: "SignUpScreenCollectionViewCell", for: indexPath) as! SignUpScreenCollectionViewCell
        cell.configure(with: modelSignUp[indexPath.row])
        return cell
    }
    
}

extension SignUpViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewImageBackground.frame.width, height: collectionViewImageBackground.frame.height)
    }
    //    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    //        var scroll = Int(scrollView.contentOffset.x/UIScreen.main.bounds.width)
    //        scroll = min(scroll, modelSignUp.count - 1)
    //        scroll = max(scroll,0)
    //        self.currentPage = scroll
    //    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pcIntro.currentPage = indexPath.row
    }
}
