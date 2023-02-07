//
//  OnboardingCell.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/02/03.
//

import Foundation
import UIKit
import Then
import SnapKit

final class OnboardingCell: UICollectionViewCell {
    //MARK: - Properties
    static let identifier = "OnboardingCell"
    
    let mainImage = UIImageView().then{
        $0.image = UIImage(named: "onboarding1")?.withRenderingMode(.alwaysOriginal)
    }
    //MARK: - Init
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupView()
            self.setupLayout()
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    //MARK: - addSubView
        private func setupView(){
            self.addSubview(self.mainImage)
            
        }
    //MARK: - layout
        private func setupLayout(){
            self.mainImage.snp.makeConstraints{
                $0.top.bottom.trailing.leading.equalToSuperview()
            }
        }
}
