//
//  UIColor+.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/11.
//

import UIKit

extension UIColor {
    class var mainColor: UIColor { return UIColor(named: "main") ?? UIColor() }
    class var KakaoColor: UIColor { return UIColor(named: "Kakao") ?? UIColor()}
    class var NaverColor: UIColor { return UIColor(named: "Naver") ?? UIColor()}
    class var englishTag: UIColor { return UIColor(named: "englishTag") ?? UIColor()}
    class var koreanTag: UIColor { return UIColor(named: "koreanTag") ?? UIColor()}
    class var objectiveTag: UIColor { return UIColor(named: "objectiveTag") ?? UIColor()}
}
