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
    let hideImg = UIImageView().then{
        $0.image = UIImage(named: "nomsg")?.withRenderingMode(.alwaysOriginal)
        $0.isHidden = true
    }
    var chattingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(ChattingCell.self, forCellWithReuseIdentifier: ChattingCell.identifier)
        $0.backgroundColor = .white
    }
    let line = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    var collectionViewindex = 0
    
    
    //CollectionView
    var ChattingCellNameArray = [String]()
    var ChattingCellProfileImgArray = [String]()
    var ChattingCellDateArray = [String]()
    var ChattingCellTimeArray = [String]()
    var ChattingCellContentArray = [String]()
    var ChattingCellNumArray = [String]()
    
    
    func dataSourceSet(){
        ChattingCellNameArray.append(contentsOf: ["연", "채드", "나단", "무유", "데이"])
        ChattingCellProfileImgArray.append(contentsOf: ["mypage", "mypage", "mypage", "mypage", "mypage"])
        ChattingCellDateArray.append(contentsOf: ["어제", "어제", "1월 2일", "12월 27일", "12월 13일"])
        ChattingCellTimeArray.append(contentsOf: ["오후 3시 52분", "오후 3시 52분", "오후 3시 52분", "오후 3시 52분", "오후 3시 52분"])
        ChattingCellContentArray.append(contentsOf: ["과제 늦지않게 제출해주세요~!", "피드백 감사합니다! 다음주에 봬요 :)", "넵 초대 메시지 보내드릴게요!", "이번주에 참여 가능합니다~", "데이님이 스터디룸 초대장을 보냈습니다!"])
        ChattingCellNumArray.append(contentsOf: ["3", "1", "1", "3", "2"])

        DispatchQueue.main.async {
            self.chattingCollectionView.reloadData()
            self.checkChattingCellCount()
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        checkChattingCellCount()
        dataSourceSet()
        
        self.chattingCollectionView.delegate = self
        self.chattingCollectionView.dataSource = self
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true;
    }
    
//MARK: - Check Cell isEmpty
    func checkChattingCellCount(){
        let countRecordCell = Int(ChattingCellNameArray.count)
        if countRecordCell == 0{
            hideImg.isHidden = false
        }else{
            hideImg.isHidden = true
        }
    }

    //MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.messageLabel)
        self.view.addSubview(self.chattingCollectionView)
        self.view.addSubview(self.line)
        self.view.addSubview(self.hideImg)
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
        self.chattingCollectionView.snp.makeConstraints {
            $0.trailing.leading.bottom.equalToSuperview()
            $0.top.equalToSuperview().offset(92)
        }
        self.line.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(92)
            $0.height.equalTo(1)
        }
        self.hideImg.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(269)
            $0.height.equalTo(238)
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
extension MessageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ChattingCellNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let Ccell = collectionView.dequeueReusableCell(withReuseIdentifier: ChattingCell.identifier, for: indexPath) as! ChattingCell
        Ccell.name.text = self.ChattingCellNameArray[indexPath.row]
        Ccell.profileimg.image = UIImage(named: self.ChattingCellProfileImgArray[indexPath.row])?.withRenderingMode(.alwaysOriginal)
        Ccell.date.text = self.ChattingCellDateArray[indexPath.row]
        Ccell.time.text = self.ChattingCellTimeArray[indexPath.row]
        Ccell.content.text = self.ChattingCellContentArray[indexPath.row]
        Ccell.num.text = self.ChattingCellNumArray[indexPath.row]
        return Ccell
    }
   
}

extension MessageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.view.frame.width , height: 83)
        }
        
    }
    

