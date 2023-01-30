//
//  CommentCell.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/24.
//


import UIKit

final class CommentCell: UICollectionViewCell {
    
    
    
    
    
    
//MARK: - Properties
    static let identifier = "RecordCell"
    
    let profileImage = UIImageView().then{
        $0.backgroundColor = .lightGray
    }
    let comment = UILabel().then{
        $0.text = "Nothing beats About time"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
    }
    let date = UILabel().then{
        $0.text = "01/10 13:41"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let thumbsupImage = UIImageView().then{
        $0.image = UIImage(named: "thumbsup.blue")?.withRenderingMode(.alwaysOriginal)
    }
    let countTumbsup = UILabel().then{
        $0.text = "2"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .mainColor
    }
    let commentImage = UIImageView().then{
        $0.image = UIImage(named: "comment.unfill")?.withRenderingMode(.alwaysOriginal)
    }
    let divideView = UIView().then{
        $0.backgroundColor = .lightGray
    }
    let clickThumbsup = UIImageView().then{
        $0.image = UIImage(named: "thumbsup")?.withRenderingMode(.alwaysOriginal)
    }
    let line = UIView().then{
        $0.backgroundColor = UIColor.systemGray5
    }
 
    
//MARK: - ButtonArray
    let thumbsupButtonArray = ["thumbsup","thumbsup.blue"]
    var thumbsupindex = 0
    
    
    
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
    @objc func didClickThumbsup(sender: UITapGestureRecognizer) {
        self.thumbsupindex = (self.thumbsupindex >= self.thumbsupButtonArray.count-1) ? 0 : self.thumbsupindex+1
        self.clickThumbsup.image = UIImage(named:thumbsupButtonArray[thumbsupindex])
        if self.thumbsupindex == 0{
            print("clickUnlike")
        }else{
            print("clickLike")
        }
        }
    //MARK: - addSubView
    private func setupView(){
        self.addSubview(self.profileImage)
        self.addSubview(self.comment)
        self.addSubview(self.date)
        self.addSubview(self.thumbsupImage)
        self.addSubview(self.countTumbsup)
        self.addSubview(self.commentImage)
        self.addSubview(self.divideView)
        self.addSubview(self.clickThumbsup)
        self.addSubview(self.line)
        
    }
    
    //MARK: - layout
    private func setupLayout(){
        self.profileImage.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(34)
            $0.top.equalToSuperview().offset(22)
            $0.size.width.height.equalTo(35)
        }
        self.comment.snp.makeConstraints{
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(13)
            $0.top.equalToSuperview().offset(22)
        }
        self.date.snp.makeConstraints{
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(13)
            $0.top.equalTo(self.comment.snp.bottom).offset(3)
        }
        self.thumbsupImage.snp.makeConstraints{
            $0.leading.equalTo(self.date.snp.trailing).offset(5)
            $0.top.equalTo(self.comment.snp.bottom).offset(5)
        }
        self.countTumbsup.snp.makeConstraints{
            $0.leading.equalTo(self.thumbsupImage.snp.trailing).offset(5)
            $0.top.equalTo(self.comment.snp.bottom).offset(5)
        }
        self.clickThumbsup.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-14)
            $0.width.equalTo(12)
            $0.height.equalTo(11.11)
        }
        self.divideView.snp.makeConstraints{
            $0.width.equalTo(1)
            $0.height.equalTo(5)
            $0.trailing.equalTo(self.clickThumbsup.snp.leading).offset(-8)
            $0.centerY.equalToSuperview()
        }
        self.commentImage.snp.makeConstraints{
            $0.trailing.equalTo(self.divideView.snp.leading).offset(-8)
            $0.centerY.equalToSuperview()
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
        
        let thumbsupBtn = UITapGestureRecognizer(target: self, action: #selector(didClickThumbsup))
        clickThumbsup.isUserInteractionEnabled = true
        clickThumbsup.addGestureRecognizer(thumbsupBtn)
        }
    }

