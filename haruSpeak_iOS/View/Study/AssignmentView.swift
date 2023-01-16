//
//  AssignmentView.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/15.
//

import Foundation
import SnapKit
import UIKit

class AssignmentView : UIView{
    //MARK: - Properties
    var assignmentView = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        
        $0.layer.borderWidth = 0.3
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 1)
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 1.0
        
    }
    var assignmentDateView = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.layer.borderColor = UIColor.blue.cgColor
        $0.layer.borderWidth = 0.5
    }
    var dateLabel = UILabel().then{
        $0.text = "~12.27일"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 13)
        $0.numberOfLines = 1
    }
    var assignmentColorView = UIView().then{
        $0.backgroundColor = .blue
        $0.roundCorners(cornerRadius: 11, maskedCorners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner])
    }
    var assignmentTitle = UILabel().then{
        $0.text = "“repetition” 적용해서 답변 말하기"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.numberOfLines = 1
    }
    var assignmentSubTitle = UILabel().then{
        $0.text = "< 오픽 AL 목표로 달려봅시다!!! >"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 11)
        $0.textColor = .gray
        $0.numberOfLines = 1
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.layout()
        self.addTarget()
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView() {
        self.addSubview(self.assignmentView)
        assignmentView.addSubview(self.assignmentDateView)
        assignmentDateView.addSubview(self.dateLabel)
        assignmentView.addSubview(self.assignmentColorView)
        assignmentView.addSubview(self.assignmentTitle)
        assignmentView.addSubview(self.assignmentSubTitle)
    }
    
    //MARK: - Layout
    private func layout() {
        self.assignmentView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.size.height.equalTo(63)
        }
        self.assignmentDateView.snp.makeConstraints{
            $0.leading.equalTo(self.assignmentView.snp.leading).offset(-36)
            $0.trailing.equalTo(self.assignmentView.snp.leading).offset(37)
            $0.centerY.equalToSuperview()
            $0.size.width.equalTo(73)
            $0.size.height.equalTo(28)
        }
        self.dateLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        self.assignmentColorView.snp.makeConstraints{
            $0.top.bottom.trailing.equalToSuperview()
            $0.size.width.equalTo(14)
        }
        self.assignmentTitle.snp.makeConstraints{
            $0.leading.equalTo(self.assignmentDateView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(13)
        }
        self.assignmentSubTitle.snp.makeConstraints{
            $0.leading.equalTo(self.assignmentDateView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
            $0.top.equalTo(self.assignmentTitle.snp.bottom).offset(5)
        }
        
        
    }
    
    
    //MARK: - AddTarget
    private func addTarget() {
        
    }
}
