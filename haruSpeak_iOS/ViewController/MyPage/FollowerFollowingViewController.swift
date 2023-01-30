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
    
    //MARK: - Datasource
    
    
    
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.followerCollectionView{
            let Followercell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.identifier, for: indexPath) as! FollowerCell
            return Followercell
        }else{
            let Followingcell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowingCell.identifier, for: indexPath) as! FollowingCell
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
