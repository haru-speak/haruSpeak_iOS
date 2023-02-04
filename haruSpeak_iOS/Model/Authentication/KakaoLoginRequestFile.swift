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
        let url =
        "https://kauth.kakao.com/oauth/authorize?client_id=9a859088c85984edc80c3356ed0a41f3&redirect_uri=https://api.haru-speak.site/login/kakao&response_type=code"


        //HTTP Method GET
        AF.request(url,
                   method: .post,
                   headers: nil)
        .responseDecodable(of: KakaoLoginResponseFile.self) {response in

            switch response.result{
            case .success(let response):
                print("DEBUG>> Kakao Response \\(response)")
                viewController.didSuccess(response)

            case .failure(let error):
                print("DEBUG>> Kakao Get Error : \\(error.localizedDescription)")
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
