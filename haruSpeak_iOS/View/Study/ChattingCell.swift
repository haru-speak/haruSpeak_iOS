//
//  MessageCustomTabbar.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/02.
//

import UIKit
import Then
import SnapKit


final class ChattingCell: UICollectionViewCell {
    //MARK: - Properties
    static let identifier = "RecordCell"
    
    let name = UILabel().then{
        $0.text = "연"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 13)
    }
    let profileimg = UIImageView().then{
        $0.image = UIImage(named: "like")?.withRenderingMode(.alwaysOriginal)
    }
    let date = UILabel().then{
        $0.text = "어제"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let comma = UILabel().then{
        $0.text = ", "
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let time = UILabel().then{
        $0.text = "오후 3:52"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let content = UILabel().then{
        $0.text = "ㅎㅇ"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .black
    }
    let num = UILabel().then{
        $0.text = "3"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15.6)
        $0.textColor = .white
    }
    let circle = UIView().then{
        $0.backgroundColor = UIColor.mainColor
        $0.layer.cornerRadius = 15
    }
    let line = UIView().then{
        $0.backgroundColor = UIColor.systemGray4
    }
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selector
    
    //MARK: - addSubView
    private func setupView(){
        self.addSubview(self.name)
        self.addSubview(self.profileimg)
        self.addSubview(self.date)
        self.addSubview(self.comma)
        self.addSubview(self.time)
        self.addSubview(self.content)
        self.addSubview(self.circle)
        self.circle.addSubview(self.num)
        self.addSubview(self.line)
    }
    
    //MARK: - layout
    private func setupLayout(){
        self.name.snp.makeConstraints{
            $0.leading.equalTo(self.profileimg.snp.trailing).offset(16)
            $0.top.equalToSuperview().offset(23)
        }
        self.profileimg.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(38)
        }
        self.date.snp.makeConstraints{
            $0.leading.equalTo(self.name.snp.trailing).offset(6)
            $0.top.equalToSuperview().offset(23)
        }
        self.comma.snp.makeConstraints{
            $0.leading.equalTo(self.date.snp.trailing).offset(1)
            $0.top.equalToSuperview().offset(23)
        }
        self.time.snp.makeConstraints{
            $0.leading.equalTo(self.comma.snp.trailing).offset(0)
            $0.top.equalToSuperview().offset(23)
        }
        self.content.snp.makeConstraints{
            $0.leading.equalTo(self.profileimg.snp.trailing).offset(16)
            $0.top.equalTo(self.time.snp.bottom).offset(6)
        }
        self.num.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
        self.circle.snp.makeConstraints{
            $0.width.height.equalTo(30)
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
        }
        self.line.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(0)
            $0.size.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    //MARK: - AddTarget
}
