//
//  PointViewCell.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/02/03.
//

import UIKit
import Then
import SnapKit

final class PointViewCell: UICollectionViewCell {
//MARK: - Properties
    static let identifier = "PointViewCell"
    
    
    let mainLabel = UILabel().then{
        $0.text = "이번주에 지급받을 \nLearner 포인트"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    let pointLabel = UILabel().then{
        $0.text = "1080P"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 24)
        $0.textColor = .black
    }
    let detailImageArrow = UIImageView().then{
        $0.image = UIImage(named: "moreprofile")?.withRenderingMode(.alwaysOriginal)
    }
    let rightSideColor = UIView().then{
        $0.backgroundColor = .englishTag
    }
    let page1Dot = UIView().then{
        $0.backgroundColor = .englishTag
        $0.roundCorners(cornerRadius: 3, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let page2Dot = UIView().then{
        $0.backgroundColor = .englishTag
        $0.alpha = 0.5
        $0.roundCorners(cornerRadius: 3, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
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
        self.addSubview(self.mainLabel)
        self.addSubview(self.pointLabel)
        self.addSubview(self.detailImageArrow)
        self.addSubview(self.rightSideColor)
        self.addSubview(self.page1Dot)
        self.addSubview(self.page2Dot)
        
    }
//MARK: - layout
    private func setupLayout(){
        self.mainLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(14)
        }
        self.pointLabel.snp.makeConstraints{
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(14)
        }
        self.detailImageArrow.snp.makeConstraints{
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(27)
            $0.leading.equalTo(self.pointLabel.snp.trailing).offset(8)
        }
        self.rightSideColor.snp.makeConstraints{
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalTo(12)
        }
        self.page1Dot.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-8)
            $0.centerX.equalToSuperview().offset(-8)
            $0.height.width.equalTo(6)
        }
        self.page2Dot.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-8)
            $0.centerX.equalToSuperview().offset(8)
            $0.height.width.equalTo(6)
        }

    }
//MARK: - AddTarget
    private func addTarget(){
        
    }
}

