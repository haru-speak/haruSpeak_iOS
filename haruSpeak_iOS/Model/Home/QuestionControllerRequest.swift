//
//  QuestionControllerRequest.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/02/06.
//

import Foundation
import Alamofire
import UIKit

class QuestionControllerRequest{
    func getRequestData(_ viewController: HomeViewController){
        var haruSpeakAccessToken = UserDefaults.standard.string(forKey: "haruSpeakAccessToken")
        let url =
        "https://api.haru-speak.site:443/question"

//        let params = [
//            "accessToken": "\(haruSpeakAccessToken!)"
//        ]
        
        let headers: HTTPHeaders = [.authorization(bearerToken: haruSpeakAccessToken!)]
        //HTTP Method GET
        AF.request(url,
                   method: .get,
//                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .responseDecodable(of: QuestionControllerResponse.self) {response in

            switch response.result{
            case .success(let response):
                print("DEBUG>> QuestionController Response \(response)")
                viewController.getTodaySentence(response)

            case .failure(let error):
                print("DEBUG>> QuestionController Get Error : \(error.localizedDescription)")
                print(error.localizedDescription)
            }
        }
    }
}

