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
        $0.textColor = .lightGray
    }
    let line1 = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    let line2 = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    let STTText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 20)//글씨체 굵기 세미볼드로 바꿔야함
        $0.textColor = .init(red: 0, green: 0, blue: 0, alpha: 0.6)
        $0.text = "My room is tiny. \nWhen I say tiny… I mean, really tiny"
        $0.numberOfLines = 2
        
        //줄 간격
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
//    let recordButton = RecordingButton(frame: CGRect())

//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupLayout()
    }
//MARK: - addSubView
    private func setupView(){
        self.view.addSubview(self.arrowLeft)
        self.view.addSubview(self.date)
        self.view.addSubview(self.line1)
        self.view.addSubview(self.line2)
        self.view.addSubview(self.STTText)
//        self.view.addSubview(self.recordButton)
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
            $0.top.equalTo(self.view.snp.top).offset(55)
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
        self.STTText.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(30)
            $0.top.equalTo(self.line1.snp.bottom).offset(28)
        }
//        self.recordButton.snp.makeConstraints{
//            $0.centerX.equalToSuperview()
//            $0.top.equalTo(self.line2.snp.bottom).offset(45)
//        }
    }
}
