//
//  AssignmentCell.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/05.
//

import Foundation
import UIKit
import Then
import SnapKit
//StudyRoom "과제가 있어요" 부분

final class AssignmentCell: UICollectionViewCell {
    //MARK: - Properties
    static let identifier = "AssignmentCell"
    let backView = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
//
//        $0.layer.borderWidth = 0.3
//        $0.layer.masksToBounds = false
//        $0.layer.shadowColor = UIColor.systemGray6.cgColor
//        $0.layer.shadowOffset = CGSize(width: 0, height: 1)
//        $0.layer.shadowOpacity = 0.3
//        $0.layer.shadowRadius = 1.0
    }
    
    let deadlineTagView = UIView().then{
        $0.roundCorners(cornerRadius: 12, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .koreanTag
    }
    let deadlineTagText = UILabel().then{
        $0.text = "~12월 10일"
        $0.textColor = .white
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
       }
    let question = UILabel().then{
        $0.text = "Explain the details about what you\nrecently did with your family."
        $0.numberOfLines = 4
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size:20)
    }
    let order = UILabel().then{
        $0.text = "오픽 질문입니다. 120초 동안 답변한거 올려주세요!"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
    }
    let announcementImg = UIImageView().then{
        $0.image = UIImage(named: "announcement")?.withRenderingMode(.alwaysOriginal)
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
        self.backView.addSubview(self.deadlineTagView)
        self.deadlineTagView.addSubview(self.deadlineTagText)
        self.backView.addSubview(self.question)
        self.backView.addSubview(self.order)
        self.backView.addSubview(self.announcementImg)
        self.backView.addSubview(self.line)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 1)
        self.clipsToBounds = false
    }
    
    //MARK: - layout
    private func setupLayout(){
        self.backView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.height.equalTo(239)
        }
        
        self.deadlineTagView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(84)
            $0.height.equalTo(23)
        }
        self.deadlineTagText.snp.makeConstraints{
            $0.centerY.equalTo(self.deadlineTagView)
            $0.centerX.equalTo(self.deadlineTagView)
        }
        self.question.snp.makeConstraints{
            $0.top.equalTo(self.deadlineTagView.snp.bottom).offset(11)
            $0.leading.equalToSuperview().offset(15.5)
        }
        self.announcementImg.snp.makeConstraints{
            $0.top.equalTo(self.question.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(14)
            $0.height.equalTo(14)
        }
        self.line.snp.makeConstraints{
            $0.top.equalTo(self.announcementImg.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(1)
        }
        self.order.snp.makeConstraints{
            $0.top.equalTo(self.line.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
    }
    
    //MARK: - AddTarget
    private func addTarget(){
    }
}
