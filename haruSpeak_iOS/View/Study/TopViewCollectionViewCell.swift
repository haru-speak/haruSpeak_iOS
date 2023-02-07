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
        $0.text = "데이님이 ~12월 10일 과제를 제출했어요"
        
        //줄 간격
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    
    let profileImgView = UIView().then{
        $0.backgroundColor = .white.withAlphaComponent(0.4)
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let memImg1 = UIImageView().then{
        $0.image = UIImage(named: "profileTest")?.withRenderingMode(.alwaysOriginal)
    }
    let memImg2 = UIImageView().then{
        $0.image = UIImage(named: "profileTest")?.withRenderingMode(.alwaysOriginal)
    }
    let memImg3 = UIImageView().then{
        $0.image = UIImage(named: "profileTest")?.withRenderingMode(.alwaysOriginal)
    }
    let memImg4 = UIImageView().then{
        $0.image = UIImage(named: "profileTest")?.withRenderingMode(.alwaysOriginal)
    }
    let memImg5 = UIImageView().then{
        $0.image = UIImage(named: "profileTest")?.withRenderingMode(.alwaysOriginal)
    }
    let moreTxt = UILabel().then{
        $0.text = "+2"
        $0.textColor = .white
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 18)
    }
    
    let entranceBtn = UIButton(type: .system).then{
            $0.setTitle("스터디룸 입장", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
            $0.roundCorners(cornerRadius: 13, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
            $0.backgroundColor = .mainColor
        }
    let line = UIView().then{
        $0.backgroundColor = .systemGray6
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
        backView.addSubview(self.entranceBtn)
        backView.addSubview(self.profileImgView)
        profileImgView.addSubview(self.memImg1)
        profileImgView.addSubview(self.memImg2)
        profileImgView.addSubview(self.memImg3)
        profileImgView.addSubview(self.memImg4)
        profileImgView.addSubview(self.memImg5)
        profileImgView.addSubview(self.moreTxt)
        backView.addSubview(self.line)
    }
    
    //MARK: - layout
    private func setupLayout(){
        self.backView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.photo.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(self.backView)
            $0.height.equalTo(103)
        }
        self.mainlabel.snp.makeConstraints{
            $0.top.equalTo(self.photo.snp.bottom).offset(15)
            $0.leading.equalTo(self.backView.snp.leading).offset(18)
            $0.trailing.equalTo(self.backView.snp.trailing).offset(-18)
        }
        self.sublabel.snp.makeConstraints{
            $0.top.equalTo(self.mainlabel.snp.bottom).offset(14)
            $0.leading.equalTo(self.backView.snp.leading).offset(18)
            $0.trailing.equalTo(self.backView.snp.trailing).offset(0)
        }
        self.line.snp.makeConstraints{
            $0.top.equalTo(self.sublabel.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.backView.snp.leading).offset(18)
            $0.trailing.equalTo(self.backView.snp.trailing).offset(-18)
            $0.height.equalTo(1)
        }
        self.entranceBtn.snp.makeConstraints{
            $0.top.equalTo(self.line.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(122)
            $0.height.equalTo(30)
        }
        self.profileImgView.snp.makeConstraints{
            $0.top.leading.equalToSuperview().offset(7)
            $0.width.equalTo(184)
            $0.height.equalTo(39)
        }
        self.memImg1.snp.makeConstraints{
            $0.top.equalToSuperview().offset(3)
            $0.leading.equalToSuperview().offset(3)
            $0.width.equalTo(33)
            $0.height.equalTo(33)
        }
        self.memImg2.snp.makeConstraints{
            $0.top.equalToSuperview().offset(3)
            $0.leading.equalTo(self.memImg1.snp.trailing).offset(-7)
            $0.width.equalTo(33)
            $0.height.equalTo(33)
        }
        self.memImg3.snp.makeConstraints{
            $0.top.equalToSuperview().offset(3)
            $0.leading.equalTo(self.memImg2.snp.trailing).offset(-7)
            $0.width.equalTo(33)
            $0.height.equalTo(33)
        }
        self.memImg4.snp.makeConstraints{
            $0.top.equalToSuperview().offset(3)
            $0.leading.equalTo(self.memImg3.snp.trailing).offset(-7)
            $0.width.equalTo(33)
            $0.height.equalTo(33)
        }
        self.memImg5.snp.makeConstraints{
            $0.top.equalToSuperview().offset(3)
            $0.leading.equalTo(self.memImg4.snp.trailing).offset(-7)
            $0.width.equalTo(33)
            $0.height.equalTo(33)
        }
        self.moreTxt.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-13)
        }
    }
        
        
    
    
    
    //MARK: - AddTarget
    private func addTarget(){
        
    }
}
