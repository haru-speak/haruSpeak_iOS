//
//  DeleteStudyDetailViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/02.
//

import Foundation
import UIKit
import SnapKit
import Then


class DeleteStudyDetailViewController: UIViewController{
    
    //MARK: - Properties
    let popView = UIView().then{
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        
    }
    let text = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.text = "스터디 생성을 취소하고\n이전으로 돌아가시겠습니까?"
        $0.textColor = .black
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    let line1 = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    let line2 = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    let yes = UIButton().then{
        $0.setTitle("예", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.setTitleColor(.black, for: .normal)
    }
    let no = UIButton().then{
        $0.setTitle("아니요", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.setTitleColor(.black, for: .normal)
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
        self.popView.addSubview(self.text)
        self.popView.addSubview(self.line1)
        self.popView.addSubview(self.line2)
        self.popView.addSubview(self.yes)
        self.popView.addSubview(self.no)

    }

//MARK: - Selector
    @objc private func didClickYes(_ button: UIButton) {
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
        print("Yes")
    }
    @objc private func didClickNo(_ button: UIButton) {
        dismiss(animated: false)
        print("didClickNo")
    }
    
    
    
//MARK: - Layout
    func layout(){
        self.popView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(308)
            $0.height.equalTo(168)
            
        }
        self.text.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.popView.snp.top).offset(40)
        }
        self.line1.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.popView.snp.top).offset(115)
            $0.width.equalTo(308)
            $0.height.equalTo(1)
        }
        self.line2.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.popView.snp.top).offset(115)
            $0.width.equalTo(1)
            $0.height.equalTo(53)
        }
        self.yes.snp.makeConstraints{
            $0.top.equalTo(self.popView.snp.top).offset(128)
            $0.leading.equalTo(self.popView.snp.leading).offset(55)
        }
        self.no.snp.makeConstraints{
            $0.top.equalTo(self.popView.snp.top).offset(128)
            $0.leading.equalTo(self.line2.snp.trailing).offset(56)
        }
    }
    
//MARK: - Target
    func addTarget(){
        self.yes.addTarget(self, action: #selector(self.didClickYes(_:)), for: .touchUpInside)
        self.no.addTarget(self, action: #selector(self.didClickNo(_:)), for: .touchUpInside)
    }
}
