//
//  ClickRecordViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/13.
//

import Foundation
import UIKit
import SnapKit
import Then

class ClickRecordViewController: UIViewController{
    
//MARK: - Properties
    let popView = UIView().then{
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    let followButton = UIButton().then{
        $0.backgroundColor = .mainColor
        $0.setTitle("팔로우", for: .normal)
        $0.layer.cornerRadius = 12
    }
    let backButton = UIButton().then{
        $0.setImage(UIImage(systemName: "xmark")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.
    }
    
    let testLabel = UILabel().then{
        $0.text = "Test"
    }

//MARK: - LifeCycle
    override func viewDidLoad() {
        self.view.backgroundColor = .black.withAlphaComponent(0.3)
        setUpView()
        layout()
        addTarget()
        
    }
//MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.popView)
        self.popView.addSubview(self.followButton)
        self.popView.addSubview(self.backButton)
    }

//MARK: - Selector
    @objc private func didClickBack(_ button: UIButton) {
        dismiss(animated: false)
        print("didClickBack")
    }
    @objc private func didClickFollow(_ button: UIButton) {
        print("didClickFollow")
    }
    @objc private func didClickBackBackground(sender: UITapGestureRecognizer) {
        dismiss(animated: false)
        print("didClickBackBackground")
    }
    
    
    
//MARK: - Layout
    func layout(){
        self.popView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(41)
            $0.trailing.equalToSuperview().offset(-41)
            $0.size.height.equalTo(233)
            
        }
        self.followButton.snp.makeConstraints{
            $0.centerX.equalTo(self.popView)
            $0.bottom.equalTo(self.popView.snp.bottom).offset(-10)
            $0.leading.equalTo(self.popView.snp.leading).offset(20)
            $0.trailing.equalTo(self.popView.snp.trailing).offset(-20)
        }
        self.backButton.snp.makeConstraints{
            $0.top.equalTo(self.popView.snp.top).offset(10)
            $0.trailing.equalTo(self.popView.snp.trailing).offset(-10)
        }
    }
    
//MARK: - Target
    func addTarget(){
        self.backButton.addTarget(self, action: #selector(self.didClickBack(_:)), for: .touchUpInside)
        
        self.followButton.addTarget(self, action: #selector(self.didClickFollow(_:)), for: .touchUpInside)
        
        let backgroundView = UITapGestureRecognizer(target: self, action: #selector(didClickBackBackground(sender:)))
        self.view.addGestureRecognizer(backgroundView)
    }
    

}

