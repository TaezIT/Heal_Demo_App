//
//  UIViewController+Extension.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 23/05/2022.
//

import Foundation
import UIKit
import Photos

extension UIViewController {
    class func fromStoryboard <T: UIViewController> (_ vc: T.Type,
                              storyboardName: String = "Main",
                              bundle: Bundle? = nil) -> T {
        
        let storyBoard = UIStoryboard(name: storyboardName, bundle: bundle)
        let identifier = String(describing: vc)
        let vc = storyBoard.instantiateViewController(withIdentifier: identifier) as! T
        
        return vc
    }
    
    class func fromNib(bundle: Bundle? = nil) -> Self {
        func instantiateFromNib<T: UIViewController>(bundle: Bundle? = nil) -> T {
            return T.init(nibName: String(describing: T.self), bundle: bundle)
        }

        return instantiateFromNib(bundle: bundle)
    }
    
    var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets ?? .zero
        }
        
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows[0]
            return window.safeAreaInsets
        }
        
        return .zero
    }
    
}
