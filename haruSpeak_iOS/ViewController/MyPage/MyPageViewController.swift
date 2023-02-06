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
    let haruSpeakAccessToken = UserDefaults.standard.string(forKey: "haruSpeakAccessToken")
    let haruSpeakRefreshToken = UserDefaults.standard.string(forKey: "haruSpeakRefreshToken")
    let userEmail = UserDefaults.standard.string(forKey: "userEmail")
    let userMemberID = UserDefaults.standard.string(forKey: "userMemberID")
    let newbieBool = UserDefaults.standard.string(forKey: "newbieBool")
    let userNickname = UserDefaults.standard.string(forKey: "userNickname")
    let KakaoAccessCode = UserDefaults.standard.string(forKey: "KakaoAccessCode")
    
//MARK: - Properties
    let blueView = UIView().then{
        $0.backgroundColor = .mainColor
    }
    let myPageLabel = UILabel().then{
        $0.text = "마이페이지"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.textColor = .white
        $0.numberOfLines = 0
    }
    let scrollView = UIScrollView().then{
        $0.backgroundColor = .mainColor
    }
    let scrollContentView = UIView().then{
        $0.backgroundColor = .systemGray6
    }
    let blueViewScrollable = UIView().then{
        $0.backgroundColor = .mainColor
    }
//Top Profile View
    let profileView = UIView().then{
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let profileImage = UIImageView().then{
        $0.roundCorners(cornerRadius: 35, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.image = UIImage(named: "mypage")?.withRenderingMode(.alwaysOriginal)
        $0.backgroundColor = .white
    }
    let profileName = UILabel().then{
        $0.text = "무유"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 22)
        $0.numberOfLines = 0
    }
    let moreProfileButton = UIImageView().then{
        $0.image = UIImage(named: "moreprofile")?.withRenderingMode(.alwaysOriginal)
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
//Bottom Point View
    let giverLearnerPointView = UIView().then{
        $0.backgroundColor = .systemGray6
    }
    
    
    lazy var learnerView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(PointViewCell.self, forCellWithReuseIdentifier: PointViewCell.identifier)
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    lazy var giverView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(PointViewCell.self, forCellWithReuseIdentifier: PointViewCell.identifier)
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    
    



    let saveButton = UILabel().then{
        $0.text = "찜"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 16)
    }
    let interestTopicButton = UILabel().then{
        $0.text = "관심 주제"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 16)
    }
    let alarmButton = UILabel().then{
        $0.text = "알림"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 16)
    }
    let accountButton = UILabel().then{
        $0.text = "계정"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 16)
    }
    let seperateViewForSettings = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    let noticeButton = UILabel().then{
        $0.text = "공지사항"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 16)
    }
    let inquiryButton = UILabel().then{
        $0.text = "문의하기"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 16)
    }
    let versionButton = UILabel().then{
        $0.text = "버전"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 16)
    }
    let logoutButton = UILabel().then{
        $0.text = "로그아웃"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 16)
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
    let line4 = UIView().then{
        $0.backgroundColor = UIColor.systemGray4
    }
    let line5 = UIView().then{
        $0.backgroundColor = UIColor.systemGray4
    }
    let line6 = UIView().then{
        $0.backgroundColor = UIColor.systemGray4
    }
    let line7 = UIView().then{
        $0.backgroundColor = UIColor.systemGray4
    }
    
//MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        
        self.view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = true;
        
        self.learnerView.delegate = self
        self.learnerView.dataSource = self
        self.giverView.delegate = self
        self.giverView.dataSource = self
        
        collectionViewLayout()
        
        learnerView.decelerationRate = .fast
        learnerView.isPagingEnabled = false
        giverView.decelerationRate = .fast
        giverView.isPagingEnabled = false
        
    }
    
//MARK: - CollectionView Layout
    func collectionViewLayout(){
        if let layout = learnerView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        if let layout = giverView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        let collectionViewLayout: UICollectionViewFlowLayout = {
            let layout = MyPageCustomCollectionViewFlowLayout()
            layout.itemSize = CGSize(width: self.view.bounds.width - 40, height: self.view.bounds.height - 80)
            layout.minimumLineSpacing = 20
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.scrollDirection = .horizontal
            return layout
        }()
        let giverCollectionViewLayout: UICollectionViewFlowLayout = {
            let layout = MyPageCustomCollectionViewFlowLayout()
            layout.itemSize = CGSize(width: self.view.bounds.width - 40, height: self.view.bounds.height - 80)
            layout.minimumLineSpacing = 20
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.scrollDirection = .horizontal
            return layout
        }()
        learnerView.collectionViewLayout = collectionViewLayout
        giverView.collectionViewLayout = giverCollectionViewLayout
    }
    
//MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.blueView)
        self.view.addSubview(self.myPageLabel)
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.scrollContentView)
        self.scrollContentView.addSubview(self.blueViewScrollable)
        self.scrollContentView.addSubview(self.profileView)
        
        self.profileView.addSubview(self.profileImage)
        self.profileView.addSubview(self.profileName)
        self.profileView.addSubview(self.moreProfileButton)
        self.profileView.addSubview(self.followerFollowingView)
        self.followerFollowingView.addSubview(self.followerLabel)
        self.followerFollowingView.addSubview(self.followingLabel)
        self.followerFollowingView.addSubview(self.seperateView)
        self.followerFollowingView.addSubview(self.followerNumber)
        self.followerFollowingView.addSubview(self.followingNumber)
        self.profileView.addSubview(self.profileObjective)
        self.profileView.addSubview(self.tagViewEng)
        self.profileView.addSubview(self.tagViewKor)
        self.profileView.addSubview(self.tagViewObjective)
        self.tagViewEng.addSubview(self.tagViewEngLabel)
        self.tagViewKor.addSubview(self.tagViewKorLabel)
        self.tagViewObjective.addSubview(self.tagViewObjectiveLabel)
        
        self.scrollContentView.addSubview(self.giverLearnerPointView)
        self.giverLearnerPointView.addSubview(self.giverView)
        self.giverLearnerPointView.addSubview(self.learnerView)

        
        self.scrollContentView.addSubview(self.saveButton)
        self.scrollContentView.addSubview(self.interestTopicButton)
        self.scrollContentView.addSubview(self.alarmButton)
        self.scrollContentView.addSubview(self.accountButton)
        self.scrollContentView.addSubview(self.seperateViewForSettings)
        self.scrollContentView.addSubview(self.noticeButton)
        self.scrollContentView.addSubview(self.inquiryButton)
        self.scrollContentView.addSubview(self.versionButton)
        self.scrollContentView.addSubview(self.logoutButton)
        self.scrollContentView.addSubview(self.line1)
        self.scrollContentView.addSubview(self.line2)
        self.scrollContentView.addSubview(self.line3)
        self.scrollContentView.addSubview(self.line4)
        self.scrollContentView.addSubview(self.line5)
        self.scrollContentView.addSubview(self.line6)
        self.scrollContentView.addSubview(self.line7)
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
    @objc func didClickLogOut(sender: UITapGestureRecognizer){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
        
        
        let VC = OnboardingViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true)
    }
    
   
    
