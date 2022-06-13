//
//  Utilities.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 31/05/2022.
//

import Foundation
import SDWebImage
import MapKit

class UItilities {
//    static func getGeocode(generalAddress: String, specificAdress: String, completionHandler: ((CLLocationCoordinate2D?) -> Void)?) {
//        let geoCoder = CLGeocoder()
//        geoCoder.geocodeAddressString(specificAdress + ", " + generalAddress) { (placemarks, error) in
//            let placemarks = placemarks
//            let location = placemarks?.first?.location?.coordinate
//            if let location = location {
//                completionHandler?(location)
//            } else {
//                geoCoder.geocodeAddressString(generalAddress) { placemarks, error in
//                    let placemarks = placemarks
//                    let location = placemarks?.first?.location?.coordinate
//                    completionHandler?(location)
//                }
//            }
//        }
//    }
    
    static func loadImage(_ imv: UIImageView, strURL: String, placeHolder: UIImage?) {
        
        let url = URL(string: strURL)
        imv.sd_setImage(with: url, placeholderImage: placeHolder) { image, error, cacheType, url in
            if let downLoadedImage = image {
                if cacheType == .none {
                    imv.alpha = 0
                    UIView.transition(with: imv, duration: 0.3, options: .transitionCrossDissolve, animations: {
                        imv.image = downLoadedImage
                        imv.alpha = 1
                    }, completion: nil)
                    
                }
            } else {
                imv.image = placeHolder
            }
        }
    }
}
