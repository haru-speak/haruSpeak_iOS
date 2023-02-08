//
//  RecommandBottomViewCell.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/08.
//

import Foundation
import UIKit
import Then
import SnapKit

final class RecommandBottomViewCell: UICollectionViewCell{
    static let identifier = "RecommandBottomViewCell"
    
    let backView = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        
        $0.layer.borderWidth = 0.3
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 1, height: 1)
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 1.0
    }
    let photo = UIImageView().then{
        $0.image = UIImage(named: "studytestimg")?.withRenderingMode(.alwaysOriginal)
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let mainlabel = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.text = "오픽AL 같이 준비해요~!"
        $0.numberOfLines = 1
    }
    let sublabel = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 13)
        $0.text = "2주 동안 빡세게 하고 시험 같이\n칩시다."
        $0.numberOfLines = 2
        $0.textColor = .gray
        
        //줄 간격
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    
    let like = UIImageView().then{
        $0.image = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
    }
    let cellIndex = UILabel().then{
        $0.text = "1"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 29)
        $0.textColor = .black.withAlphaComponent(0.15)
    }
    
    //tags
    let recruitTagView = UIView().then{
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .systemGray6
    }
    let recruitTagText = UILabel().then{
           $0.text = "모집 중"
           $0.textColor = .red
           $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
       }
    
    let newTagView = UIView().then{
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .koreanTag
    }
    let newTagText = UILabel().then{
        $0.text = "New"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
    }
    let existingTagView = UIView().then{
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .mainColor
    }
    let existingTagText = UILabel().then{
        $0.text = "Since 2022.11.25"
        $0.textColor = .white
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
    }
    let memTagView = UIView().then{
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .systemGray6
    }
    let memTagImg = UIImageView().then{
        $0.image = UIImage(named: "human")?.withRenderingMode(.alwaysOriginal)
    }
    let memTagLabel = UILabel().then{
        $0.text = "4~7명"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
        $0.textColor = .lightGray
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
    @objc func likeClicked(){
        if like.image == UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal){
            like.image = UIImage(named: "heart.fill")?.withRenderingMode(.alwaysOriginal)
        }
        else{
            like.image = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    
    //MARK: - addSubView
    private func setupView(){
        self.addSubview(self.backView)
        self.backView.addSubview(self.photo)
        self.backView.addSubview(self.mainlabel)
        self.backView.addSubview(self.sublabel)
        self.backView.addSubview(self.like)
//        self.backView.addSubview(self.recruitTagView)
//        self.recruitTagView.addSubview(self.recruitTagText)
        self.backView.addSubview(self.newTagView)
        self.newTagView.addSubview(self.newTagText)
//        self.backView.addSubview(self.existingTagView)
//        self.existingTagView.addSubview(self.existingTagText)
        self.backView.addSubview(self.memTagView)
        self.memTagView.addSubview(self.memTagImg)
        self.memTagView.addSubview(self.memTagLabel)
    }
    
    //MARK: - layout
    private func setupLayout(){
        self.backView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.cellIndex.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.equalTo(-15)
        }
        self.photo.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(self.backView)
            $0.height.equalTo(96)
        }
        self.mainlabel.snp.makeConstraints{
            $0.top.equalTo(self.photo.snp.bottom).offset(15)
            $0.leading.equalTo(self.backView.snp.leading).offset(18)
            $0.trailing.equalTo(self.backView.snp.trailing).offset(-18)
        }
        self.sublabel.snp.makeConstraints{
            $0.top.equalTo(self.mainlabel.snp.bottom).offset(12)
            $0.leading.equalTo(self.backView.snp.leading).offset(18)
            $0.trailing.equalTo(self.backView.snp.trailing).offset(0)
        }
        self.like.snp.makeConstraints{
            $0.top.equalToSuperview().offset(13.75)
            $0.trailing.equalToSuperview().offset(-12.62)
            $0.width.equalTo(24.75)
            $0.height.equalTo(22.5)
        }
//        self.recruitTagView.snp.makeConstraints{
//            $0.top.equalToSuperview().offset(12)
//            $0.leading.equalToSuperview().offset(20)
//            $0.width.equalTo(58)
//            $0.height.equalTo(22)
//        }
//        self.recruitTagText.snp.makeConstraints{
//            $0.centerY.equalTo(self.recruitTagView)
//            $0.centerX.equalTo(self.recruitTagView)
//        }
        self.memTagView.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-8)
            $0.leading.equalToSuperview().offset(8)
            $0.width.equalTo(71)
            $0.height.equalTo(22)
        }
        self.memTagLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10)
        }
        self.memTagImg.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.width.height.equalTo(13)
        }
        self.newTagView.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-8)
            $0.leading.equalTo(self.memTagView.snp.trailing).offset(8)
            $0.width.equalTo(46)
            $0.height.equalTo(22)
        }
        self.newTagText.snp.makeConstraints{
            $0.centerY.equalTo(self.newTagView)
            $0.centerX.equalTo(self.newTagView)
        }
//        self.existingTagView.snp.makeConstraints{
//            $0.top.equalToSuperview().offset(12)
//            $0.leading.equalTo(self.recruitTagView.snp.trailing).offset(6)
//            $0.width.equalTo(50)
//            $0.height.equalTo(22)
//        }
//        self.existingTagText.snp.makeConstraints{
//            $0.centerY.equalTo(self.existingTagView)
//            $0.centerX.equalTo(self.existingTagView)
//        }
    }
        
    //MARK: - AddTarget
    private func addTarget(){
        let likeBtn = UITapGestureRecognizer(target: self, action: #selector(likeClicked))
        like.isUserInteractionEnabled = true
        like.addGestureRecognizer(likeBtn)
    }
}
