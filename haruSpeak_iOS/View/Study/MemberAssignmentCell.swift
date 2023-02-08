//
//  MemberAssignmentCell.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/07.
//

import Foundation
import SnapKit
import Then
import UIKit

final class MemberAssignmentCell: UICollectionViewCell {
//MARK: - Properties
    static let identifier = "MemberAssignmentCell"
    
    let playButton = UIImageView().then{
        $0.image = UIImage(named: "play.blue")?.withRenderingMode(.alwaysOriginal)
    }
    let title = UILabel().then{
        $0.text = "애니메이션 좋아해"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:16)
    }
    let content = UILabel().then{
        $0.text = "My room is tiny. When I say tiny I …"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.textColor = .lightGray
    }
    let view1 = UIView().then{_ in
        
    }
    let like = UIImageView().then{
        $0.image = UIImage(named: "heart.fill")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .englishTag
    }
    let likeLabel = UILabel().then{
        $0.text = "2"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.textColor = .englishTag
    }
    let comment = UIImageView().then{
        $0.image = UIImage(named: "chatblue")?.withRenderingMode(.alwaysOriginal)
    }
    let commentLabel = UILabel().then{
        $0.text = "0"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.textColor = .mainColor
    }
    let line1 = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    let time = UILabel().then{
        $0.text = "15:20"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.textColor = .lightGray
    }
    let line = UIView().then{
        $0.backgroundColor = UIColor.systemGray4
    }
    let profileImage = UIImageView().then{
        $0.backgroundColor = .lightGray
        $0.roundCorners(cornerRadius: 4, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    
//MARK: - ButtonArray
    let playButtonArray = ["play.blue","pause.blue"]
    var playindex = 0
    
    
    
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
    @objc func didClickPlay(sender: UITapGestureRecognizer) {
        self.playindex = (self.playindex >= self.playButtonArray.count-1) ? 0 : self.playindex+1
        self.playButton.image = UIImage(named:playButtonArray[playindex])
        if playindex == 0{
            print("clickPause")
        }else{
            print("clickPlay")
        }
        
        }
    
    //MARK: - addSubView
    private func setupView(){
        self.addSubview(self.profileImage)
        self.addSubview(self.playButton)
        self.addSubview(self.title)
        self.addSubview(self.content)
        self.addSubview(self.view1)
        view1.addSubview(self.like)
        view1.addSubview(self.likeLabel)
        view1.addSubview(self.comment)
        view1.addSubview(self.commentLabel)
        view1.addSubview(self.line1)
        view1.addSubview(self.time)
        self.addSubview(self.line)
    }
    
    //MARK: - layout
    private func setupLayout(){
        self.profileImage.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(29)
            $0.centerY.equalToSuperview()
//            $0.top.equalToSuperview().offset(26)
            $0.width.height.equalTo(40)
        }
        self.playButton.snp.makeConstraints{
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(32)
        }
        self.title.snp.makeConstraints{
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(63)
            $0.top.equalToSuperview().offset(21)
        }
        self.content.snp.makeConstraints{
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(63)
            $0.top.equalToSuperview().offset(43)
        }
        //view1 start
        self.view1.snp.makeConstraints{
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(63)
            $0.top.equalTo(self.content.snp.bottom).offset(12)
        }
        self.like.snp.makeConstraints{
            $0.leading.equalTo(self.view1.snp.leading).offset(0)
            $0.centerY.equalTo(self.view1)
            $0.width.equalTo(13)
            $0.height.equalTo(11)
        }
        self.likeLabel.snp.makeConstraints{
            $0.leading.equalTo(self.like.snp.trailing).offset(5)
            $0.centerY.equalTo(self.view1)
        }
        self.comment.snp.makeConstraints{
            $0.leading.equalTo(self.likeLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(self.view1)
            $0.width.height.equalTo(13)
        }
        self.commentLabel.snp.makeConstraints{
            $0.leading.equalTo(self.comment.snp.trailing).offset(5)
            $0.centerY.equalTo(self.view1)
        }
        self.line1.snp.makeConstraints{
            $0.centerY.equalTo(self.view1)
            $0.height.equalTo(9)
            $0.width.equalTo(1)
            $0.leading.equalTo(self.commentLabel.snp.trailing).offset(10)
        }
        self.time.snp.makeConstraints{
            $0.leading.equalTo(self.line1.snp.trailing).offset(10)
            $0.centerY.equalTo(self.view1)
        }
        
        //view1 end
        
        self.line.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.size.height.equalTo(1)
            $0.leading.equalToSuperview().offset(13)
            $0.trailing.equalToSuperview().offset(-13)
        }
        
        
    }
    
    //MARK: - AddTarget
    private func addTarget(){
        let playBtn = UITapGestureRecognizer(target: self, action: #selector(didClickPlay))
        playButton.isUserInteractionEnabled = true
        playButton.addGestureRecognizer(playBtn)
        
        
        }
    }
