//
//  DetailsViewController.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 09/06/2022.
import UIKit
import Foundation
import WebKit
import ToastViewSwift
class DetailsViewController: UIViewController {
    
    @IBOutlet weak var idvLoadDetail: UIActivityIndicatorView!
    @IBOutlet weak var wbvDetail: WKWebView!
    @IBOutlet weak var btnCopyURL: UIButton!
    
    var linkURL = ""
    var copyURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStr = linkURL
        let request = URLRequest(url: URL(string: urlStr)!)
        self.wbvDetail.load(request)
        self.wbvDetail.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        
        
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if wbvDetail.isLoading {
                idvLoadDetail.startAnimating()
                idvLoadDetail.isHidden = false
            }else {
                idvLoadDetail.stopAnimating()
                idvLoadDetail.isHidden = true
            }
        }
    }
    @IBAction func backOnPress(_ sender: Any) {
        navigationController?.popViewController(animated: true)

    }
    @IBAction func copyOnPress(_ sender: Any) {
        copyURL = linkURL
        UIPasteboard.general.string = linkURL
        let notiCopyURL = Toast.text("Copy to clipboard")
        notiCopyURL.show()
    }
}
