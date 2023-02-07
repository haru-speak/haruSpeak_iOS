// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let kakaoLoginData = try? JSONDecoder().decode(KakaoLoginData.self, from: jsonData)

import Foundation

// MARK: - KakaoLoginData
struct KakaoLoginResponseFile : Codable{
    let code: String?
    let data: DataClass?
    let message: String?
}

// MARK: - DataClass
struct DataClass : Codable{
    let accessToken: String?
    let email: String?
    let memberId: Int?
    let newbie: Bool?
    let nickname: String?
    let profileImage: String?
    let refreshToken: String?
}
