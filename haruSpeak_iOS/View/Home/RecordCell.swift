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
    
    let playButton = UIButton(type: .system).then{
        $0.setImage(UIImage(named: "play")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    let title = UILabel().then{
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
        $0.image = UIImage(named: "heart.fill")?.withRenderingMode(.alwaysOriginal)
    }
    
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
        self.addSubview(self.playButton)
        self.addSubview(self.title)
        self.addSubview(self.view1)
        view1.addSubview(self.like)
        view1.addSubview(self.likeLabel)
        view1.addSubview(self.comment)
        view1.addSubview(self.commentLabel)
        self.addSubview(self.heart)
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
        
        
    }
    
    
    
    //MARK: - AddTarget
    private func addTarget(){
        
    }
}
