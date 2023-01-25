//
//  SecondViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/25.
//

import Foundation
import UIKit
import SnapKit
import Then

class SecondLearnerViewController: UIViewController{
    
//MARK: - Properties
    let backButton = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let progressBar = UIProgressView().then{
        $0.backgroundColor = .systemGray6
    }
    let titleLabel = UILabel().then{
        $0.text = "승연님의 영어 스피킹 레벨은 \n어디쯤이라고 생각하시나요?"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 24)
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    let levelLabel = UILabel().then{
        $0.text = "LV.2"
        $0.textColor = .mainColor
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
    }
    let descriptionLabel = UILabel().then{
        $0.text = "익숙한 소재에 대해 짧은 문장으로 \n답변할 수 있지만 막히는 부분이 많아요."
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    let levelMainView = UIView().then{
        $0.backgroundColor = .white
    }
    //Level Bar
    let levelbar1 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let levelbar2 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let levelbar3 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let levelbar4 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let levelbar5 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    //Level
    let levelLable1 = UILabel().then{
        $0.text = "LV.1"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let levelLable2 = UILabel().then{
        $0.text = "LV.2"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let levelLable3 = UILabel().then{
        $0.text = "LV.3"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let levelLable4 = UILabel().then{
        $0.text = "LV.4"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let levelLable5 = UILabel().then{
        $0.text = "LV.5"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let nextButton = UIButton().then{
        $0.setTitle("다음", for: .normal)
        $0.backgroundColor = .mainColor
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    
    
    
//MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        
        self.view.backgroundColor = .white
        
        let attributedStr = NSMutableAttributedString(string: titleLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.mainColor, range: (titleLabel.text! as NSString).range(of: "영어"))
        titleLabel.attributedText = attributedStr
    }
//MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.progressBar)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.levelLabel)
        self.view.addSubview(self.descriptionLabel)
        self.view.addSubview(self.levelMainView)
        self.levelMainView.addSubview(self.levelbar1)
        self.levelMainView.addSubview(self.levelbar2)
        self.levelMainView.addSubview(self.levelbar3)
        self.levelMainView.addSubview(self.levelbar4)
        self.levelMainView.addSubview(self.levelbar5)
        self.levelMainView.addSubview(self.levelLable1)
        self.levelMainView.addSubview(self.levelLable2)
        self.levelMainView.addSubview(self.levelLable3)
        self.levelMainView.addSubview(self.levelLable4)
        self.levelMainView.addSubview(self.levelLable5)
        self.view.addSubview(self.nextButton)
    }

//MARK: - Selector

    @objc func didClickLevel1(sender: UITapGestureRecognizer) {
        print("didClickLevel1")
    }
    
//MARK: - Layout
    func layout(){
        self.backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.leading.equalToSuperview().offset(16)
        }
        self.progressBar.snp.makeConstraints{
            $0.top.equalToSuperview().offset(69)
            $0.leading.equalTo(self.backButton.snp.trailing).offset(21)
            $0.trailing.equalToSuperview().offset(-65)
        }
        self.titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.progressBar.snp.bottom).offset(52)
        }
        self.levelLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(8)
        }
        self.descriptionLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.levelLabel.snp.bottom).offset(8)
        }
        self.levelMainView.snp.makeConstraints{
            $0.height.equalTo(353)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.descriptionLabel.snp.bottom).offset(45)
            $0.leading.equalToSuperview().offset(0)
        }
        let centerXFactor: CGFloat = 2 / 6
        self.levelLable1.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalTo(40)
            $0.centerX.equalTo(levelMainView).multipliedBy(1 * centerXFactor)
        }
        self.levelLable2.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalTo(40)
            $0.centerX.equalTo(levelMainView).multipliedBy(2 * centerXFactor)
        }
        self.levelLable3.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalTo(40)
            $0.centerX.equalTo(levelMainView).multipliedBy(3 * centerXFactor)
        }
        self.levelLable4.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalTo(40)
            $0.centerX.equalTo(levelMainView).multipliedBy(4 * centerXFactor)
        }
        self.levelLable5.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalTo(40)
            $0.centerX.equalTo(levelMainView).multipliedBy(5 * centerXFactor)
        }
        self.levelbar1.snp.makeConstraints{
            $0.top.equalToSuperview().offset(196)
            $0.bottom.equalTo(self.levelLable1.snp.top).offset(-19)
            $0.width.equalTo(30)
            $0.centerX.equalTo(levelMainView).multipliedBy(1 * centerXFactor)
        }
        self.levelbar2.snp.makeConstraints{
            $0.top.equalToSuperview().offset(159)
            $0.bottom.equalTo(self.levelLable2.snp.top).offset(-19)
            $0.width.equalTo(30)
            $0.centerX.equalTo(levelMainView).multipliedBy(2 * centerXFactor)
        }
        self.levelbar3.snp.makeConstraints{
            $0.top.equalToSuperview().offset(106)
            $0.bottom.equalTo(self.levelLable3.snp.top).offset(-19)
            $0.width.equalTo(30)
            $0.centerX.equalTo(levelMainView).multipliedBy(3 * centerXFactor)
        }
        self.levelbar4.snp.makeConstraints{
            $0.top.equalToSuperview().offset(62)
            $0.bottom.equalTo(self.levelLable4.snp.top).offset(-19)
            $0.width.equalTo(30)
            $0.centerX.equalTo(levelMainView).multipliedBy(4 * centerXFactor)
        }
        self.levelbar5.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.bottom.equalTo(self.levelLable5.snp.top).offset(-19)
            $0.width.equalTo(30)
            $0.centerX.equalTo(levelMainView).multipliedBy(5 * centerXFactor)
        }
        self.nextButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
            $0.top.equalTo(self.levelMainView.snp.bottom).offset(50)
            $0.height.equalTo(45)
        }
    }
    
//MARK: - Target
    func addTarget(){
        
    }
}
