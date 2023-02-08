//
//  AllClickProfileViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/02/07.
//

import Foundation
import UIKit
import SnapKit
import Then

class AllClickProfileViewController: UIViewController{
    
    
    //MARK: - Datasource

    
    
    //MARK: - Properties
    let fullView = UIView().then{
        $0.backgroundColor = .white
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
    let followButton = UIButton().then{
        $0.setTitle(" 팔로우 ", for: .normal)
        $0.setTitleColor(.mainColor, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    let viewSpeakinglogButton = UIButton().then{
        $0.setTitle(" 채드님의 스피킹log 보기 ", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.backgroundColor = UIColor.mainColor
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        
        self.view.backgroundColor = .black
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
        self.mainView.addSubview(self.followButton)
        self.mainView.addSubview(self.viewSpeakinglogButton)

        
    }
    var followIndex = 0
    
    //MARK: - Selector
    @objc func didClickBackground(sender: UITapGestureRecognizer){
        dismiss(animated: false)
    }
    @objc func didClickfollowButton(_ button: UIButton) {
        if followIndex == 0{
            followButton.setTitle(" 팔로잉 ", for: .normal)
            followButton.setTitleColor(.white, for: .normal)
            followButton.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
            followButton.backgroundColor = UIColor.mainColor
            followButton.layer.cornerRadius = 15
            followButton.layer.borderColor = UIColor.mainColor.cgColor
            followButton.layer.borderWidth = 1
            followButton.layoutIfNeeded()
            
            followIndex = 1
        }else{
            followButton.setTitle(" 팔로우 ", for: .normal)
            followButton.setTitleColor(.mainColor, for: .normal)
            followButton.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
            followButton.backgroundColor = UIColor.white
            followButton.layer.cornerRadius = 15
            followButton.layer.borderColor = UIColor.mainColor.cgColor
            followButton.layer.borderWidth = 1
            followButton.layoutIfNeeded()
            
            followIndex = 0
        }
        
    }
    
    
    @objc func didClickviewSpeakinglogButton(_ button: UIButton) {
        print("didClickviewSpeakinglogButton")
    }
    
    //MARK: - Layout
    func layout(){
        self.fullView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        self.mainView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(295)
            $0.height.equalTo(223)
        }
        self.profileImage.snp.makeConstraints{
            $0.height.width.equalTo(44)
            $0.top.equalToSuperview().offset(270)
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
        self.followButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.height.equalTo(45)
            $0.width.equalTo(124)
        }
        self.viewSpeakinglogButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.height.equalTo(45)
            $0.width.equalTo(202)
        }

        
    }
    
    //MARK: - Target
    func addTarget(){
        let backgroundBtn = UITapGestureRecognizer(target: self, action: #selector(didClickBackground))
        fullView.isUserInteractionEnabled = true
        fullView.addGestureRecognizer(backgroundBtn)
        
        self.followButton.addTarget(self, action: #selector(self.didClickfollowButton(_:)), for: .touchUpInside)
        self.viewSpeakinglogButton.addTarget(self, action: #selector(self.didClickviewSpeakinglogButton(_:)), for: .touchUpInside)
    }
}
