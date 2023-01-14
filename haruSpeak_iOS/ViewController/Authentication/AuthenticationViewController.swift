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
import GoogleSignIn

class AuthenticationViewController: UIViewController{
    
    
    //MARK: - Properties
    let arrowLeft = UIButton(type: .system).then{
        $0.setTitle("arrowLeft", for: .normal)
        $0.setImage(UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal), for: .normal)
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
    let GoogleLogin = UIButton(type: .system).then{
        $0.setTitle("구글 계정으로 진행", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.layer.cornerRadius = 22.5
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.tag = 0
    }
    let joinMembership = UIButton(type: .system).then{
        $0.setTitle("아직 계정이 없나요? 회원가입 하기", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Thin", size: 13)
        $0.setTitleColor(.gray, for: .normal)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupLayout()
        addTarget()
        
    }
    
    //MARK: - Selector
    @objc func emailLoginButtonTapped(){
        self.navigationController?.pushViewController(EmailLoginViewController(), animated: true)
        self.navigationController?.navigationBar.isHidden = true
        }
    
    @objc func googleLoginButtonTapped(){
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
        guard error == nil else { return }
        guard let signInResult = signInResult else { return }

        let user = signInResult.user
        let emailAddress = user.profile?.email
        let fullName = user.profile?.name
        print(user)
        print(emailAddress)
        print(fullName)
        }

        // If sign in succeeded, display the app's main content View.
    }
    
    @objc func joinMembershipButtonTapped(){
        self.navigationController?.pushViewController(MembershipViewController(), animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
        
    
    //MARK: - addSubView
        private func setupView(){
            self.view.addSubview(self.arrowLeft)
            self.view.addSubview(self.haruSpeakLogo)
            self.view.addSubview(self.loginText)
            self.view.addSubview(self.emailLogin)
            self.view.addSubview(self.KakaoTalkLogin)
            self.view.addSubview(self.AppleLogin)
            self.view.addSubview(self.NaverLogin)
            self.view.addSubview(self.GoogleLogin)
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
        self.GoogleLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.NaverLogin.snp.bottom).offset(15)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.joinMembership.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.GoogleLogin.snp.bottom).offset(19)
        }
        
    }
    
//MARK: - AddTarget
    private func addTarget(){
        self.emailLogin.addTarget(self, action: #selector(self.emailLoginButtonTapped), for: .touchUpInside)
        self.GoogleLogin.addTarget(self, action: #selector(self.googleLoginButtonTapped), for: .touchUpInside)
        self.joinMembership.addTarget(self, action: #selector(self.joinMembershipButtonTapped), for: .touchUpInside)
    }
    
    
}
