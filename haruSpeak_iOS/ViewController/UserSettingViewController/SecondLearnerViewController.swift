//
//  SecondViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/25.
//

import Foundation
import UIKit
import SnapKit
import Then

class SecondLearnerViewController: UIViewController{
//MARK: - Datasource
    var levelTextArray : Array = ["하고싶은 말을 단어 나열 수준으로 할 수 있고 \n문장 구성에 어려움이 있어요.",
                                  "익숙한 소재에 대해 짧은 문장으로 \n답변할 수 있지만 막히는 부분이 많아요.",
                                  "일상적인 소재로 의사소통은 가능하지만 \n다양한 어휘 사용에는 부족함이 있어요.",
                                  "익숙한 상황에서 대화 참여에 무리가 없고 \n오랫동안 대화가 가능해요.",
                                  "익숙하지 않은 소재에도 대화참여가 가능하며 발화량이 많고 \n다양한 어휘를 사용해 자연스럽게 말할 수 있어요."
    ]
    var levelArray : Array = ["LV.1", "LV.2", "LV.3", "LV.4", "LV.5"]
    
//MARK: - Properties
    let backButton = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let progressBar = ProgressBarView()
    let titleLabel = UILabel().then{
        $0.text = "승연님의 영어 스피킹 레벨은 \n어디쯤이라고 생각하시나요?"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 24)
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    let levelLabel = UILabel().then{
        $0.text = "LV.1"
        $0.textColor = .mainColor
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
    }
    let descriptionLabel = UILabel().then{
        $0.text = "하고싶은 말을 단어 나열 수준으로 할 수 있고 \n문장 구성에 어려움이 있어요."
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    let levelMainView = UIView().then{
        $0.backgroundColor = .white
    }
    //Level Bar
    let levelbar1 = UIView().then{
        $0.backgroundColor = .mainColor
        $0.roundCorners(cornerRadius: 18, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let levelbar2 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.roundCorners(cornerRadius: 18, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let levelbar3 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.roundCorners(cornerRadius: 18, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let levelbar4 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.roundCorners(cornerRadius: 18, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let levelbar5 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.roundCorners(cornerRadius: 18, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    //Level
    let levelLable1 = UILabel().then{
        $0.text = "LV.1"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let levelLable2 = UILabel().then{
        $0.text = "LV.2"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let levelLable3 = UILabel().then{
        $0.text = "LV.3"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let levelLable4 = UILabel().then{
        $0.text = "LV.4"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let levelLable5 = UILabel().then{
        $0.text = "LV.5"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    let nextButton = UIButton().then{
        $0.setTitle("다음", for: .normal)
        $0.backgroundColor = .mainColor
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size:16)
    }
    
    
    
//MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true;
        
        let attributedStr = NSMutableAttributedString(string: titleLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.mainColor, range: (titleLabel.text! as NSString).range(of: "영어"))
        titleLabel.attributedText = attributedStr
        
        self.progressBar.ratio = 1/5
    }
//MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.progressBar)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.levelLabel)
        self.view.addSubview(self.descriptionLabel)
        self.view.addSubview(self.levelMainView)
        self.levelMainView.addSubview(self.levelbar1)
        self.levelMainView.addSubview(self.levelbar2)
        self.levelMainView.addSubview(self.levelbar3)
        self.levelMainView.addSubview(self.levelbar4)
        self.levelMainView.addSubview(self.levelbar5)
        self.levelMainView.addSubview(self.levelLable1)
        self.levelMainView.addSubview(self.levelLable2)
        self.levelMainView.addSubview(self.levelLable3)
        self.levelMainView.addSubview(self.levelLable4)
        self.levelMainView.addSubview(self.levelLable5)
        self.view.addSubview(self.nextButton)
    }

//MARK: - Selector
    
    @objc func didClickLevel1(sender: UITapGestureRecognizer) {
        print("didClickLevel1")
        self.levelbar1.backgroundColor = .mainColor
        self.levelbar2.backgroundColor = .systemGray6
        self.levelbar3.backgroundColor = .systemGray6
        self.levelbar4.backgroundColor = .systemGray6
        self.levelbar5.backgroundColor = .systemGray6
        
        self.levelLable1.textColor = .black
        self.levelLable2.textColor = .lightGray
        self.levelLable3.textColor = .lightGray
        self.levelLable4.textColor = .lightGray
        self.levelLable5.textColor = .lightGray
        
        self.descriptionLabel.text = levelTextArray[0]
        self.levelLabel.text = levelArray[0]
    }
    @objc func didClickLevel2(sender: UITapGestureRecognizer) {
        print("didClickLevel2")
        self.levelbar1.backgroundColor = .systemGray6
        self.levelbar2.backgroundColor = .mainColor
        self.levelbar3.backgroundColor = .systemGray6
        self.levelbar4.backgroundColor = .systemGray6
        self.levelbar5.backgroundColor = .systemGray6
        
        self.levelLable1.textColor = .lightGray
        self.levelLable2.textColor = .black
        self.levelLable3.textColor = .lightGray
        self.levelLable4.textColor = .lightGray
        self.levelLable5.textColor = .lightGray
        
        self.descriptionLabel.text = levelTextArray[1]
        self.levelLabel.text = levelArray[1]
    }
    @objc func didClickLevel3(sender: UITapGestureRecognizer) {
        print("didClickLevel3")
        self.levelbar1.backgroundColor = .systemGray6
        self.levelbar2.backgroundColor = .systemGray6
        self.levelbar3.backgroundColor = .mainColor
        self.levelbar4.backgroundColor = .systemGray6
        self.levelbar5.backgroundColor = .systemGray6
        
        self.levelLable1.textColor = .lightGray
        self.levelLable2.textColor = .lightGray
        self.levelLable3.textColor = .black
        self.levelLable4.textColor = .lightGray
        self.levelLable5.textColor = .lightGray
        
        self.descriptionLabel.text = levelTextArray[2]
        self.levelLabel.text = levelArray[2]
    }
    @objc func didClickLevel4(sender: UITapGestureRecognizer) {
        print("didClickLevel4")
        self.levelbar1.backgroundColor = .systemGray6
        self.levelbar2.backgroundColor = .systemGray6
        self.levelbar3.backgroundColor = .systemGray6
        self.levelbar4.backgroundColor = .mainColor
        self.levelbar5.backgroundColor = .systemGray6
        
        self.levelLable1.textColor = .lightGray
        self.levelLable2.textColor = .lightGray
        self.levelLable3.textColor = .lightGray
        self.levelLable4.textColor = .black
        self.levelLable5.textColor = .lightGray
        
        self.descriptionLabel.text = levelTextArray[3]
        self.levelLabel.text = levelArray[3]
    }
    @objc func didClickLevel5(sender: UITapGestureRecognizer) {
        print("didClickLevel5")
        self.levelbar1.backgroundColor = .systemGray6
        self.levelbar2.backgroundColor = .systemGray6
        self.levelbar3.backgroundColor = .systemGray6
        self.levelbar4.backgroundColor = .systemGray6
        self.levelbar5.backgroundColor = .mainColor
        
        self.levelLable1.textColor = .lightGray
        self.levelLable2.textColor = .lightGray
        self.levelLable3.textColor = .lightGray
        self.levelLable4.textColor = .lightGray
        self.levelLable5.textColor = .black
        
        self.descriptionLabel.text = levelTextArray[4]
        self.levelLabel.text = levelArray[4]
    }
    
    @objc private func didClickNext(_ button: UIButton) {
        let VC = SecondGiverViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
        print("didClickNext")
    }
    
    @objc private func didClickBack(_ button: UIButton) {
        dismiss(animated: false)
        print("didClickBack")
    }
    
//MARK: - Layout
    func layout(){
        self.backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.leading.equalToSuperview().offset(16)
        }
        self.progressBar.snp.makeConstraints{
            $0.top.equalToSuperview().offset(69)
            $0.leading.equalTo(self.backButton.snp.trailing).offset(21)
            $0.trailing.equalToSuperview().offset(-65)
            $0.height.equalTo(2)
        }
        self.titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.progressBar.snp.bottom).offset(52)
        }
        self.levelLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(8)
        }
        self.descriptionLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.levelLabel.snp.bottom).offset(8)
        }
        self.levelMainView.snp.makeConstraints{
            $0.height.equalTo(353)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.descriptionLabel.snp.bottom).offset(45)
            $0.leading.equalToSuperview().offset(0)
        }
        let centerXFactor: CGFloat = 2 / 6
        self.levelLable1.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalTo(40)
            $0.centerX.equalTo(levelMainView).multipliedBy(1 * centerXFactor)
        }
        self.levelLable2.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalTo(40)
            $0.centerX.equalTo(levelMainView).multipliedBy(2 * centerXFactor)
        }
        self.levelLable3.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalTo(40)
            $0.centerX.equalTo(levelMainView).multipliedBy(3 * centerXFactor)
        }
        self.levelLable4.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalTo(40)
            $0.centerX.equalTo(levelMainView).multipliedBy(4 * centerXFactor)
        }
        self.levelLable5.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalTo(40)
            $0.centerX.equalTo(levelMainView).multipliedBy(5 * centerXFactor)
        }
        self.levelbar1.snp.makeConstraints{
            $0.top.equalToSuperview().offset(196)
            $0.bottom.equalTo(self.levelLable1.snp.top).offset(-19)
            $0.width.equalTo(30)
            $0.centerX.equalTo(levelMainView).multipliedBy(1 * centerXFactor)
        }
        self.levelbar2.snp.makeConstraints{
            $0.top.equalToSuperview().offset(159)
            $0.bottom.equalTo(self.levelLable2.snp.top).offset(-19)
            $0.width.equalTo(30)
            $0.centerX.equalTo(levelMainView).multipliedBy(2 * centerXFactor)
        }
        self.levelbar3.snp.makeConstraints{
            $0.top.equalToSuperview().offset(106)
            $0.bottom.equalTo(self.levelLable3.snp.top).offset(-19)
            $0.width.equalTo(30)
            $0.centerX.equalTo(levelMainView).multipliedBy(3 * centerXFactor)
        }
        self.levelbar4.snp.makeConstraints{
            $0.top.equalToSuperview().offset(62)
            $0.bottom.equalTo(self.levelLable4.snp.top).offset(-19)
            $0.width.equalTo(30)
            $0.centerX.equalTo(levelMainView).multipliedBy(4 * centerXFactor)
        }
        self.levelbar5.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.bottom.equalTo(self.levelLable5.snp.top).offset(-19)
            $0.width.equalTo(30)
            $0.centerX.equalTo(levelMainView).multipliedBy(5 * centerXFactor)
        }
        self.nextButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
            $0.top.equalTo(self.levelMainView.snp.bottom).offset(50)
            $0.height.equalTo(45)
        }
    }
    
