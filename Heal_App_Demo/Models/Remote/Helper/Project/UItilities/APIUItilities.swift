//
//  APIUltilities.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 26/05/2022.
//


import Foundation
import Alamofire

protocol JsonInitObject: NSObject {
    init(json: [String: Any])
}

class APIUtilities{
    static let domain = "https://gist.githubusercontent.com"
    static let responseDataKey = "data"
    static let responseCodeKey = "code"
    static let responseMessageKey = "messge"
    static func requestHomeFeed(completionHandler: ((HomeModel?,APIError?)->Void)?) {
        let tailStrURL = "/hdhuy179/f967ffb777610529b678f0d5c823352a/raw"
        jsonResponseObject(tailStrURL: tailStrURL, method: .get, headers: [:], completionHandler: completionHandler)
    }
    static func requestPromotionFeed(completionHandler: ((PromotionModel?,APIError?)->Void)?) {
        let tailStrURL = "/hdhuy179/ef03ed850ad56f0136fe3c5916b3280b/raw/Training_Intern_BasicApp_Promotion"
        jsonResponseObject(tailStrURL: tailStrURL, method: .get, headers: [:], completionHandler: completionHandler)
    }
    static func requestNewsFeed(completionHandler: ((NewsModel?,APIError?)->Void)?) {
        let tailStrURL = "/hdhuy179/84d1dfe96f2c0ab1ddea701df352a7a6/raw"
        jsonResponseObject(tailStrURL: tailStrURL, method: .get, headers: [:], completionHandler: completionHandler)
    }
    static func requestDoctorFeed(completionHandler: ((DoctorModel?,APIError?)->Void)?) {
        let tailStrURL = "/hdhuy179/9ac0a89969b46fb67bc7d1a8b94d180e/raw"
        jsonResponseObject(tailStrURL: tailStrURL, method: .get, headers: [:], completionHandler: completionHandler)
    }
    static func requestUserInfor(completionHandler: ((UserModel?,APIError?)->Void)?) {
        let tailStrURL = "/hdhuy179/7883b8f11ea4b25cf6d3822c67049606/raw/Training_Intern_BasicApp_UserInfo"
        jsonResponseObject(tailStrURL: tailStrURL, method: .get, headers: [:], completionHandler: completionHandler)
    }
    static func requestLocationInfor(completionHandler: ((LocationModel?,APIError?)->Void)?) {
        let tailStrURL = "/hdhuy179/7883b8f11ea4b25cf6d3822c67049606/raw"
        jsonResponseObject(tailStrURL: tailStrURL, method: .get, headers: [:], completionHandler: completionHandler)
    }
    
    static private func jsonResponseObject<T: JsonInitObject>(tailStrURL: String, method :HTTPMethod, headers: HTTPHeaders, completionHandler:((T?,APIError?)->Void)?) {
        jsonResponse(tailStrURL: tailStrURL, isPublicAPI:false, method: method, headers: headers) { response,severCode,severMessage in
            
            switch response.result {
            case .success(let value):
                guard severCode == 200 else {
                    completionHandler?(nil, .severError(severCode, severMessage))
                    return
                }
                guard let responseDict = value as? [String: Any],
                      let dataDict = responseDict[responseDataKey] as? [String:Any] else {
                    completionHandler?(nil,.reposeFormatError)
                    return
                }
                let obj = T(json: dataDict)
                completionHandler?(obj,nil)
            case .failure(let error):
                completionHandler?(nil, .unowned(error))
            }
            
        }
        
    }
    static private func jsonResponse(tailStrURL: String,
                                     isPublicAPI: Bool,
                                     method: HTTPMethod,
                                     parameters: Parameters? = nil,
                                     encoding: ParameterEncoding = JSONEncoding.default,
                                     headers: HTTPHeaders = [:],
                                     completionHandler: ((AFDataResponse<Any>, Int?, String?) -> Void)?) {
        guard let url = URL (string: domain + tailStrURL) else { return }
        AF.request(url, method: method, parameters: parameters,encoding: encoding, headers: headers)
            .responseJSON { response in
                var severCode: Int? = nil
                var severMessage: String? = nil
                switch response.result {
                case .success(let value):
                    severCode = (value as? [String: Any])?[responseCodeKey] as? Int
                    severMessage = (value as? [String: Any])?[responseMessageKey] as? String
                case .failure(_):
                    break
                }
                completionHandler?(response,severCode,severMessage)
            }
        
    }
}
extension APIUtilities {
    enum APIError: Error {
        case reposeFormatError // lỗi định dạng
        case severError(Int?, String?)
        case unowned(Error)
    }
}
