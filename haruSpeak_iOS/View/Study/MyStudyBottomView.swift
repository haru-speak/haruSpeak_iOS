//
//  MyStudyBottomView.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/15.
//

import UIKit
import Then
import SnapKit

final class MyStudyBottomView: UIView{
    //MARK: - Properties
    let titleLabel = UILabel().then{
        $0.text = "승연님, 해야할 과제가 있어요!"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 20)
        $0.numberOfLines = 2
    }
    
    
    var assignmentView1 = AssignmentView().then{
        $0.dateLabel.text = "~12.27일"

    }
    var assignmentView2 = AssignmentView().then{
        $0.dateLabel.text = "~12.29일"
        $0.assignmentColorView.backgroundColor = .red
        $0.assignmentDateView.layer.borderColor = UIColor.red.cgColor
    }
    var assignmentView3 = AssignmentView().then{
        $0.dateLabel.text = "~12.31일"
        $0.assignmentColorView.backgroundColor = .green
        $0.assignmentDateView.layer.borderColor = UIColor.green.cgColor
    }
    
    let assignmentMoreButtonLabel = UILabel().then{
        $0.text = "과제 더보기"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.numberOfLines = 1
        $0.textAlignment = .center
        
        $0.backgroundColor = .clear
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.3
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 1)
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 1.0
    }
    
    let thisWeekObjectiveLabel = UILabel().then{
        $0.text = "승연님의 이번주 목표 달성량"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 20)
    }
    let thisWeekObjectiveView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let thisWeekResultLabel = UILabel().then{
        $0.text = "참여 중인 스터디의 모든 과제를 완료했습니다!"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 13)
    }
    let monLabel = UILabel().then{
        $0.text = "월"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 11)
        $0.textColor = .lightGray
    }
    let tueLabel = UILabel().then{
        $0.text = "화"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 11)
        $0.textColor = .lightGray
    }
    let wedLabel = UILabel().then{
        $0.text = "수"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 11)
        $0.textColor = .lightGray
    }
    let thurLabel = UILabel().then{
        $0.text = "목"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 11)
        $0.textColor = .lightGray
    }
    let friLabel = UILabel().then{
        $0.text = "금"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 11)
        $0.textColor = .lightGray
    }
    let satLabel = UILabel().then{
        $0.text = "토"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 11)
        $0.textColor = .lightGray
    }
    let sunLabel = UILabel().then{
        $0.text = "일"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 11)
        $0.textColor = .lightGray
    }
    let monGraph = UIView().then{
        $0.backgroundColor = .mainColor
        $0.roundCorners(cornerRadius: 3, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let tueGraph = UIView().then{
        $0.backgroundColor = .mainColor
        $0.roundCorners(cornerRadius: 3, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let wedGraph = UIView().then{
        $0.backgroundColor = .mainColor
        $0.roundCorners(cornerRadius: 3, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let thurGraph = UIView().then{
        $0.backgroundColor = .mainColor
        $0.roundCorners(cornerRadius: 3, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let friGraph = UIView().then{
        $0.backgroundColor = .mainColor
        $0.roundCorners(cornerRadius: 3, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let satGraph = UIView().then{
        $0.backgroundColor = .mainColor
        $0.roundCorners(cornerRadius: 3, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let sunGraph = UIView().then{
        $0.backgroundColor = .mainColor
        $0.roundCorners(cornerRadius: 3, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.layout()
        self.addTarget()
        
        
        let attributedStr = NSMutableAttributedString(string: titleLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.mainColor, range: (titleLabel.text! as NSString).range(of: "해야할 과제가"))
        titleLabel.attributedText = attributedStr
        
        let attributedStr1 = NSMutableAttributedString(string: thisWeekObjectiveLabel.text!)
        attributedStr1.addAttribute(.foregroundColor, value: UIColor.mainColor, range: (thisWeekObjectiveLabel.text! as NSString).range(of: "이번주 목표 달성량"))
        thisWeekObjectiveLabel.attributedText = attributedStr1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 
    
    
    //MARK: - Selector
    
    
    //MARK: - addSubView
    private func addSubView() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.assignmentView1)
        self.addSubview(self.assignmentView2)
        self.addSubview(self.assignmentView3)
        self.addSubview(self.assignmentMoreButtonLabel)
        self.addSubview(self.thisWeekObjectiveLabel)
        self.addSubview(self.thisWeekObjectiveView)
        self.addSubview(self.thisWeekResultLabel)
        self.thisWeekObjectiveView.addSubview(self.monLabel)
        self.thisWeekObjectiveView.addSubview(self.tueLabel)
        self.thisWeekObjectiveView.addSubview(self.wedLabel)
        self.thisWeekObjectiveView.addSubview(self.thurLabel)
        self.thisWeekObjectiveView.addSubview(self.friLabel)
        self.thisWeekObjectiveView.addSubview(self.satLabel)
        self.thisWeekObjectiveView.addSubview(self.sunLabel)
        self.thisWeekObjectiveView.addSubview(self.monGraph)
        self.thisWeekObjectiveView.addSubview(self.tueGraph)
        self.thisWeekObjectiveView.addSubview(self.wedGraph)
        self.thisWeekObjectiveView.addSubview(self.thurGraph)
        self.thisWeekObjectiveView.addSubview(self.friGraph)
        self.thisWeekObjectiveView.addSubview(self.satGraph)
        self.thisWeekObjectiveView.addSubview(self.sunGraph)
    }
    
    //MARK: - Layout
    private func layout() {
        self.titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalToSuperview().offset(30)
        }
        self.assignmentView1.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(21)
            $0.leading.equalToSuperview().offset(60)
            $0.trailing.equalToSuperview().offset(-30)
        }
        self.assignmentView2.snp.makeConstraints{
            $0.top.equalTo(self.assignmentView1.snp.bottom).offset(21)
            $0.leading.equalToSuperview().offset(60)
            $0.trailing.equalToSuperview().offset(-30)
        }
        self.assignmentView3.snp.makeConstraints{
            $0.top.equalTo(self.assignmentView2.snp.bottom).offset(21)
            $0.leading.equalToSuperview().offset(60)
            $0.trailing.equalToSuperview().offset(-30)
        }
        self.assignmentMoreButtonLabel.snp.makeConstraints{
            $0.top.equalTo(self.assignmentView3.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(109)
            $0.size.height.equalTo(42)
        }
        self.thisWeekObjectiveLabel.snp.makeConstraints{
            $0.top.equalTo(self.assignmentMoreButtonLabel.snp.bottom).offset(46)
            $0.leading.equalToSuperview().offset(34)
        }
        self.thisWeekObjectiveView.snp.makeConstraints{
            $0.top.equalTo(self.thisWeekObjectiveLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.size.height.equalTo(209)
        }
        self.thisWeekResultLabel.snp.makeConstraints{
            $0.top.equalTo(self.thisWeekObjectiveView.snp.top).offset(8)
            $0.leading.equalTo(self.thisWeekObjectiveView.snp.leading).offset(17)
        }
//        let heightfactor: CGFloat = 2 / 6
        
        self.monLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(33)
            $0.bottom.equalToSuperview().offset(-16)
        }
        self.tueLabel.snp.makeConstraints{
            $0.leading.equalTo(self.monLabel.snp.trailing).offset(32)
            $0.bottom.equalToSuperview().offset(-16)
        }
        self.wedLabel.snp.makeConstraints{
            $0.leading.equalTo(self.tueLabel.snp.trailing).offset(32)
            $0.bottom.equalToSuperview().offset(-16)
        }
        self.thurLabel.snp.makeConstraints{
            $0.leading.equalTo(self.wedLabel.snp.trailing).offset(32)
            $0.bottom.equalToSuperview().offset(-16)
        }
        self.friLabel.snp.makeConstraints{
            $0.leading.equalTo(self.thurLabel.snp.trailing).offset(32)
            $0.bottom.equalToSuperview().offset(-16)
        }
        self.satLabel.snp.makeConstraints{
            $0.leading.equalTo(self.friLabel.snp.trailing).offset(32)
            $0.bottom.equalToSuperview().offset(-16)
        }
        self.sunLabel.snp.makeConstraints{
            $0.leading.equalTo(self.satLabel.snp.trailing).offset(32)
            $0.bottom.equalToSuperview().offset(-16)
        }
        self.monGraph.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(35)
            $0.bottom.equalToSuperview().offset(-39)
            $0.width.equalTo(6)
            $0.height.equalTo(32)

        }
        self.tueGraph.snp.makeConstraints{
            $0.leading.equalTo(self.monLabel.snp.trailing).offset(33)
            $0.bottom.equalToSuperview().offset(-39)
            $0.width.equalTo(6)
            $0.height.equalTo(113)
        }
        self.wedGraph.snp.makeConstraints{
            $0.leading.equalTo(self.tueLabel.snp.trailing).offset(33)
            $0.bottom.equalToSuperview().offset(-39)
            $0.width.equalTo(6)
            $0.height.equalTo(32)
        }
        self.thurGraph.snp.makeConstraints{
            $0.leading.equalTo(self.wedLabel.snp.trailing).offset(33)
            $0.bottom.equalToSuperview().offset(-39)
            $0.width.equalTo(6)
            $0.height.equalTo(74)
        }
        self.friGraph.snp.makeConstraints{
            $0.leading.equalTo(self.thurLabel.snp.trailing).offset(33)
            $0.bottom.equalToSuperview().offset(-39)
            $0.width.equalTo(6)
            $0.height.equalTo(113)
        }
        self.satGraph.snp.makeConstraints{
            $0.leading.equalTo(self.friLabel.snp.trailing).offset(33)
            $0.bottom.equalToSuperview().offset(-39)
            $0.width.equalTo(6)
            $0.height.equalTo(113)
        }
        self.sunGraph.snp.makeConstraints{
            $0.leading.equalTo(self.satLabel.snp.trailing).offset(33)
            $0.bottom.equalToSuperview().offset(-39)
            $0.width.equalTo(6)
            $0.height.equalTo(113)
        }
        
    }
    
    
    //MARK: - AddTarget
    private func addTarget() {
        
    }
    
}
