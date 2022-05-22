//
//  Constant.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 22/05/2022.
//


import Foundation
import UIKit

struct Constants {
    
    static let locale = Locale(identifier: "vi_VN")
    
    static let vietnamesePhonePrefix = "+84"
    static let pickDateFormat = "dd/MM/YYYY"
    static let hotline = "1900 636 893"
    
    struct Color {
        static let overlayBackgroundColor = UIColor(hexString: "#18191F").withAlphaComponent(0.7)
        
        static let greenBlue = UIColor(hexString: "#2C8667")
        static let semanticGreen = UIColor(hexString: "#0CE07A")
        static let borderGray = UIColor(hexString: "#EEEFF4")
        
        static let gray1 = UIColor(hexString: "#18191F")
        static let gray2 = UIColor(hexString: "#474A57")
        static let gray3 = UIColor(hexString: "#969BAB")
        static let gray4 = UIColor(hexString: "#D9DBE1")
        static let gray6 = UIColor(hexString: "#F4F5F7")
        static let neutral05 = UIColor(hexString: "#E5E5E5")
        
        static let startGradientServiceDetails = UIColor(hexString: "#3DBA8F")
        static let endGradientServiceDetails = UIColor(hexString: "#219970")
        
        static let startGradientSignUp = UIColor(hexString: "#A6F1F7")
        static let endGradientSignUp = UIColor(hexString: "#F3F5FB").withAlphaComponent(0)
    }
    
    struct Font {
        static let regular = "NunitoSans-Regular"
        static let light = "NunitoSans-Light"
        static let semiBold = "NunitoSans-SemiBold"
        static let bold = "NunitoSans-Bold"
    }
    
    struct Icon {
        static let passportPlacehold = UIImage(named: "icon-passport-placehold")
        static let radioChecked = UIImage(named: "icon-radio-checkbox-checked")
        static let radioUnchecked = UIImage(named: "icon-radio-checkbox-unchecked")
        static let addImage = UIImage(named: "icon-add-image")
        
        static let avatarPlacehold = UIImage(named: "icon-avatar-placeholder")
        static let doctorAvatarPlacehold = UIImage(named: "icon-doctor-avatar-placeholder")
        //static let imagePlacehold = UIImage.imageWithColor(color: .lightGray)
        
        static let rateStar = UIImage(named: "icon-star-24")
        static let rateStar12 = UIImage(named: "icon-star")
        static let rateStarEmpty = UIImage(named: "icon-star-empty-24")
        
        static let homeTabBarIcon = UIImage(named: "icon-tab-home")
        static let homeTabBarIconSeleted = UIImage(named: "icon-tab-home-selected")
        
        static let appoinmentTabBarIcon = UIImage(named: "icon-tab-calendar")
        static let appoinmentTabBarIconSelected = UIImage(named: "icon-tab-calendar-selected")
        
        static let notificationTabBarIcon = UIImage(named: "icon-tab-notification")
        static let notificationTabBarIconSeleted = UIImage(named: "icon-tab-notification-selected")
        
        static let profileTabBarIcon = UIImage(named: "icon-tab-profile")
        static let profileTabBarIconSelected = UIImage(named: "icon-tab-profile-selected")
        
        static let tbvNotificationPlaceHolder = UIImage(named: "icon-notification-placeholder")
        
        static let workingInfo = UIImage(named: "icon-working-info-20")
        static let dependantPerson = UIImage(named: "icon-add-user-24")
        
        static let toastSuccess = UIImage(named: "icon-toast-success")
        static let toastError = UIImage(named: "icon-toast-error")
        static let toastWarning = UIImage(named: "icon-toast-warning")
        static let toastNormal = UIImage(named: "icon-toast-normal")
        
        static let bookmark15 = UIImage(named: "icon-bookmark-15")
        static let bookmarkSelected15 = UIImage(named: "icon-bookmark-selected-15")
        
        static let bookmark21 = UIImage(named: "icon-bookmark-21")
        static let bookmarkSelected21 = UIImage(named: "icon-bookmark-selected-21")
        
        static let iconRatedUserAvatarPlaceholder = UIImage(named: "icon-rated-user-avatar-placeholder")
    }
    
    

    struct AllPromotionVC{
        static let newsCellHeight: CGFloat = 103
    }

    struct AllNewsVC {
        static let newsCellHeight: CGFloat = 103
    }

    struct AllDoctorVC {
        static let doctorCellHeight: CGFloat = 125
    }
    
    struct HomeVC {
        static let tableNewsCellHeight: CGFloat = 320
        static let tableSuggestionCellHeight: CGFloat = 290
        
        static let newsCellWidth: CGFloat = 274
        static let suggestDoctorCellWidth: CGFloat = 137
        static let bottomPadding: CGFloat = 28
    }
}

//MARK: Logger
extension Constants {
    struct Logger {
        
        enum LogType {
            case localLogic
            
            var isEnable: Bool {
                switch self {
                
                case .localLogic:
                    return true
                }
            }
            
            var prefix: String {
                switch self {
                
                case .localLogic:
                    return "BSGN Local Logic"
                }
            }
        }
        
        static var enableAll = true
        
        
        static func printLog(_ message: String, type: LogType) {
            if Constants.Logger.enableAll == true {
                print(type.prefix + message)
                return
            }
            
            if type.isEnable == true {
                print(type.prefix + message)
            }
            
        }
    }
}
