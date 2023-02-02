//
//  FollowerFollowingViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/30.
//

import Foundation
import UIKit
import SnapKit
import Then

class FollowerFollowingViewController: UIViewController, MyPageTabbarProtocol{
    
    func sendStringTab(data: String) {
        print(data)
        
        if data == "Follower"{
            self.followerCollectionView.isHidden = false
            self.followingCollectionView.isHidden = true
            DispatchQueue.main.async {
                self.followerCollectionView.reloadData()
                self.view.layoutIfNeeded()
            }
        }else{
            self.followerCollectionView.isHidden = true
            self.followingCollectionView.isHidden = false
            DispatchQueue.main.async {
                self.followingCollectionView.reloadData()
                self.view.layoutIfNeeded()
            }
        }
    }
    
    //MARK: - DatsSource
    //FOLLOWER
        var userPictureArray = [String]()
        var userNameArray = [String]()
        var userFollowerArray = [String]()
        var userFollowingArray = [String]()
        var crossFollowArray = [Bool]()
    //FOLLOWING
        var followinguserPictureArray = [String]()
        var followinguserNameArray = [String]()
        var followinguserFollowerArray = [String]()
        var followinguserFollowingArray = [String]()
        var followingStarArray = [Bool]()
        var followingFollowingArray = [Bool]()
    
    
        func DataSourceSet(){
            userPictureArray.append(contentsOf: ["mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage"])
            userNameArray.append(contentsOf: ["데이", "연", "동동", "나단", "무유", "우기", "채드"])
            userFollowerArray.append(contentsOf: ["5", "2", "8", "9", "15", "13", "20"])
            userFollowingArray.append(contentsOf: ["3", "8", "2", "3", "5", "1", "9"])
            crossFollowArray.append(contentsOf: [true, true, false, false, true, false, false])
                    DispatchQueue.main.async {
                        self.followerCollectionView.reloadData()
                        self.followingCollectionView.reloadData()
                    }
            
            followinguserPictureArray.append(contentsOf: ["mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage", "mypage"])
            followinguserNameArray.append(contentsOf: ["데이", "연", "동동", "나단", "무유", "우기", "채드", "연", "동동", "나단", "무유", "우기", "채드", "연", "동동", "나단", "무유", "우기", "채드"])
            followinguserFollowerArray.append(contentsOf: ["5", "2", "8", "9", "15", "13", "20", "2", "8", "9", "15", "13", "20", "2", "8", "9", "15", "13", "20"])
            followinguserFollowingArray.append(contentsOf: ["3", "8", "2", "3", "5", "1", "9", "8", "2", "3", "5", "1", "9", "8", "2", "3", "5", "1", "9"])
            followingStarArray.append(contentsOf: [true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false])
            followingFollowingArray.append(contentsOf: [true, true, true, false, true, false, true, false, false, false, false, true, false, true, false, false, true, false, true])
                    DispatchQueue.main.async {
                        self.followerCollectionView.reloadData()
                        self.followingCollectionView.reloadData()
                    }

        }
    
    
    //MARK: - Properties
    let backButton = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let tabbar = CustomTabbarMyPage()
    let searchBar = UISearchBar().then{
        $0.placeholder = "검색어를 입력하세요"
    }
    var followerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.identifier)
        $0.backgroundColor = .white
        $0.isHidden = false
    }
    var followingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(FollowingCell.self, forCellWithReuseIdentifier: FollowingCell.identifier)
        $0.backgroundColor = .white
        $0.isHidden = true
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        DataSourceSet()
        self.followerCollectionView.delegate = self
        self.followerCollectionView.dataSource = self
        
        self.followingCollectionView.delegate = self
        self.followingCollectionView.dataSource = self
        tabbar.delegate = self
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true;
    }
    
    //MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.tabbar)
        self.view.addSubview(self.searchBar)
        self.view.addSubview(self.followerCollectionView)
        self.view.addSubview(self.followingCollectionView)
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
        self.tabbar.snp.makeConstraints{
            $0.top.equalTo(self.backButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        self.searchBar.snp.makeConstraints{
            $0.top.equalTo(self.tabbar.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        self.followerCollectionView.snp.makeConstraints{
            $0.top.equalTo(self.searchBar.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-50)
        }
        self.followingCollectionView.snp.makeConstraints{
            $0.top.equalTo(self.searchBar.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-50)
        }
    }
    
    //MARK: - Target
    func addTarget(){
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(didClickBack))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(backBtn)
    }
}


//CollectionVIew
extension FollowerFollowingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.followerCollectionView{
            return userPictureArray.count
        }else{
            return followinguserPictureArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.followerCollectionView{
            let Followercell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.identifier, for: indexPath) as! FollowerCell
            
            Followercell.profilePhoto.image = UIImage(named: "\(userPictureArray[indexPath.row])")?.withRenderingMode(.alwaysOriginal)
            Followercell.name.text = userNameArray[indexPath.row]
            Followercell.followerNumber.text = userFollowerArray[indexPath.row]
            Followercell.followingNumber.text = userFollowingArray[indexPath.row]
            Followercell.crossFollowImage.isHidden = crossFollowArray[indexPath.row]
            
            return Followercell
        }else{
            let Followingcell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowingCell.identifier, for: indexPath) as! FollowingCell
            
            Followingcell.profilePhoto.image = UIImage(named: "\(followinguserPictureArray[indexPath.row])")?.withRenderingMode(.alwaysOriginal)
            Followingcell.name.text = followinguserNameArray[indexPath.row]
            Followingcell.followerNumber.text = followinguserFollowerArray[indexPath.row]
            Followingcell.followingNumber.text = followinguserFollowingArray[indexPath.row]
            if followingStarArray[indexPath.row] == true{
                Followingcell.starImage.image = UIImage(named: "star.fill")?.withRenderingMode(.alwaysOriginal)
            }else{
                Followingcell.starImage.image = UIImage(named: "star")?.withRenderingMode(.alwaysOriginal)
            }
            if followingFollowingArray[indexPath.row] == true{
                Followingcell.followButton.backgroundColor = .mainColor
                Followingcell.followButton.setTitleColor(UIColor.white, for: .normal)
                Followingcell.followButton.setTitle("팔로우", for: .normal)
            }else{
                Followingcell.followButton.backgroundColor = .systemGray6
                Followingcell.followButton.setTitleColor(UIColor.black, for: .normal)
                Followingcell.followButton.setTitle("팔로잉", for: .normal)
            }
            
            
            
            
            return Followingcell
        }

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}
extension FollowerFollowingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.view.frame.width , height: 70)
    }
}
