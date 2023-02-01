//
//  MyPageViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/11.
//

import Foundation
import UIKit
import SnapKit
import Then

class MyPageViewController: UIViewController{
//MARK: - Datasource
  
    
//MARK: - Properties
    let blueView = UIView().then{
        $0.backgroundColor = .mainColor
    }
    let profileImage = UIImageView().then{
        $0.roundCorners(cornerRadius: 35, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.image = UIImage(named: "mypage")?.withRenderingMode(.alwaysOriginal)
        $0.backgroundColor = .white
    }
    let profileName = UILabel().then{
        $0.text = "무유"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 24)
        $0.numberOfLines = 0
    }
    let moreProfileButton = UIImageView().then{
        $0.image = UIImage(named: "moreprofile")?.withRenderingMode(.alwaysOriginal)
    }
    let followerFollowingView = UIView().then{
        $0.backgroundColor = .systemGray6
    }
    let followerLabel = UILabel().then{
        $0.text = "팔로워"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
    }
    let followingLabel = UILabel().then{
        $0.text = "팔로잉"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
    }
    let seperateView = UIView().then{
        $0.backgroundColor = UIColor.black
    }
    let followerNumber = UILabel().then{
        $0.text = "3"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
    }
    let followingNumber = UILabel().then{
        $0.text = "10"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
    }
    let profileObjective = UILabel().then{
        $0.text = "꾸준히 연습해서 프리토킹 도전"
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
    let giverLearnerView = UIView().then{
        $0.backgroundColor = .yellow
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let saveButton = UILabel().then{
        $0.text = "찜"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
    }
    let interestTopicButton = UILabel().then{
        $0.text = "관심 주제"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
    }
    let alarmButton = UILabel().then{
        $0.text = "알림"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
    }
    let accountButton = UILabel().then{
        $0.text = "계정"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
    }
    let line1 = UIView().then{
        $0.backgroundColor = UIColor.systemGray4
    }
    let line2 = UIView().then{
        $0.backgroundColor = UIColor.systemGray4
    }
    let line3 = UIView().then{
        $0.backgroundColor = UIColor.systemGray4
    }
    
//MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        
        self.view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = true;
        
    }
//MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.blueView)
        self.view.addSubview(self.profileImage)
        self.view.addSubview(self.profileName)
        self.view.addSubview(self.moreProfileButton)
        self.view.addSubview(self.followerFollowingView)
        self.followerFollowingView.addSubview(self.followerLabel)
        self.followerFollowingView.addSubview(self.followingLabel)
        self.followerFollowingView.addSubview(self.seperateView)
        self.followerFollowingView.addSubview(self.followerNumber)
        self.followerFollowingView.addSubview(self.followingNumber)
        self.view.addSubview(self.profileObjective)
        self.view.addSubview(self.tagViewEng)
        self.view.addSubview(self.tagViewKor)
        self.view.addSubview(self.tagViewObjective)
        self.tagViewEng.addSubview(self.tagViewEngLabel)
        self.tagViewKor.addSubview(self.tagViewKorLabel)
        self.tagViewObjective.addSubview(self.tagViewObjectiveLabel)
        self.view.addSubview(self.giverLearnerView)
        
        self.view.addSubview(self.saveButton)
        self.view.addSubview(self.interestTopicButton)
        self.view.addSubview(self.alarmButton)
        self.view.addSubview(self.accountButton)
        self.view.addSubview(self.line1)
        self.view.addSubview(self.line2)
        self.view.addSubview(self.line3)
    }

//MARK: - Selector

    @objc func didClickFollowerFollowingView(sender: UITapGestureRecognizer){
        print("didClickFollowerFollowingView")
        let VC = FollowerFollowingViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true)
    }
    @objc func didClickMoreProfileView(sender: UITapGestureRecognizer){
        print("didClickMoreProfileView")
        let VC = MoreProfileViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true)
    }
    
    
   
    
//MARK: - Layout
    func layout(){
        self.blueView.snp.makeConstraints{
            $0.top.trailing.leading.equalToSuperview().offset(0)
            $0.height.equalTo(128)
        }
        self.profileImage.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(70)
            $0.top.equalTo(self.blueView.snp.bottom).offset(-35)
        }
        self.profileName.snp.makeConstraints{
            $0.top.equalTo(self.profileImage.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        self.moreProfileButton.snp.makeConstraints{
            $0.leading.equalTo(self.profileName.snp.trailing).offset(10)
            $0.centerY.equalTo(self.profileName)
            $0.width.equalTo(7.43)
            $0.height.equalTo(13)
        }
        self.followerFollowingView.snp.makeConstraints{
            $0.top.equalTo(self.moreProfileButton.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(120)
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
            $0.top.equalTo(self.followerFollowingView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
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
        self.giverLearnerView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(27)
            $0.top.equalTo(self.tagViewKor.snp.bottom).offset(35)
            $0.height.equalTo(176)
        }
        self.saveButton.snp.makeConstraints{
            $0.top.equalTo(self.giverLearnerView.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
        }
        self.line1.snp.makeConstraints{
            $0.top.equalTo(self.saveButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
            $0.height.equalTo(1)
        }
        self.interestTopicButton.snp.makeConstraints{
            $0.top.equalTo(self.line1.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
        }
        self.line2.snp.makeConstraints{
            $0.top.equalTo(self.interestTopicButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
            $0.height.equalTo(1)
        }
        self.alarmButton.snp.makeConstraints{
            $0.top.equalTo(self.line2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
        }
        self.line3.snp.makeConstraints{
            $0.top.equalTo(self.alarmButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
            $0.height.equalTo(1)
        }
        self.accountButton.snp.makeConstraints{
            $0.top.equalTo(self.line3.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
        }
    }
    
//MARK: - Target
    func addTarget(){

        
        let followerFollowingBtn = UITapGestureRecognizer(target: self, action: #selector(didClickFollowerFollowingView))
        followerFollowingView.isUserInteractionEnabled = true
        followerFollowingView.addGestureRecognizer(followerFollowingBtn)
    
        let moreProfileBtn = UITapGestureRecognizer(target: self, action: #selector(didClickMoreProfileView))
        moreProfileButton.isUserInteractionEnabled = true
        moreProfileButton.addGestureRecognizer(moreProfileBtn)
    }
    
}
