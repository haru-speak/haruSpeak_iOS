//
//  FifthViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/26.
//

import Foundation
import UIKit
import SnapKit
import Then

class FifthViewController: UIViewController{
    
    //MARK: - Properties
    let backButton = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let progressBar = ProgressBarView()
    let titleLabel = UILabel().then{
        $0.text = "💬 매일 꾸준하게 말해볼까요?"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 24)
        $0.textAlignment = .center
    }
    let descriptionLabel = UILabel().then{
        $0.text = "스피킹은 꾸준히 뱉어보는게 중요해요!\n푸시 알림을 활성화해 매일 조금씩 연습해봐요."
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    let achievementMainView = UIView().then{
        $0.backgroundColor = .white
    }
    let achievementButton1 = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 25, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    let achievementButton2 = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 25, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    let achievementButton1Label = UILabel().then{
        $0.text = "네, 받을래요!"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textAlignment = .center
    }
    let achievementButton2Label = UILabel().then{
        $0.text = "알림은 괜찮아요."
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textAlignment = .center
    }
    let nextButton = UIButton().then{
        $0.setTitle("시작하기", for: .normal)
        $0.backgroundColor = .mainColor
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size:16)
    }
    
    
//MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true;
        
        self.progressBar.ratio = 5/5
        
    }
//MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.progressBar)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.descriptionLabel)
        self.view.addSubview(self.achievementMainView)
        achievementMainView.addSubview(self.achievementButton1)
        achievementButton1.addSubview(self.achievementButton1Label)
        achievementMainView.addSubview(self.achievementButton2)
        achievementButton2.addSubview(self.achievementButton2Label)
        self.view.addSubview(self.nextButton)
    }

//MARK: - Selector
    
    @objc private func didClickNext(_ button: UIButton) {
        let VC = JoinMSViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
        print("didClickNext")
    }
    
    @objc private func didClickBack(_ button: UIButton) {
        dismiss(animated: false)
        print("didClickBack")
    }
    
    var Btn1switch = false
    var Btn2switch = false
    @objc private func didClickBtn1(_ button: UIButton) {
        if Btn1switch == false{
            self.achievementButton1.backgroundColor = .mainColor
            self.achievementButton1Label.textColor = .white
            Btn1switch = true
            if Btn2switch == true{
                self.achievementButton2.backgroundColor = .white
                self.achievementButton2Label.textColor = .black
                Btn2switch = false
            }
        }else{
            self.achievementButton1.backgroundColor = .white
            self.achievementButton1Label.textColor = .black
            Btn1switch = false
        }
    }
    @objc private func didClickBtn2(_ button: UIButton) {
        if Btn2switch == false{
            self.achievementButton2.backgroundColor = .mainColor
            self.achievementButton2Label.textColor = .white
            Btn2switch = true
            if Btn1switch == true{
                self.achievementButton1.backgroundColor = .white
                self.achievementButton1Label.textColor = .black
                Btn1switch = false
            }
        }else{
            self.achievementButton2.backgroundColor = .white
            self.achievementButton2Label.textColor = .black
            Btn2switch = false
        }
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
            $0.height.equalTo(2)
        }
        self.titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.progressBar.snp.bottom).offset(52)
        }
        self.descriptionLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(15)
        }
        self.achievementMainView.snp.makeConstraints{
            $0.height.equalTo(353)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.descriptionLabel.snp.bottom).offset(54)
            $0.leading.equalToSuperview().offset(25)
        }
        self.achievementButton1.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        self.achievementButton2.snp.makeConstraints{
            $0.top.equalTo(self.achievementButton1.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        self.achievementButton1Label.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.achievementButton2Label.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.nextButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
            $0.bottom.equalToSuperview().offset(-44)
            $0.height.equalTo(45)
        }
    }
        
//MARK: - Target
    func addTarget(){
        let achievementBtn1 = UITapGestureRecognizer(target: self, action: #selector(didClickBtn1))
        achievementButton1.isUserInteractionEnabled = true
        achievementButton1.addGestureRecognizer(achievementBtn1)
        
        let achievementBtn2 = UITapGestureRecognizer(target: self, action: #selector(didClickBtn2))
        achievementButton2.isUserInteractionEnabled = true
        achievementButton2.addGestureRecognizer(achievementBtn2)
        
        self.nextButton.addTarget(self, action: #selector(self.didClickNext(_:)), for: .touchUpInside)
        
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(didClickBack))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(backBtn)
    }
    
}
