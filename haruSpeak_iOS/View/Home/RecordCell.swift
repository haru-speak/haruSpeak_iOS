//
//  RecordCell.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/12.
//

import UIKit

final class RecordCell: UICollectionViewCell {
//MARK: - Properties
    static let identifier = "RecordCell"
    
    let playButton = UIImageView().then{
        $0.image = UIImage(named: "play.blue")?.withRenderingMode(.alwaysOriginal)
    }
    var title = UILabel().then{
        $0.text = "Nothing beats \"AboutTime\""
        $0.font = .appleSDGothicNeo(size: 18)
    }
    let view1 = UIView().then{_ in
        
    }
    let like = UIImageView().then{
        $0.image = UIImage(named: "like")?.withRenderingMode(.alwaysOriginal)
    }
    let likeLabel = UILabel().then{
        $0.text = "12"
        $0.font = .appleSDGothicNeo(size: 12)
        $0.textColor = .lightGray
    }
    let comment = UIImageView().then{
        $0.image = UIImage(named: "comment")?.withRenderingMode(.alwaysOriginal)
    }
    let commentLabel = UILabel().then{
        $0.text = "3"
        $0.font = .appleSDGothicNeo(size: 12)
        $0.textColor = .lightGray
    }
    let heart = UIImageView().then{
        $0.image = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
    }
    let line = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
//MARK: - ButtonArray
    let playButtonArray = ["play.blue","pause.blue"]
    var playindex = 0
    let heartButtonArray = ["heart","heart.fill"]
    var heartindex = 0
    
    
    
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
    @objc func didClickheart(sender: UITapGestureRecognizer) {
        self.heartindex = (self.heartindex >= self.heartButtonArray.count-1) ? 0 : self.heartindex+1
        self.heart.image = UIImage(named:heartButtonArray[heartindex])
        if self.heartindex == 0{
            print("clickUnlike")
        }else{
            print("clickLike")
        }
        }
    
    //MARK: - addSubView
    private func setupView(){
        self.addSubview(self.playButton)
        self.addSubview(self.title)
        self.addSubview(self.view1)
        view1.addSubview(self.like)
        view1.addSubview(self.likeLabel)
        view1.addSubview(self.comment)
        view1.addSubview(self.commentLabel)
        self.addSubview(self.heart)
        self.addSubview(self.line)
    }
    
    //MARK: - layout
    private func setupLayout(){
        self.playButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(29)
            $0.top.equalToSuperview().offset(20)
            $0.width.height.equalTo(32)
        }
        self.title.snp.makeConstraints{
            $0.leading.equalTo(self.playButton.snp.trailing).offset(22)
            $0.top.equalToSuperview().offset(20)
        }
        //view1 start
        self.view1.snp.makeConstraints{
            $0.leading.equalTo(self.playButton.snp.trailing).offset(22)
            $0.top.equalTo(self.title.snp.bottom).offset(8)
        }
        self.like.snp.makeConstraints{
            $0.leading.equalTo(self.view1.snp.leading).offset(0)
            $0.centerY.equalTo(self.view1)
        }
        self.likeLabel.snp.makeConstraints{
            $0.leading.equalTo(self.like.snp.trailing).offset(5)
            $0.centerY.equalTo(self.view1)
        }
        self.comment.snp.makeConstraints{
            $0.leading.equalTo(self.likeLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(self.view1)
        }
        self.commentLabel.snp.makeConstraints{
            $0.leading.equalTo(self.comment.snp.trailing).offset(5)
            $0.centerY.equalTo(self.view1)
        }
        
        //view1 end
        self.heart.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-33)
            $0.top.equalToSuperview().offset(20)
        }
        
        self.line.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(0)
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
        
        let heartBtn = UITapGestureRecognizer(target: self, action: #selector(didClickheart))
        heart.isUserInteractionEnabled = true
        heart.addGestureRecognizer(heartBtn)
        
        }
    }

