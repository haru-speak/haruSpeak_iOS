//
//  MoreProfileViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/31.
//

import Foundation
import UIKit
import SnapKit
import Then

class MoreProfileViewController: UIViewController{
    
    
    //MARK: - Datasource
    
    
    
    //MARK: - Properties
    let backButton = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let profileLabel = UILabel().then{
        $0.text = "프로필"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.numberOfLines = 0
    }
    let confirmButton = UIButton().then{
        $0.setTitle("확인", for: .normal)
        $0.backgroundColor = .white
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size:15)
    }
    let profilePictureView = UIView().then{
        $0.backgroundColor = .white
    }
    let profilePicture = UIImageView().then{
        $0.roundCorners(cornerRadius: 35, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.image = UIImage(named: "mypage")?.withRenderingMode(.alwaysOriginal)
        $0.backgroundColor = .white
    }
    let cameraImage = UIImageView().then{
        $0.image = UIImage(named: "camera")?.withRenderingMode(.alwaysOriginal)
    }
    let nameLabel = UILabel().then{
        $0.text = "이름"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
        $0.numberOfLines = 0
    }
    let nameTextField = UITextField().then{
        $0.placeholder = "이름 입력"
        $0.textAlignment = .left
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let line1 = UIView().then{
        $0.backgroundColor = UIColor.black
    }
    let introduceLabel = UILabel().then{
        $0.text = "자기소개"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
        $0.numberOfLines = 0
    }
    let introduceTextField = UITextField().then{
        $0.placeholder = "자기소개 입력 (최대 30글자)"
        $0.textAlignment = .left
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let line2 = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    let learnerLevelView = LevelView()
    let giverLevelView = LevelView()
    
    let readyLabel = UILabel().then{
        $0.text = "자기소개"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.numberOfLines = 0
    }
    let readyTextField = UITextField().then{
        $0.placeholder = "자기소개 입력 (최대 30글자)"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let line3 = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    
    
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true;
    }
    
    //MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.profileLabel)
        self.view.addSubview(self.confirmButton)
        self.view.addSubview(self.profilePictureView)
        self.profilePictureView.addSubview(self.profilePicture)
        self.profilePictureView.addSubview(self.cameraImage)
        self.view.addSubview(self.nameLabel)
        self.view.addSubview(self.nameTextField)
        self.view.addSubview(self.line1)
        self.view.addSubview(self.introduceLabel)
        self.view.addSubview(self.introduceTextField)
        self.view.addSubview(self.line2)
        self.view.addSubview(self.learnerLevelView)
        self.view.addSubview(self.giverLevelView)
        self.view.addSubview(self.readyLabel)
        self.view.addSubview(self.readyTextField)
        self.view.addSubview(self.line3)
    }
    
    //MARK: - Selector
    @objc func didClickBackButton(sender: UITapGestureRecognizer){
        dismiss(animated: true)
    }
    
    //MARK: - Layout
    func layout(){
        self.backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        self.profileLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(60)
            $0.centerX.equalToSuperview()
        }
        self.confirmButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.trailing.equalToSuperview().offset(-31)
            $0.width.equalTo(26)
            $0.height.equalTo(20)
        }
        self.profilePictureView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.profileLabel.snp.bottom).offset(27)
            $0.width.equalTo(70)
            $0.height.equalTo(70)
        }
        self.profilePicture.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
        self.cameraImage.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(5)
            $0.width.equalTo(26)
            $0.height.equalTo(26)
        }
        self.nameLabel.snp.makeConstraints{
            $0.top.equalTo(self.profilePictureView.snp.bottom).offset(39)
            $0.leading.equalToSuperview().offset(26)
        }
        self.nameTextField.snp.makeConstraints{
            $0.top.equalTo(self.profilePictureView.snp.bottom).offset(39)
            $0.leading.equalTo(self.nameLabel.snp.trailing).offset(46)
        }
        self.line1.snp.makeConstraints{
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(26)
            $0.trailing.equalToSuperview().offset(-26)
            $0.height.equalTo(1)
        }
        self.introduceLabel.snp.makeConstraints{
            $0.top.equalTo(self.line1.snp.bottom).offset(39)
            $0.leading.equalToSuperview().offset(26)
        }
        self.introduceTextField.snp.makeConstraints{
            $0.top.equalTo(self.line1.snp.bottom).offset(39)
            $0.leading.equalTo(self.introduceLabel.snp.trailing).offset(20)
        }
        self.line2.snp.makeConstraints{
            $0.top.equalTo(self.introduceLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(26)
            $0.trailing.equalToSuperview().offset(-26)
            $0.height.equalTo(1)
        }
        self.learnerLevelView.snp.makeConstraints{
            $0.top.equalTo(self.line2.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(19)
            $0.trailing.equalToSuperview().offset(-19)
        }
        self.giverLevelView.snp.makeConstraints{
            $0.top.equalTo(self.learnerLevelView.snp.bottom).offset(60)
            $0.leading.equalToSuperview().offset(19)
            $0.trailing.equalToSuperview().offset(-19)
        }
        
        
    }
    
    //MARK: - Target
    func addTarget(){
        
        
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(didClickBackButton))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(backBtn)
    }
}
