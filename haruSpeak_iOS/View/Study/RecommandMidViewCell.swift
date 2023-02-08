//
//  RecommandMidViewCell.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/08.
//

import Foundation
import UIKit
import Then
import SnapKit


final class RecommandMidViewCell: UICollectionViewCell {
    //MARK: - Properties
    static let identifier = "RecommandMidViewCell"
    
    let profileImg = UIImageView().then{
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.image = UIImage(named: "profileTest")?.withRenderingMode(.alwaysOriginal)
    }
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
        $0.text = "1"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
        $0.textColor = .lightGray
    }
    let studyName = UILabel().then{
        $0.text = "오픽 AL 목표로 달려봅시다!!!"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size:16)
    }
    let studyDetail = UILabel().then{
        $0.text = "겨울방학 2달동안 오픽 끝내실분 같이 공부해요~\n주 1회 대면 병행. 장소는 홍대 or 사당. 주제 정해서 주 3회 ..."
        $0.numberOfLines = 2
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
    }
    let likeImg = UIImageView().then{
        $0.image = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
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
        if likeImg.image == UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal){
            likeImg.image = UIImage(named: "heart.fill")?.withRenderingMode(.alwaysOriginal)
        }
        else{
            likeImg.image = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    //MARK: - addSubView
    private func setupView(){
        self.addSubview(self.recruitTagView)
        self.recruitTagView.addSubview(self.recruitTagText)
        self.addSubview(self.newTagView)
        self.newTagView.addSubview(self.newTagText)
        self.addSubview(self.existingTagView)
        self.existingTagView.addSubview(self.existingTagText)
        self.addSubview(self.memTagView)
        self.memTagView.addSubview(self.memTagImg)
        self.memTagView.addSubview(self.memTagLabel)
        self.addSubview(self.studyName)
        self.addSubview(self.studyDetail)
        self.addSubview(self.likeImg)
    }
    
    //MARK: - layout
    private func setupLayout(){
        self.profileImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(70)
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
        self.newTagView.snp.makeConstraints{
            $0.top.equalTo(self.studyDetail.snp.bottom).offset(10)
            $0.leading.equalTo(self.memTagView.snp.trailing).offset(6)
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
        self.memTagView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalTo(self.profileImg.snp.trailing).offset(16)
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
        self.likeImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10.75)
            $0.trailing.equalToSuperview().offset(-25.62)
            $0.width.height.equalTo(25)
        }
        self.studyName.snp.makeConstraints{
            $0.top.equalToSuperview().offset(7)
            $0.leading.equalTo(self.profileImg.snp.trailing).offset(16)
        }
        self.studyDetail.snp.makeConstraints{
            $0.top.equalTo(self.studyName.snp.bottom).offset(10)
            $0.leading.equalTo(self.profileImg.snp.trailing).offset(16)
        }
        
    }
    
    //MARK: - AddTarget
    private func addTarget(){
        let likeBtn = UITapGestureRecognizer(target: self, action: #selector(likeClicked))
        likeImg.isUserInteractionEnabled = true
        likeImg.addGestureRecognizer(likeBtn)
    }
}
