//
//  JoinMembershipViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/14.
//

import Foundation
import UIKit
import SnapKit
import Then

class MembershipViewController: UIViewController{
    //MARK: - Properties
    let arrowLeft = UIButton(type: .system).then{
        $0.setTitle("arrowLeft", for: .normal)
        $0.setImage(UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal), for: .normal)

    }
    let haruSpeakLogo = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 7
    }
    let membershipText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 24)
        $0.text = "회원가입"
        $0.textColor = .black
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
        self.navigationController?.pushViewController(AuthenticationViewController(), animated: true)
    }

        
       
    
    //MARK: - addSubView
        private func setupView(){
            self.view.addSubview(self.arrowLeft)
            self.view.addSubview(self.haruSpeakLogo)
            self.view.addSubview(self.membershipText)

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
            
        self.membershipText.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(49)
            $0.top.equalTo(self.view.snp.top).offset(165)
        }
        
    }
    
//MARK: - AddTarget
    private func addTarget(){
        self.arrowLeft.addTarget(self, action: #selector(self.arrowLeftButtonTapped), for: .touchUpInside)
    }
 
}

