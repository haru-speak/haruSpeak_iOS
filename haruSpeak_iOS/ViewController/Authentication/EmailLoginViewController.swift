//
//  EmailLoginViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/14.
//

import Foundation
import UIKit
import SnapKit
import Then

class EmailLoginViewController: UIViewController{
    //MARK: - Properties
    let arrowLeft = UIButton(type: .system).then{
        
        $0.setTitle("arrowLeft", for: .normal)
        $0.setImage(UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal), for: .normal)

    }
    let haruSpeakLogo = UIImageView().then{
        $0.image = UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal)
    }
    let loginText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.text = "로그인"
        $0.textColor = .black
    }
    let emailTextField = UITextField().then{
        $0.backgroundColor = .systemGray6
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.placeholder = " 이메일"
        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let passwordTextField = UITextField().then{
        $0.backgroundColor = .systemGray6
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.placeholder = " 비밀번호"
        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    
    let emailLoginButton = UIButton(type: .system).then{
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .mainColor

    }
    let joinMembership = UIButton(type: .system).then{
        $0.setTitle("아직 계정이 없나요? 회원가입 하기", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Thin", size: 13)
        $0.setTitleColor(.gray, for: .normal)
    }
    
    let findId = UIButton(type: .system).then{
        $0.setTitle("아이디", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Thin", size: 13)
        $0.setTitleColor(.gray, for: .normal)
    }
    let findPW = UIButton(type: .system).then{
        $0.setTitle("비밀번호 찾기", for: .normal)
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
    @objc func arrowLeftButtonTapped(){
        dismiss(animated: true)
    }
    
    @objc func joinMembershipButtonTapped(){
        let VC = MembershipViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true)
    }
    
    @objc func loginButtonTapped(){
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }

        
       
    
    //MARK: - addSubView
        private func setupView(){
            self.view.addSubview(self.arrowLeft)
            self.view.addSubview(self.haruSpeakLogo)
            self.view.addSubview(self.loginText)
            self.view.addSubview(self.emailTextField)
            self.view.addSubview(self.passwordTextField)
            self.view.addSubview(self.emailLoginButton)
            self.view.addSubview(self.joinMembership)
            self.view.addSubview(self.findId)
            self.view.addSubview(self.findPW)


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
            $0.top.equalToSuperview().offset(201)
            $0.width.equalTo(192)
            $0.height.equalTo(52)
            
        }
            
        self.loginText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(61)
        }
        
        self.emailTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.haruSpeakLogo.snp.bottom).offset(40)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.passwordTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.emailTextField.snp.bottom).offset(15)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.emailLoginButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.passwordTextField.snp.bottom).offset(15)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.joinMembership.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.emailLoginButton.snp.bottom).offset(15)
        }
        
        self.findId.snp.makeConstraints{
            $0.top.equalTo(self.joinMembership.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(141)
        }
        
        self.findPW.snp.makeConstraints{
            $0.top.equalTo(self.joinMembership.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().offset(-141)
        }
        
    }
    
//MARK: - AddTarget
    private func addTarget(){
        self.arrowLeft.addTarget(self, action: #selector(self.arrowLeftButtonTapped), for: .touchUpInside)
        self.joinMembership.addTarget(self, action: #selector(self.joinMembershipButtonTapped), for: .touchUpInside)
        self.emailLoginButton.addTarget(self, action: #selector(self.loginButtonTapped), for: .touchUpInside)
    }
 
}