//MARK: - Layout
    func layout(){
        self.blueView.snp.makeConstraints{
            $0.top.trailing.leading.equalToSuperview().offset(0)
            $0.height.equalTo(90)
        }
        self.myPageLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(62)
        }
        self.scrollView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview().offset(0)
            $0.top.equalTo(self.blueView.snp.bottom).offset(0)
        }
        self.scrollContentView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
        }
        self.blueViewScrollable.snp.makeConstraints{
            $0.top.trailing.leading.equalToSuperview().offset(0)
            $0.height.equalTo(36)
        }
        self.profileView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.blueViewScrollable.snp.top)
            $0.height.equalTo(176)
            $0.leading.equalToSuperview().offset(20)
        }
        self.profileImage.snp.makeConstraints{
            $0.height.width.equalTo(70)
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalToSuperview().offset(21)
        }
        self.profileName.snp.makeConstraints{
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(18)
        }
        self.moreProfileButton.snp.makeConstraints{
            $0.leading.equalTo(self.profileName.snp.trailing).offset(10)
            $0.centerY.equalTo(self.profileName)
            $0.width.equalTo(7.43)
            $0.height.equalTo(13)
        }
        self.followerFollowingView.snp.makeConstraints{
            $0.top.equalTo(self.moreProfileButton.snp.bottom).offset(5)
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(18)
            $0.width.equalTo(146)
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
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(18)
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
        self.giverLearnerPointView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(self.profileView.snp.bottom).offset(20)
            $0.height.equalTo(141)
        }
        self.learnerView.snp.makeConstraints{
            $0.top.bottom.leading.equalToSuperview()
            $0.width.equalTo(171)
        }
        self.giverView.snp.makeConstraints{
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(self.learnerView.snp.trailing).offset(12)
        }
        self.saveButton.snp.makeConstraints{
            $0.top.equalTo(self.giverLearnerPointView.snp.bottom).offset(23)
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
        self.line4.snp.makeConstraints{
            $0.top.equalTo(self.accountButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        self.seperateViewForSettings.snp.makeConstraints{
            $0.top.equalTo(self.line4.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(10)
        }
        self.noticeButton.snp.makeConstraints{
            $0.top.equalTo(self.seperateViewForSettings.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
        }
        self.line5.snp.makeConstraints{
            $0.top.equalTo(self.noticeButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
            $0.height.equalTo(1)
        }
        self.inquiryButton.snp.makeConstraints{
            $0.top.equalTo(self.line5.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
        }
        self.line6.snp.makeConstraints{
            $0.top.equalTo(self.inquiryButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
            $0.height.equalTo(1)
        }
        self.versionButton.snp.makeConstraints{
            $0.top.equalTo(self.line6.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
        }
        self.line7.snp.makeConstraints{
            $0.top.equalTo(self.versionButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
            $0.height.equalTo(1)
        }
        self.logoutButton.snp.makeConstraints{
            $0.top.equalTo(self.line7.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().offset(-31)
            $0.bottom.equalToSuperview().offset(-30)
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
        
        let profileLabelBtn = UITapGestureRecognizer(target: self, action: #selector(didClickMoreProfileView))
        profileName.isUserInteractionEnabled = true
        profileName.addGestureRecognizer(profileLabelBtn)
        
        let LogOutBtn = UITapGestureRecognizer(target: self, action: #selector(didClickLogOut))
        logoutButton.isUserInteractionEnabled = true
        logoutButton.addGestureRecognizer(LogOutBtn)
    }
    
}

//MARK: - SetupCollectionView

// CollectionView
extension MyPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.learnerView{
            let learnerCell = collectionView.dequeueReusableCell(withReuseIdentifier: PointViewCell.identifier, for: indexPath) as! PointViewCell
            
            if indexPath.row == 0{
                learnerCell.page1Dot.alpha = 1
                learnerCell.page2Dot.alpha = 0.5
                
                learnerCell.mainLabel.text = "이번주에 지급받을 \nLearner 포인트"
                learnerCell.pointLabel.text = "1080P"
                learnerCell.percentageLabel.isHidden = true
                
            }else{
                learnerCell.page1Dot.alpha = 0.5
                learnerCell.page2Dot.alpha = 1
                
                learnerCell.mainLabel.text = "내가 모은 \n총 Learner 포인트"
                learnerCell.pointLabel.text = "1080P"
                learnerCell.percentageLabel.isHidden = false
                learnerCell.percentageLabel.text = "상위 68%"
            }
            
            let attributedStr = NSMutableAttributedString(string: learnerCell.mainLabel.text!)
            attributedStr.addAttribute(.foregroundColor, value: learnerCell.changeColor, range: (learnerCell.mainLabel.text! as NSString).range(of: "\(learnerCell.changeColorText)"))
            learnerCell.mainLabel.attributedText = attributedStr
            learnerCell.changeColorText = "Learner"
            learnerCell.changeColor = UIColor.englishTag
            
            return learnerCell
        }else{
            let giverCell = collectionView.dequeueReusableCell(withReuseIdentifier: PointViewCell.identifier, for: indexPath) as! PointViewCell
            
            if indexPath.row == 0{
                giverCell.page1Dot.alpha = 1
                giverCell.page2Dot.alpha = 0.5
                
                giverCell.mainLabel.text = "이번주에 지급받을 \nGiver 포인트"
                giverCell.pointLabel.text = "60P"
                giverCell.percentageLabel.isHidden = true
            }else{
                giverCell.page1Dot.alpha = 0.5
                giverCell.page2Dot.alpha = 1
                
                giverCell.mainLabel.text = "내가 모은 \n총 Giver 포인트"
                giverCell.pointLabel.text = "1080P"
                giverCell.percentageLabel.isHidden = false
                giverCell.percentageLabel.text = "상위 68%"
            }
            
            giverCell.page1Dot.backgroundColor = .koreanTag
            giverCell.page2Dot.backgroundColor = .koreanTag
            giverCell.rightSideColor.backgroundColor = .koreanTag
            giverCell.changeColorText = "Giver"
            giverCell.changeColor = UIColor.koreanTag
            
            let attributedStr = NSMutableAttributedString(string: giverCell.mainLabel.text!)
            attributedStr.addAttribute(.foregroundColor, value: giverCell.changeColor, range: (giverCell.mainLabel.text! as NSString).range(of: "\(giverCell.changeColorText)"))
            giverCell.mainLabel.attributedText = attributedStr
            
            return giverCell
        }

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    //section 사이의 공간을 제거
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: learnerView.bounds.width , height: learnerView.bounds.height)
        
    }
    
}
