//
//  KakaoLoginRequestFile.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/02/04.
//

import Foundation
import Alamofire
import UIKit

class KakaoLoginRequestFile{
    func getRequestData(_ viewController: AuthenticationViewController){
        var KakaoAccessCode = UserDefaults.standard.string(forKey: "KakaoAccessCode")
        let url =
        "https://api.haru-speak.site:443/app/login/kakao"

        let params = [
            "accessToken": "\(KakaoAccessCode!)"
        ]

        //HTTP Method GET
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default)
        .responseDecodable(of: KakaoLoginResponseFile.self) {response in

            switch response.result{
            case .success(let response):
                print("DEBUG>> Kakao Response \(response)")
                viewController.didSuccess(response)

            case .failure(let error):
                print("DEBUG>> Kakao Get Error : \(error.localizedDescription)")
                print(error.localizedDescription)
            }
        }
    }
    
    func getRequestData(_ viewController: HomeViewController){
        var KakaoAccessCode = UserDefaults.standard.string(forKey: "KakaoAccessCode")
        let url =
        "https://api.haru-speak.site:443/app/login/kakao"

        let params = [
            "accessToken": "\(KakaoAccessCode!)"
        ]

        //HTTP Method GET
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default)
        .responseDecodable(of: KakaoLoginResponseFile.self) {response in

            switch response.result{
            case .success(let response):
                print("DEBUG>> Kakao Response \(response)")
                viewController.didSuccess(response)

            case .failure(let error):
                print("DEBUG>> Kakao Get Error : \(error.localizedDescription)")
                print(error.localizedDescription)
            }
        }
    }
    
    
}

public enum MyError: Error {
    case customError
}

extension MyError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .customError:
            return NSLocalizedString("A user-friendly description of the error.", comment: "My error")
        }
    }
}

let error: Error = MyError.customError
 // A user-friendly description of the error.
