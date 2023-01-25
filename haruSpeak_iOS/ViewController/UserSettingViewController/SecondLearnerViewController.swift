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
        $0.backgroundColor = . lightGray
    }
    let titleLabel = UILabel().then{
        $0.text = "승연님의 영어 스피킹 레벨은 어디쯤이라고 생각하시나요?"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 24)
    }
    let levelLabel = UILabel().then{
        $0.text = "LV.2"
        $0.textColor = .mainColor
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
    }
    let descriptionLabel = UILabel().then{
        $0.text = "익숙한 소재에 대해 짧은 문장으로 답변할 수 있지만 막히는 부분이 많아요."
        $0.textColor = .mainColor
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
    }
    //Level Bar
    let levelbar1 = UIView().then{
        $0.backgroundColor = .systemGray6
    }
    let levelbar2 = UIView().then{
        $0.backgroundColor = .systemGray6
    }
    let levelbar3 = UIView().then{
        $0.backgroundColor = .systemGray6
    }
    let levelbar4 = UIView().then{
        $0.backgroundColor = .systemGray6
    }
    let levelbar5 = UIView().then{
        $0.backgroundColor = .systemGray6
    }
    //Level
    let levelLable1 = UILabel().then{
        $0.text = "LV.1"
        $0.textColor = .gray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let levelLable2 = UILabel().then{
        $0.text = "LV.2"
        $0.textColor = .gray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let levelLable3 = UILabel().then{
        $0.text = "LV.3"
        $0.textColor = .gray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let levelLable4 = UILabel().then{
        $0.text = "LV.4"
        $0.textColor = .gray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let levelLable5 = UILabel().then{
        $0.text = "LV.5"
        $0.textColor = .gray
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
        
    }
//MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.progressBar)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.levelLabel)
        self.view.addSubview(self.descriptionLabel)
        self.view.addSubview(self.levelbar1)
        self.view.addSubview(self.levelbar2)
        self.view.addSubview(self.levelbar3)
        self.view.addSubview(self.levelbar4)
        self.view.addSubview(self.levelbar5)
        self.view.addSubview(self.levelLable1)
        self.view.addSubview(self.levelLable2)
        self.view.addSubview(self.levelLable3)
        self.view.addSubview(self.levelLable4)
        self.view.addSubview(self.levelLable5)
        self.view.addSubview(self.nextButton)
    }

//MARK: - Selector

    
    
    
//MARK: - Layout
    func layout(){
        
    }
    
//MARK: - Target
    func addTarget(){
        
    }
}
