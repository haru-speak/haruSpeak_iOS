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

class FollowerFollowingViewController: UIViewController{
    //MARK: - Datasource
    
    
    
    //MARK: - Properties
    let backButton = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let tabbar = CustomTabbarMyPage()
    let searchBar = UISearchBar().then{
        $0.placeholder = "검색어를 입력하세요"
    }
    let followerFollowingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(RecordCell.self, forCellWithReuseIdentifier: RecordCell.identifier)
        $0.backgroundColor = .white
    }
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
        self.view.addSubview(self.searchBar)
        self.view.addSubview(self.followerFollowingCollectionView)
        
        self.followerFollowingCollectionView.delegate = self
        self.followerFollowingCollectionView.dataSource = self
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
        self.followerFollowingCollectionView.snp.makeConstraints{
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
        let Rcell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordCell.identifier, for: indexPath) as! RecordCell
        return Rcell
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
