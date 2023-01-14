//
//  TopViewCollectionView.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/14.
//

import Foundation
import UIKit
import Then
import SnapKit

final class TopViewCollectionViewCell: UICollectionViewCell{
    static let identifier = "TopViewCollectionViewCell"
    
    let backView = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        
        $0.layer.borderWidth = 0.3
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 1)
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 1.0
    }
    let photo = UIImageView().then{
        $0.image = UIImage(named: "studytestimg")?.withRenderingMode(.alwaysOriginal)
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let mainlabel = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.text = "오픽 AL 목표로 달려봅시다!!!"
        $0.numberOfLines = 1
    }
    let sublabel = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.text = "겨울방학 2달동안 오픽 끝내실분 같이 공부해요~ \n주 1회 대면 병행. 장소는 홍대 or 사당. 주제 정해서..."
        $0.numberOfLines = 2
        
        //줄 간격
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
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
        self.addSubview(self.backView)
        backView.addSubview(self.photo)
        backView.addSubview(self.mainlabel)
        backView.addSubview(self.sublabel)
    }
    
    //MARK: - layout
    private func setupLayout(){
        self.backView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.photo.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(self.backView)
            $0.height.equalTo(self.backView).dividedBy(1.7)
        }
        self.mainlabel.snp.makeConstraints{
            $0.top.equalTo(self.photo.snp.bottom).offset(10)
            $0.leading.equalTo(self.backView.snp.leading).offset(18)
            $0.trailing.equalTo(self.backView.snp.trailing).offset(-18)
        }
        self.sublabel.snp.makeConstraints{
            $0.top.equalTo(self.mainlabel.snp.bottom).offset(5)
            $0.leading.equalTo(self.backView.snp.leading).offset(18)
            $0.trailing.equalTo(self.backView.snp.trailing).offset(0)
        }
    }
    
    
    
    //MARK: - AddTarget
    private func addTarget(){
        
    }
}
