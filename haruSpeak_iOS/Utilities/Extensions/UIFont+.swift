//
//  UIFont+.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/11.
//

import UIKit

extension UIFont {
    enum Family: String {
        case Bold, Regular, Thin
    }
    
    static func appleSDGothicNeo(size: CGFloat, family: Family = .Regular) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-\(family)", size: size) ?? UIFont()
    }
}
