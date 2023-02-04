//
//  FollowingCell.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/30.
//

import UIKit
import Then
import SnapKit

final class FollowingCell: UICollectionViewCell {
//MARK: - Properties
    static let identifier = "FollowingCell"
    
    let profilePhoto = UIImageView().then{
        $0.image = UIImage(named: "mypage")?.withRenderingMode(.alwaysOriginal)
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let name = UILabel().then{
        $0.text = "나단"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
        $0.textColor = .black
    }
    let followerFollowingView = UIView().then{
        $0.backgroundColor = .white
    }
    let followerLabel = UILabel().then{
        $0.text = "팔로워"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let followingLabel = UILabel().then{
        $0.text = "팔로잉"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let seperateView = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    let followerNumber = UILabel().then{
        $0.text = "3"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let followingNumber = UILabel().then{
        $0.text = "10"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let starImage = UIImageView().then{
        $0.image = UIImage(named: "star")?.withRenderingMode(.alwaysOriginal)
    }
    let followButton = UIButton().then{
        $0.setTitle("팔로잉", for: .normal)
        $0.backgroundColor = .systemGray6
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
    }
    let ellipsisImage = UIImageView().then{
        $0.image = UIImage(named: "ellipsis")?.withRenderingMode(.alwaysOriginal)
    }
    
//MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupLayout()
        self.addTarget()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Selector
    @objc func didClickStarButton(sender: UITapGestureRecognizer){
        print("didClickStarButton")
        if starImage.image == UIImage(named: "star")?.withRenderingMode(.alwaysOriginal){
            starImage.image = UIImage(named: "star.fill")?.withRenderingMode(.alwaysOriginal)
        }else{
            starImage.image = UIImage(named: "star")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    @objc private func didClickFollow(_ button: UIButton) {
        print("didClickFollow")
        if followButton.titleLabel?.text == "팔로잉"{
            followButton.backgroundColor = .mainColor
            followButton.setTitle("팔로우", for: .normal)
            followButton.setTitleColor(UIColor.white, for: .normal)
        }else{
            followButton.backgroundColor = .systemGray6
            followButton.setTitle("팔로잉", for: .normal)
            followButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    

//MARK: - addSubView
    private func setupView(){
        self.addSubview(self.profilePhoto)
        self.addSubview(self.name)
        self.addSubview(self.followerFollowingView)
        self.followerFollowingView.addSubview(self.followerLabel)
        self.followerFollowingView.addSubview(self.followingLabel)
        self.followerFollowingView.addSubview(self.seperateView)
        self.followerFollowingView.addSubview(self.followerNumber)
        self.followerFollowingView.addSubview(self.followingNumber)
        self.addSubview(self.starImage)
        self.addSubview(self.followButton)
        self.addSubview(self.ellipsisImage)
        
    }
//MARK: - layout
    private func setupLayout(){
        self.profilePhoto.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(38)
            $0.centerY.equalToSuperview()
        }
        self.name.snp.makeConstraints{
            $0.top.equalToSuperview().offset(13.5)
            $0.leading.equalTo(self.profilePhoto.snp.trailing).offset(12)
            $0.height.equalTo(20)
            $0.width.equalTo(100)
        }
        self.followerFollowingView.snp.makeConstraints{
            $0.top.equalTo(self.name.snp.bottom).offset(3)
            $0.leading.equalTo(self.profilePhoto.snp.trailing).offset(12)
            $0.height.equalTo(20)
            $0.width.equalTo(100)
        }
        self.followerLabel.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalTo(self.followerNumber.snp.leading).offset(-5)
        }
        self.followerNumber.snp.makeConstraints{
            $0.trailing.equalTo(self.seperateView.snp.leading).offset(-5)
            $0.top.bottom.equalToSuperview()
        }
        self.seperateView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(1)
            $0.height.equalTo(10)
        }
        self.followingLabel.snp.makeConstraints{
            $0.leading.equalTo(self.seperateView.snp.trailing).offset(5)
            $0.top.bottom.equalToSuperview()
        }
        self.followingNumber.snp.makeConstraints{
            $0.leading.equalTo(self.followingLabel.snp.trailing).offset(5)
            $0.top.bottom.equalToSuperview()
        }
        self.ellipsisImage.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20.5)
            $0.width.equalTo(16.5)
            $0.height.equalTo(3)
        }
        self.followButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(self.ellipsisImage.snp.leading).offset(-14)
            $0.width.equalTo(62)
            $0.height.equalTo(24)
        }
        self.starImage.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(self.followButton.snp.leading).offset(-16.25)
            $0.width.equalTo(19.75)
            $0.height.equalTo(18.81)
        }
    }
//MARK: - AddTarget
    private func addTarget(){
        let starBtn = UITapGestureRecognizer(target: self, action: #selector(didClickStarButton))
        starImage.isUserInteractionEnabled = true
        starImage.addGestureRecognizer(starBtn)
        
        self.followButton.addTarget(self, action: #selector(didClickFollow), for: .touchUpInside)
    }
}