//MARK: - Target
    func addTarget(){
        let levelOneButton = UITapGestureRecognizer(target: self, action: #selector(didClickLevel1))
        levelbar1.isUserInteractionEnabled = true
        levelbar1.addGestureRecognizer(levelOneButton)
        
        let levelTwoButton = UITapGestureRecognizer(target: self, action: #selector(didClickLevel2))
        levelbar2.isUserInteractionEnabled = true
        levelbar2.addGestureRecognizer(levelTwoButton)
        
        let levelThreeButton = UITapGestureRecognizer(target: self, action: #selector(didClickLevel3))
        levelbar3.isUserInteractionEnabled = true
        levelbar3.addGestureRecognizer(levelThreeButton)
        
        let levelFourButton = UITapGestureRecognizer(target: self, action: #selector(didClickLevel4))
        levelbar4.isUserInteractionEnabled = true
        levelbar4.addGestureRecognizer(levelFourButton)
        
        let levelFiveButton = UITapGestureRecognizer(target: self, action: #selector(didClickLevel5))
        levelbar5.isUserInteractionEnabled = true
        levelbar5.addGestureRecognizer(levelFiveButton)
        
        self.nextButton.addTarget(self, action: #selector(self.didClickNext(_:)), for: .touchUpInside)
        
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(didClickBack))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(backBtn)
    }
}
