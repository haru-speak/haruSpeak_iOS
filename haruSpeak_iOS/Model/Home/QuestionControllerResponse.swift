//
//  QuestionControllerDataResponse.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/02/06.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let questionControllerDataResponse = try? JSONDecoder().decode(QuestionControllerDataResponse.self, from: jsonData)

import Foundation

// MARK: - QuestionControllerDataResponse
struct QuestionControllerResponse : Codable{
    let code: String?
    let data: QuestionDataClass?
    let message: String?
}

// MARK: - DataClass
struct QuestionDataClass : Codable{
    let title: String?
    let voiceText: String?
    let voidRecord: String?
}
