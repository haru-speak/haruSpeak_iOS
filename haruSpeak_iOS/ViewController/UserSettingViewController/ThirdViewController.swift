//
//  ThirdViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/25.
//
import Foundation
import UIKit
import SnapKit
import Then

class ThirdViewController: UIViewController{

//MARK: - Properties
    let backButton = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let progressBar = ProgressBarView()
    let titleLabel = UILabel().then{
        $0.text = "하루스픽을 통해 \n얻고 싶은게 있다면?🔥"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 24)
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    let descriptionLabel = UILabel().then{
        $0.text = "다중선택 가능"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.textAlignment = .center
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
    let achievementButton3 = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 25, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    let achievementButton4 = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 25, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    let achievementButton5 = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 25, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    let achievementButton1Label = UILabel().then{
        $0.text = "일상 속 유용한 표현 배우기!"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textAlignment = .center
    }
    let achievementButton2Label = UILabel().then{
        $0.text = "다른 사람들의 피드백!"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textAlignment = .center
    }
    let achievementButton3Label = UILabel().then{
        $0.text = "듣기 능력 키우기!"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textAlignment = .center
    }
    let achievementButton4Label = UILabel().then{
        $0.text = "함께 공부할 스터디 찾기!"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textAlignment = .center
    }
    let achievementButton5Label = UILabel().then{
        $0.text = "어학 자격증 따기!"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textAlignment = .center
    }

    let nextButton = UIButton().then{
        $0.setTitle("다음", for: .normal)
        $0.backgroundColor = .systemGray6
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size:16)
        $0.isEnabled = false
    }
    
    
//MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true;
        
        self.progressBar.ratio = 3/5
        
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
        achievementMainView.addSubview(self.achievementButton3)
        achievementButton3.addSubview(self.achievementButton3Label)
        achievementMainView.addSubview(self.achievementButton4)
        achievementButton4.addSubview(self.achievementButton4Label)
        achievementMainView.addSubview(self.achievementButton5)
        achievementButton5.addSubview(self.achievementButton5Label)
        self.view.addSubview(self.nextButton)
    }

//MARK: - Selector
    
    @objc private func didClickNext(_ button: UIButton) {
        
//        다음 ViewController 만들면 활성화시켜주세여
        let VC = FifthViewController()
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
    var Btn3switch = false
    var Btn4switch = false
    var Btn5switch = false
    
    @objc private func didClickBtn1(_ button: UIButton) {
        if Btn1switch == false{
            self.achievementButton1.backgroundColor = .mainColor
            self.achievementButton1Label.textColor = .white
            Btn1switch = true
        }else{
            self.achievementButton1.backgroundColor = .white
            self.achievementButton1Label.textColor = .black
            Btn1switch = false
        }
        checkButtonisClicked()
    }
    @objc private func didClickBtn2(_ button: UIButton) {
        if Btn2switch == false{
            self.achievementButton2.backgroundColor = .mainColor
            self.achievementButton2Label.textColor = .white
            Btn2switch = true
        }else{
            self.achievementButton2.backgroundColor = .white
            self.achievementButton2Label.textColor = .black
            Btn2switch = false
        }
        checkButtonisClicked()
    }
    @objc private func didClickBtn3(_ button: UIButton) {
        if Btn3switch == false{
            self.achievementButton3.backgroundColor = .mainColor
            self.achievementButton3Label.textColor = .white
            Btn3switch = true
        }else{
            self.achievementButton3.backgroundColor = .white
            self.achievementButton3Label.textColor = .black
            Btn3switch = false
        }
        checkButtonisClicked()
    }
    @objc private func didClickBtn4(_ button: UIButton) {
        if Btn4switch == false{
            self.achievementButton4.backgroundColor = .mainColor
            self.achievementButton4Label.textColor = .white
            Btn4switch = true
        }else{
            self.achievementButton4.backgroundColor = .white
            self.achievementButton4Label.textColor = .black
            Btn4switch = false
        }
        checkButtonisClicked()
    }
    @objc private func didClickBtn5(_ button: UIButton) {
        if Btn5switch == false{
            self.achievementButton5.backgroundColor = .mainColor
            self.achievementButton5Label.textColor = .white
            Btn5switch = true
        }else{
            self.achievementButton5.backgroundColor = .white
            self.achievementButton5Label.textColor = .black
            Btn5switch = false
        }
        checkButtonisClicked()
    }
    
    func checkButtonisClicked(){
        if Btn1switch == false && Btn2switch == false && Btn3switch == false && Btn4switch == false && Btn5switch == false{
            self.nextButton.backgroundColor = .systemGray6
            self.nextButton.isEnabled = false
        }else{
            self.nextButton.backgroundColor = .mainColor
            self.nextButton.isEnabled = true
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
        self.achievementButton3.snp.makeConstraints{
            $0.top.equalTo(self.achievementButton2.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        self.achievementButton4.snp.makeConstraints{
            $0.top.equalTo(self.achievementButton3.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        self.achievementButton5.snp.makeConstraints{
            $0.top.equalTo(self.achievementButton4.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        self.achievementButton1Label.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.achievementButton2Label.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.achievementButton3Label.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.achievementButton4Label.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.achievementButton5Label.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.nextButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
            $0.top.equalTo(self.achievementMainView.snp.bottom).offset(80)
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
        
        let achievementBtn3 = UITapGestureRecognizer(target: self, action: #selector(didClickBtn3))
        achievementButton3.isUserInteractionEnabled = true
        achievementButton3.addGestureRecognizer(achievementBtn3)
        
        let achievementBtn4 = UITapGestureRecognizer(target: self, action: #selector(didClickBtn4))
        achievementButton4.isUserInteractionEnabled = true
        achievementButton4.addGestureRecognizer(achievementBtn4)
        
        let achievementBtn5 = UITapGestureRecognizer(target: self, action: #selector(didClickBtn5))
        achievementButton5.isUserInteractionEnabled = true
        achievementButton5.addGestureRecognizer(achievementBtn5)
        
        self.nextButton.addTarget(self, action: #selector(self.didClickNext(_:)), for: .touchUpInside)
        
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(didClickBack))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(backBtn)
    }
}

