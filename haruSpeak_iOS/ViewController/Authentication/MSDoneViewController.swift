//
//  MembershipDoneViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/18.
//

import Foundation
import UIKit
import SnapKit
import Then

class MSDoneViewController: UIViewController{
    //MARK: - Properties
    let arrowLeft = UIButton(type: .system).then{
        $0.setTitle("arrowLeft", for: .normal)
        $0.setImage(UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    let membershipText1 = UILabel().then{
        $0.text = "회원가입 완료!"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 24)
        $0.textColor = .mainColor
    }
    let membershipText2 = UILabel().then{
        $0.text = "이제 하루스픽 계정으로\n서비스를 마음껏 이용해보세요."
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    let loginButton = UIButton(type: .system).then{
        $0.setTitle("로그인 하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.layer.cornerRadius = 7
        $0.backgroundColor = .mainColor

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
    @objc func loginButtonTapped(){
        let VC = AuthenticationViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    
    
    
    
    
    //MARK: - addSubView
    private func setupView(){
        self.view.addSubview(self.arrowLeft)
        self.view.addSubview(self.membershipText1)
        self.view.addSubview(self.membershipText2)
        self.view.addSubview(self.loginButton)
        
        
        
    }
    
    //MARK: - Layout
    private func setupLayout(){
        self.arrowLeft.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(55)
            $0.leading.equalTo(self.view.snp.leading).offset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        
        self.membershipText1.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(149)
            $0.leading.equalTo(self.view.snp.leading).offset(44)
        }
        self.membershipText2.snp.makeConstraints{
            $0.top.equalTo(self.membershipText1.snp.bottom).offset(10)
            $0.leading.equalTo(self.view.snp.leading).offset(44)
        }
        self.loginButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-56)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
    }
    
    //MARK: - AddTarget
    private func addTarget(){
        self.arrowLeft.addTarget(self, action: #selector(self.arrowLeftButtonTapped), for: .touchUpInside)
        self.loginButton.addTarget(self, action: #selector(self.loginButtonTapped), for: .touchUpInside)
    }
}
