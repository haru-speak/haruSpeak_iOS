//
//  FollowerCell.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/30.
//

import UIKit
import Then
import SnapKit

final class FollowerCell: UICollectionViewCell {
//MARK: - Properties
    static let identifier = "FollowerCell"
    
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
    let crossFollowImage = UIImageView().then{
        $0.image = UIImage(named: "crossfollow")?.withRenderingMode(.alwaysOriginal)
        $0.isHidden = false
    }
    let deleteButton = UIButton().then{
        $0.setTitle("삭제", for: .normal)
        $0.backgroundColor = .systemGray6
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
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
        self.addSubview(self.crossFollowImage)
        self.addSubview(self.deleteButton)
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
        self.deleteButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-15)
            $0.width.equalTo(51)
            $0.height.equalTo(24)
        }
        self.crossFollowImage.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(self.deleteButton.snp.leading).offset(-9)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
    }
//MARK: - AddTarget
    private func addTarget(){
        
    }
}
