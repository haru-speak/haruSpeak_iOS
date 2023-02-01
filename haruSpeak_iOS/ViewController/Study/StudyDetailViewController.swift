//
//  StudyDetailViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/01.
//

import Foundation
import UIKit
import SnapKit
import Then

class StudyDetailViewController: UIViewController{
    //MARK: - Datasource
      
        
    //MARK: - Properties
    let arrowLeft = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft.white")?.withRenderingMode(.alwaysOriginal)
    }
    let thumbnail = UIImageView().then{
        $0.backgroundColor = .mainColor
    }
    
    let studyNameS = UILabel().then{
        $0.text = "오픽 AL 목표로 달려봅시다!!!"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size:15)
        $0.textColor = .white
    }
    let shareBox = UIImageView().then{
        $0.image = UIImage(named: "share")?.withRenderingMode(.alwaysOriginal)
    }
    let base = UIView().then{
        $0.backgroundColor = .black
    }
    let heartWhite = UIImageView().then{
        $0.image = UIImage(named: "heart.white")?.withRenderingMode(.alwaysOriginal)
    }
    let heartNum = UILabel().then{
        $0.text = "13"
        $0.textColor = .white
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size:15)
    }
    let scrollView = UIScrollView().then{
        $0.backgroundColor = .systemGray6
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    let mainView = UIView()
    let topView = UIView().then{
        $0.backgroundColor = .white
    }
    let recruitTagView = UIView().then{
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .systemGray6
    }
    let newTagView = UIView().then{
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .koreanTag
    }
    let recruitText = UILabel().then{
        $0.text = "모집 중"
        $0.textColor = .red
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
    }
    let newText = UILabel().then{
        $0.text = "New"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
    }
    let studyNameL = UILabel().then{
        $0.text = "오픽 AL 목표로 달려봅시다!!!"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size:20)
        $0.textColor = .black
    }
    let studyDetail = UILabel().then{
        $0.text = "겨울방학 2달동안 오픽 끝내실분 같이 공부해요~\n주 1회 대면 병행. 장소는 홍대 or 사당.\n주제 정해서 주 3회 스피킹 녹음해서 올리는게 목표입니다.\n피드백 서로 많이 해주기!!"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size:14)
        $0.textColor = .black
        $0.numberOfLines = 4
        
        //줄 간격
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    let bottomView = UIView().then{
        $0.backgroundColor = .white
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
            
        self.view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = true;
            
        }
  
    //MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.thumbnail)
        self.view.addSubview(self.arrowLeft)
        self.view.addSubview(self.studyNameS)
        self.view.addSubview(self.shareBox)
        self.view.addSubview(self.base)
        self.base.addSubview(self.heartWhite)
        self.base.addSubview(self.heartNum)
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.mainView)
        self.mainView.addSubview(self.topView)
        self.topView.addSubview(self.recruitTagView)
        self.topView.addSubview(self.newTagView)
        self.recruitTagView.addSubview(self.recruitText)
        self.newTagView.addSubview(self.newText)
        self.mainView.addSubview(self.bottomView)
        self.topView.addSubview(self.studyNameL)
        self.topView.addSubview(self.studyDetail)
    }
    
    //MARK: - Selector
    @objc func backTapped(){
        dismiss(animated: false)
    }
    //MARK: - Layout
    func layout(){
        self.thumbnail.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(214)
        }
        self.arrowLeft.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(63)
            $0.leading.equalTo(self.view.snp.leading).offset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        self.studyNameS.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(68.5)
            $0.leading.equalTo(self.arrowLeft.snp.trailing).offset(12)
        }
        self.shareBox.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(63)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        self.base.snp.makeConstraints{
            $0.top.equalToSuperview().offset(180)
            $0.leading.equalToSuperview().offset(30)
            $0.width.equalTo(52)
            $0.height.equalTo(24)
        }
        self.heartWhite.snp.makeConstraints{
            $0.centerY.equalTo(self.base)
            $0.leading.equalTo(self.base.snp.leading).offset(4)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        
        self.heartNum.snp.makeConstraints{
            $0.centerY.equalTo(self.base)
            $0.leading.equalTo(self.heartWhite.snp.trailing).offset(2)
        }
        self.scrollView.snp.makeConstraints{
            $0.top.equalTo(self.thumbnail.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-105)
        }
        self.mainView.snp.makeConstraints{
            $0.top.equalTo(self.thumbnail.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-105)
            $0.width.equalToSuperview()
            $0.size.height.equalTo(500)
        }
        self.topView.snp.makeConstraints{
            $0.top.equalTo(self.scrollView.snp.top).offset(0)
            $0.leading.trailing.equalTo(self.mainView)
            $0.size.height.equalTo(370)
        }
        self.recruitTagView.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.top).offset(26)
            $0.leading.equalTo(self.topView.snp.leading).offset(30)
            $0.width.equalTo(58)
            $0.height.equalTo(22)
        }
        self.newTagView.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.top).offset(26)
            $0.leading.equalTo(self.recruitTagView.snp.trailing).offset(6)
            $0.width.equalTo(46)
            $0.height.equalTo(22)
        }
        self.recruitText.snp.makeConstraints{
            $0.centerY.equalTo(self.recruitTagView)
            $0.centerX.equalTo(self.recruitTagView)
        }
        self.newText.snp.makeConstraints{
            $0.centerY.equalTo(self.newTagView)
            $0.centerX.equalTo(self.newTagView)
        }
        self.bottomView.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(self.scrollView)
            $0.size.height.equalTo(354)
        }
        self.studyNameL.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.top).offset(56)
            $0.leading.equalTo(self.topView.snp.leading).offset(30)
        }
        self.studyDetail.snp.makeConstraints{
            $0.top.equalTo(self.studyNameL.snp.top).offset(41)
            $0.leading.equalTo(self.topView.snp.leading).offset(30)
        }
    }
    
    //MARK: - Target
    func addTarget(){
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        arrowLeft.isUserInteractionEnabled = true
        arrowLeft.addGestureRecognizer(backBtn)
    }
}
