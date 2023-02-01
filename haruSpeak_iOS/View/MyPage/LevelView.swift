//
//  LevelView.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/31.
//

import UIKit
import Then
import SnapKit

class LevelView: UIView{
    let circle = UIImageView().then{
        $0.image = UIImage(named: "learnercircle")?.withRenderingMode(.alwaysOriginal)
    }
    let learnerGiverLabel = UILabel().then{
        $0.text = "learner"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    var dropView1 = UIButton().then{
        $0.setTitle("언어 선택", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.titleLabel?.textAlignment = .left
    }
    let ivIcon2 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    let line1 = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    
    
    
    
    let levelLabel = UILabel().then{
        $0.text = "level"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
    }
    let level1Button = UIButton().then{
        $0.backgroundColor = .black
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.setTitle("1", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    
    
    let line2 = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.layout()
        self.addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selector
    
    
    //MARK: - addSubView
    private func addSubView() {
        self.addSubview(self.circle)
        self.addSubview(self.learnerGiverLabel)
        self.addSubview(self.dropView1)
        self.addSubview(self.ivIcon2)
        self.addSubview(self.line1)
        self.addSubview(self.levelLabel)
        self.addSubview(self.level1Button)
        
        
        self.addSubview(self.line2)
    }
    
    //MARK: - Layout
    private func layout() {
        self.circle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.width.equalTo(7)
            $0.height.equalTo(7)
        }
        self.learnerGiverLabel.snp.makeConstraints{
            $0.leading.equalTo(self.circle.snp.trailing).offset(1)
            $0.top.equalToSuperview().offset(6)
        }
        self.dropView1.snp.makeConstraints{
            $0.leading.equalTo(self.learnerGiverLabel.snp.trailing).offset(20)
            $0.top.equalToSuperview().offset(2)
        }
        self.ivIcon2.snp.makeConstraints{
            $0.leading.equalTo(self.dropView1.snp.trailing).offset(10)
            $0.width.equalTo(8)
            $0.height.equalTo(4)
            $0.top.equalToSuperview().offset(12)
        }
        self.line1.snp.makeConstraints{
            $0.top.equalTo(self.learnerGiverLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(7)
            $0.width.equalTo(162)
            $0.height.equalTo(1)
        }
        self.levelLabel.snp.makeConstraints{
            $0.leading.equalTo(self.ivIcon2.snp.trailing).offset(40)
            $0.top.equalToSuperview().offset(6)
        }
        self.level1Button.snp.makeConstraints{
            $0.leading.equalTo(self.levelLabel.snp.trailing).offset(10)
            $0.top.equalToSuperview()
        }
        self.line2.snp.makeConstraints{
            $0.top.equalTo(self.levelLabel.snp.bottom).offset(5)
            $0.leading.equalTo(self.line1.snp.trailing).offset(7)
            $0.width.equalTo(162)
            $0.height.equalTo(1)
        }
        
    }
    
    //MARK: - AddTarget
    private func addTarget() {
        
        
    }
}
