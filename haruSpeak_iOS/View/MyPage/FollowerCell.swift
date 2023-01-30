//
//  FollowerCell.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/30.
//

import UIKit
import Then
import SnapKit

final class FollowerCell: UICollectionViewCell {
//MARK: - Properties
    static let identifier = "FollowerCell"
    let profilePhoto = UIImageView().then{
        $0.image = UIImage(named: "mypage")?.withRenderingMode(.alwaysOriginal)
        $0.roundCorners(cornerRadius: 35, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let name = UILabel().then{
        $0.text = "나단"
    }
    
    
    
//MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupLayout()
        self.addTarget()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Selector
    

//MARK: - addSubView
    private func setupView(){
        
    }
//MARK: - layout
    private func setupLayout(){
        
    }
//MARK: - AddTarget
    private func addTarget(){
        
    }
}
