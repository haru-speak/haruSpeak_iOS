//
//  DetailProfileViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/02/02.
//

import Foundation
import UIKit
import SnapKit
import Then

class DetailProfileViewController: UIViewController{
    
    
    //MARK: - Datasource
    

    
    
    //MARK: - Properties
    let fullView = UIView().then{
        $0.backgroundColor = .black
        $0.alpha = 0.5
    }
    let mainView = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    
    let profileImage = UIImageView().then{
        $0.roundCorners(cornerRadius: 22, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.image = UIImage(named: "mypage")?.withRenderingMode(.alwaysOriginal)
        $0.backgroundColor = .white
    }
    let profileName = UILabel().then{
        $0.text = "채드"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 22)
        $0.numberOfLines = 0
    }
    let followerFollowingView = UIView().then{
        $0.backgroundColor = .white
    }
    let followerLabel = UILabel().then{
        $0.text = "팔로워"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let followingLabel = UILabel().then{
        $0.text = "팔로잉"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let seperateView = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    let followerNumber = UILabel().then{
        $0.text = "3"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let followingNumber = UILabel().then{
        $0.text = "10"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let profileObjective = UILabel().then{
        $0.text = "꾸준히 연습해서 프리토킹 도전!"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
        $0.textAlignment = .center
    }
    let tagViewEng = UIView().then{
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .englishTag
    }
    let tagViewEngLabel = UILabel().then{
        $0.text = "영어 Lv.2"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textAlignment = .center
        $0.textColor = .white
    }
    let tagViewKor = UIView().then{
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .koreanTag
    }
    let tagViewKorLabel = UILabel().then{
        $0.text = "한국어 Lv.5"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textAlignment = .center
    }
    let tagViewObjective = UIView().then{
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .objectiveTag
    }
    let tagViewObjectiveLabel = UILabel().then{
        $0.text = "오픽 준비 중"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textAlignment = .center
    }
    let line = UIView().then{
        $0.backgroundColor = UIColor.systemGray4
    }
    let uploadLabel = UILabel().then{
        $0.text = "업로드 알림"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.textAlignment = .center
    }
    let uploadDescriptionLabel = UILabel().then{
        $0.text = "채드 님이 스피킹을 업로드하면 알림을 받습니다."
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
        $0.textAlignment = .center
    }
    let uploadSwitch = UISwitch().then{
        $0.tintColor = .mainColor
        $0.onTintColor = .mainColor
    }
    
    
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        
        self.view.backgroundColor = .clear
        self.navigationController?.navigationBar.isHidden = true;
        
        self.profileImage.bringSubviewToFront(self.mainView)
    }
    
    //MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.fullView)
        self.view.addSubview(self.mainView)
        
        self.view.addSubview(self.profileImage)
        self.mainView.addSubview(self.profileName)
        self.mainView.addSubview(self.followerFollowingView)
        self.followerFollowingView.addSubview(self.followerLabel)
        self.followerFollowingView.addSubview(self.followingLabel)
        self.followerFollowingView.addSubview(self.seperateView)
        self.followerFollowingView.addSubview(self.followerNumber)
        self.followerFollowingView.addSubview(self.followingNumber)
        self.mainView.addSubview(self.profileObjective)
        self.mainView.addSubview(self.tagViewEng)
        self.mainView.addSubview(self.tagViewKor)
        self.mainView.addSubview(self.tagViewObjective)
        self.tagViewEng.addSubview(self.tagViewEngLabel)
        self.tagViewKor.addSubview(self.tagViewKorLabel)
        self.tagViewObjective.addSubview(self.tagViewObjectiveLabel)
        self.mainView.addSubview(self.line)
        self.mainView.addSubview(self.uploadLabel)
        self.mainView.addSubview(self.uploadDescriptionLabel)
        self.mainView.addSubview(self.uploadSwitch)
        
    }
    
    //MARK: - Selector
    @objc func didClickBackground(sender: UITapGestureRecognizer){
        dismiss(animated: false)
    }
    
    //MARK: - Layout
    func layout(){
        self.fullView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        self.mainView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-43)
            $0.height.equalTo(298)
        }
        self.profileImage.snp.makeConstraints{
            $0.height.width.equalTo(44)
            $0.top.equalToSuperview().offset(490.68)
            $0.centerX.equalToSuperview()
        }
        self.profileName.snp.makeConstraints{
            $0.top.equalTo(self.profileImage.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        self.followerFollowingView.snp.makeConstraints{
            $0.top.equalTo(self.profileName.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(133)
            $0.height.equalTo(33)
        }
        self.followerLabel.snp.makeConstraints{
            $0.top.bottom.leading.equalToSuperview()
        }
        self.followerNumber.snp.makeConstraints{
            $0.leading.equalTo(self.followerLabel.snp.trailing).offset(5)
            $0.top.bottom.equalToSuperview()
        }
        self.seperateView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(1)
            $0.height.equalTo(10)
        }
        self.followingLabel.snp.makeConstraints{
            $0.trailing.equalTo(self.followingNumber.snp.leading).offset(-5)
            $0.top.bottom.equalToSuperview()
        }
        self.followingNumber.snp.makeConstraints{
            $0.top.bottom.trailing.equalToSuperview()
        }
        self.profileObjective.snp.makeConstraints{
            $0.top.equalTo(self.followerFollowingView.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        self.tagViewKor.snp.makeConstraints{
            $0.top.equalTo(self.profileObjective.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(88)
            $0.height.equalTo(22)
        }
        self.tagViewEng.snp.makeConstraints{
            $0.centerY.equalTo(self.tagViewKor)
            $0.trailing.equalTo(self.tagViewKor.snp.leading).offset(-10)
            $0.width.equalTo(88)
            $0.height.equalTo(22)
        }
        self.tagViewObjective.snp.makeConstraints{
            $0.centerY.equalTo(self.tagViewKor)
            $0.leading.equalTo(self.tagViewKor.snp.trailing).offset(10)
            $0.width.equalTo(88)
            $0.height.equalTo(22)
        }
        self.tagViewKorLabel.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.tagViewEngLabel.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.tagViewObjectiveLabel.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.line.snp.makeConstraints{
            $0.top.equalTo(self.tagViewKor.snp.bottom).offset(22)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        self.uploadLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.line.snp.bottom).offset(15)
        }
        self.uploadDescriptionLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.uploadLabel.snp.bottom).offset(3)
        }
        self.uploadSwitch.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.uploadDescriptionLabel.snp.bottom).offset(17)
        }
        
    }
    
    //MARK: - Target
    func addTarget(){
        let backgroundBtn = UITapGestureRecognizer(target: self, action: #selector(didClickBackground))
        fullView.isUserInteractionEnabled = true
        fullView.addGestureRecognizer(backgroundBtn)
    }
}
