//
//  RecordViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/14.
//

import Foundation
import UIKit
import SnapKit
import Then

class RecordViewController: UIViewController{
    //MARK: - Properties
    let arrowLeft = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let date = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.text = "12월 8일"
        $0.textColor = .black
    }
    let delete = UIButton().then{
        $0.setTitle("삭제", for: .normal)
        $0.setTitleColor(.mainColor, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.backgroundColor = .white
        $0.layer.isHidden = true
    }
    let line1 = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    let startMsg = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)//글씨체 굵기 세미볼드로 바꿔야함
        $0.textColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
        $0.text = "녹음 버튼을 눌러 스피킹을 기록해보세요!"
    }
    let STTText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 20)//글씨체 굵기 세미볼드로 바꿔야함
        $0.textColor = .init(red: 0, green: 0, blue: 0, alpha: 0.6)
        $0.text = "My room is tiny.\nWhen I say tiny… I mean, really tiny"
        $0.numberOfLines = 100
        $0.layer.isHidden = true
        
        //줄 간격
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    
    let line2 = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    let baseCircle = UIImageView().then{
        $0.image = UIImage(named: "recordButtonBase")?.withRenderingMode(.alwaysOriginal)
    }
    let mainButton = UIImageView().then{
        $0.image = UIImage(named: "startRecording")?.withRenderingMode(.alwaysOriginal)
    }
    let done = UIButton().then{
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.mainColor, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 2
        $0.layer.isHidden = true
    }
    let time = UILabel().then{
        $0.text = "00:08"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 20)//글씨체 굵기 세미볼드로 바꿔야함
        $0.textColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
        $0.layer.isHidden = true
    }
    
    let nextButton = UIButton(type: .system).then{
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.layer.cornerRadius = 6
        $0.backgroundColor = .mainColor
        $0.layer.isHidden = true
    }
    
    //MARK: - ButtonArray
    let mainButtonArray = ["startRecording","pauseRecording","play.blue"]
    var buttonIndex = 0
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupLayout()
        addTarget()
    }
    
    //MARK: - Selector
    @objc func mainButtonTapped(sender: UITapGestureRecognizer) {
        self.buttonIndex = (self.buttonIndex >= self.mainButtonArray.count-1) ? 0 : self.buttonIndex+1
        self.mainButton.image = UIImage(named:mainButtonArray[buttonIndex])
        if buttonIndex == 0{
            self.STTText.layer.isHidden = true
            self.delete.layer.isHidden = true
            self.done.layer.isHidden = true
            self.time.layer.isHidden = true
            self.nextButton.layer.isHidden = true
        }
        else if buttonIndex == 1{
            self.STTText.layer.isHidden = false
            self.startMsg.layer.isHidden = true
            self.delete.layer.isHidden = true
            self.nextButton.layer.isHidden = true
            self.done.layer.isHidden = false
            self.time.layer.isHidden = false
        }
        else{
            self.STTText.layer.isHidden = false
            self.delete.layer.isHidden = false
            self.done.layer.isHidden = true
            self.time.layer.isHidden = true
            self.nextButton.layer.isHidden = false
        }
    }
    
    //MARK: - addSubView
    private func setupView(){
        self.view.addSubview(self.arrowLeft)
        self.view.addSubview(self.date)
        self.view.addSubview(self.delete)
        self.view.addSubview(self.line1)
        self.view.addSubview(self.line2)
        self.view.addSubview(self.startMsg)
        self.view.addSubview(self.STTText)
        self.view.addSubview(self.baseCircle)
        self.view.addSubview(self.mainButton)
        self.view.addSubview(self.done)
        self.view.addSubview(self.time)
        self.view.addSubview(self.nextButton)
    }
    
    //MARK: - Layout
    private func setupLayout(){
        self.arrowLeft.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(55)
            $0.leading.equalTo(self.view.snp.leading).offset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        self.date.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(61)
        }
        self.delete.snp.makeConstraints{
            $0.trailing.equalTo(self.view.snp.trailing).offset(-29)
            $0.top.equalTo(self.view.snp.top).offset(61)
        }
        
        self.line1.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(107)
            $0.width.equalTo(331)
            $0.height.equalTo(1)
        }
        self.line2.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-218)
            $0.width.equalTo(331)
            $0.height.equalTo(1)
        }
        self.startMsg.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.line1.snp.bottom).offset(215)
        }
        self.STTText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.line1.snp.bottom).offset(28)
        }
        self.baseCircle.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-135)
            $0.width.height.equalTo(69)
        }
        self.mainButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-142)
            $0.width.height.equalTo(55)
        }
        self.time.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.baseCircle.snp.bottom).offset(15)
        }
        self.done.snp.makeConstraints{
            $0.trailing.equalTo(self.view.snp.trailing).offset(-30)
            $0.bottom.equalTo(self.view.snp.bottom).offset(-141)
            $0.width.equalTo(75)
            $0.height.equalTo(45)
            
        }
        self.nextButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-50)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
    }
    
    //MARK: - AddTarget
    private func addTarget(){
        let mainBtn = UITapGestureRecognizer(target: self, action: #selector(mainButtonTapped))
        mainButton.isUserInteractionEnabled = true
        mainButton.addGestureRecognizer(mainBtn)
        }
    }
