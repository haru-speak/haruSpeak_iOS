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
    }
    let pointLabel = UILabel().then{
        $0.text = "1080P"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let detailImageArrow = UIImageView().then{
        $0.image = UIImage(named: "moreprofile")?.withRenderingMode(.alwaysOriginal)
    }
    let rightSideColor = UIView().then{
        $0.backgroundColor = .koreanTag
    }
    let pageController = UIPageControl().then{
        $0.numberOfPages = 2
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
        self.addSubview(self.pageController)
        
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
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(12)
        }
        self.rightSideColor.snp.makeConstraints{
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalTo(12)
        }
        self.pageController.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-8)
            $0.centerX.equalToSuperview()
        }

    }
//MARK: - AddTarget
    private func addTarget(){
        
    }
}

