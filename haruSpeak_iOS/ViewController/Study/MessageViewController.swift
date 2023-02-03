//
//  MessageViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/02.
//

import Foundation
import UIKit
import SnapKit
import Then

class MessageViewController: UIViewController{
    
    
    //MARK: - Datasource
    
    
    
    //MARK: - Properties
    let backButton = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let messageLabel = UILabel().then{
        $0.text = "메시지"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
    }
    let tabbar = MessageCustomTabbar()

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true;
    }
    
    //MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.tabbar)
        self.view.addSubview(self.messageLabel)
    }
    
    //MARK: - Selector
    @objc private func didClickBack(_ button: UIButton) {
        dismiss(animated: true)
        print("didClickBack")
    }
    
    
    //MARK: - Layout
    func layout(){
        self.backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.leading.equalToSuperview().offset(16)
        }
        self.messageLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(59)
        }
        self.tabbar.snp.makeConstraints{
            $0.top.equalTo(self.backButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }

    }
    
    //MARK: - Target
    func addTarget(){
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(didClickBack))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(backBtn)
    }
}



