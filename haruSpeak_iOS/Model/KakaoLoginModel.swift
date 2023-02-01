//
//  KakaoLoginModel.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/01.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dataModel = try? JSONDecoder().decode(DataModel.self, from: jsonData)

import Foundation

// MARK: - DataModel
struct DataModel: Codable {
    let code: String
    let data: DataClass
    let message: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let accessToken, email: String
    let memberID: Int
    let newbie: Bool
    let nickname, profileImage, refreshToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken, email
        case memberID = "memberId"
        case newbie, nickname, profileImage, refreshToken
    }
}
