//
//  AuthenticationViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/13.
//

import Foundation
import UIKit
import SnapKit
import Then

class AuthenticationViewController: UIViewController{
    //MARK: - Properties
    let arrowLeft = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let haruSpeakLogo = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 7
    }
    let loginText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 24)
        $0.text = "로그인"
        $0.textColor = .black
    }
    
    let emailLogin = UIButton(type: .system).then{
        $0.setTitle("이메일 주소로 계속하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.layer.cornerRadius = 22.5
        $0.backgroundColor = .systemBlue
        $0.tag = 0
    }
    let KakaoTalkLogin = UIButton(type: .system).then{
        $0.setTitle("카카오톡으로 진행", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.layer.cornerRadius = 22.5
        $0.backgroundColor = .yellow
        $0.tag = 0
    }
    let AppleLogin = UIButton(type: .system).then{
        $0.setTitle("Apple로 계속하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.layer.cornerRadius = 22.5
        $0.backgroundColor = .black
        $0.tag = 0
    }
    let NaverLogin = UIButton(type: .system).then{
        $0.setTitle("Naver로 진행", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.layer.cornerRadius = 22.5
        $0.backgroundColor = .systemGreen
        $0.tag = 0
    }
    let googleLogin = UIButton(type: .system).then{
        $0.setTitle("구글 계정으로 진행", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.layer.cornerRadius = 22.5
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.tag = 0
    }
    let joinMembership = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Thin", size: 13)
        $0.text = "아직 계정이 없나요? 회원가입 하기"
        $0.textColor = .gray
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupLayout()
        
    }
    
    //MARK: - Selector

        
       
    
    //MARK: - addSubView
        private func setupView(){
            self.view.addSubview(self.arrowLeft)
            self.view.addSubview(self.haruSpeakLogo)
            self.view.addSubview(self.loginText)
            self.view.addSubview(self.emailLogin)
            self.view.addSubview(self.KakaoTalkLogin)
            self.view.addSubview(self.AppleLogin)
            self.view.addSubview(self.NaverLogin)
            self.view.addSubview(self.googleLogin)
            self.view.addSubview(self.joinMembership)


        }
    
    //MARK: - Layout
    private func setupLayout(){
        self.arrowLeft.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(55)
            $0.leading.equalTo(self.view.snp.leading).offset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        self.haruSpeakLogo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(55)
            $0.width.equalTo(129)
            $0.height.equalTo(30)
            
        }
            
        self.loginText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(189)
        }
        
        self.emailLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.loginText.snp.bottom).offset(62)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.KakaoTalkLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.emailLogin.snp.bottom).offset(15)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.AppleLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.KakaoTalkLogin.snp.bottom).offset(15)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.NaverLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.AppleLogin.snp.bottom).offset(15)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        self.googleLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.NaverLogin.snp.bottom).offset(15)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.joinMembership.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.googleLogin.snp.bottom).offset(19)
        }
        
    }
    
//MARK: - AddTarget
    private func addTarget(){
        
    }
    
}
