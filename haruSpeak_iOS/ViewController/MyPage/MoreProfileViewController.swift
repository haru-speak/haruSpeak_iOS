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
    
//LEARNER VIEW
    let learnerLevelView = UIView().then{
        $0.backgroundColor = .white
        $0.isUserInteractionEnabled = true
    }
    let circle = UIImageView().then{
        $0.image = UIImage(named: "learnercircle")?.withRenderingMode(.alwaysOriginal)
    }
    let learnerGiverLabel = UILabel().then{
        $0.text = "learner"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
    }
    var dropView1Button = UIButton().then{
        $0.setTitle("언어 선택", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.titleLabel?.textAlignment = .left
    }
    
//    var learnerDropView = UIView().then{
//        $0.layer.borderColor = UIColor.black.cgColor
//        $0.layer.borderWidth = 1
//        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
//    }
//    var learnerDropViewEngLabel = UILabel().then{
//        $0.text = "영어"
//        $0.textColor = .black
//        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 12)
//    }
//    var learnerDropViewLine = UILabel().then{
//        $0.backgroundColor = UIColor.lightGray
//    }
//    var learnerDropViewKorLabel = UILabel().then{
//        $0.text = "한국어"
//        $0.textColor = .black
//        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 12)
//    }
//
    
    
    let ivIcon2 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    let line3 = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    let levelLabel = UILabel().then{
        $0.text = "level"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let level1Button = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitleColor(.gray, for: .normal)
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.setTitle("1", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)

    }
    let level2Button = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitleColor(.gray, for: .normal)
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.setTitle("2", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)

    }
    let level3Button = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitleColor(.gray, for: .normal)
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.setTitle("3", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let level4Button = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitleColor(.gray, for: .normal)
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.setTitle("4", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let level5Button = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitleColor(.gray, for: .normal)
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.setTitle("5", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let line4 = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    
//GIVER VIEW
    let giverLevelView = UIView().then{
        $0.backgroundColor = .white
    }
    let giverCircle = UIImageView().then{
        $0.image = UIImage(named: "givercircle")?.withRenderingMode(.alwaysOriginal)
    }
    let giverLabel = UILabel().then{
        $0.text = "giver"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
    }
    var giverdropView1Button = UIButton().then{
        $0.setTitle("언어 선택", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.titleLabel?.textAlignment = .left
    }
    let giverivIcon2 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    let line5 = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    let giverlevelLabel = UILabel().then{
        $0.text = "level"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let giverlevel1Button = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitleColor(.gray, for: .normal)
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.setTitle("1", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let giverlevel2Button = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitleColor(.gray, for: .normal)
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.setTitle("2", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let giverlevel3Button = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitleColor(.gray, for: .normal)
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.setTitle("3", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let giverlevel4Button = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitleColor(.gray, for: .normal)
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.setTitle("4", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let giverlevel5Button = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitleColor(.gray, for: .normal)
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.setTitle("5", for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let line6 = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }

//READY
    let readyLabel = UILabel().then{
        $0.text = "준비 중인 시험"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
        $0.numberOfLines = 0
    }
    let readyTextField = UILabel().then{
        $0.text = "준비 중인 시험을 선택해주세요"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
        $0.textColor = .lightGray
    }
    let dropDownImg = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    let line7 = UIView().then{
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
        
        //learnerView
        self.view.addSubview(self.learnerLevelView)
        self.learnerLevelView.addSubview(self.circle)
        self.learnerLevelView.addSubview(self.learnerGiverLabel)
        self.learnerLevelView.addSubview(self.dropView1Button)
        //
//        self.learnerLevelView.addSubview(self.learnerDropView)
//        self.learnerLevelView.addSubview(self.learnerDropViewEngLabel)
//        self.learnerLevelView.addSubview(self.learnerDropViewKorLabel)
//        self.learnerLevelView.addSubview(self.learnerDropViewLine)
        //
        self.learnerLevelView.addSubview(self.ivIcon2)
        self.learnerLevelView.addSubview(self.line3)
        self.learnerLevelView.addSubview(self.levelLabel)
        self.learnerLevelView.addSubview(self.level1Button)
        self.learnerLevelView.addSubview(self.level2Button)
        self.learnerLevelView.addSubview(self.level3Button)
        self.learnerLevelView.addSubview(self.level4Button)
        self.learnerLevelView.addSubview(self.level5Button)
        self.learnerLevelView.addSubview(self.line4)
        
        //giverView
        self.view.addSubview(self.giverLevelView)
        self.giverLevelView.addSubview(self.giverCircle)
        self.giverLevelView.addSubview(self.giverLabel)
        self.giverLevelView.addSubview(self.giverdropView1Button)
        self.giverLevelView.addSubview(self.giverivIcon2)
        self.giverLevelView.addSubview(self.line5)
        self.giverLevelView.addSubview(self.giverlevelLabel)
        self.giverLevelView.addSubview(self.giverlevel1Button)
        self.giverLevelView.addSubview(self.giverlevel2Button)
        self.giverLevelView.addSubview(self.giverlevel3Button)
        self.giverLevelView.addSubview(self.giverlevel4Button)
        self.giverLevelView.addSubview(self.giverlevel5Button)
        self.giverLevelView.addSubview(self.line6)
        
        //
        self.view.addSubview(self.readyLabel)
        self.view.addSubview(self.readyTextField)
        self.view.addSubview(self.dropDownImg)
        self.view.addSubview(self.line7)
    }
    
    //MARK: - Selector
    @objc func didClickBackButton(sender: UITapGestureRecognizer){
        dismiss(animated: true)
    }
    @objc func didClickConfirm(_ button: UIButton) {
        print("didClickConfirm")
        dismiss(animated: true)
    }
    @objc func didClickProfilePhoto(sender: UITapGestureRecognizer) {
        print("didClickProfilePhoto")
    }
    
    @objc func didClickLevel1Learner(_ button: UIButton) {
        if self.level1Button.backgroundColor == .white {
            self.level1Button.backgroundColor = .mainColor
            self.level1Button.setTitleColor(.white, for: .normal)
            
            self.level2Button.backgroundColor = .white
            self.level2Button.setTitleColor(.gray, for: .normal)
            self.level3Button.backgroundColor = .white
            self.level3Button.setTitleColor(.gray, for: .normal)
            self.level4Button.backgroundColor = .white
            self.level4Button.setTitleColor(.gray, for: .normal)
            self.level5Button.backgroundColor = .white
            self.level5Button.setTitleColor(.gray, for: .normal)
        }else{
            self.level1Button.backgroundColor = .white
            self.level1Button.setTitleColor(.gray, for: .normal)
        }
    }
    @objc func didClickLevel2Learner(_ button: UIButton) {
        if self.level2Button.backgroundColor == .white {
            self.level2Button.backgroundColor = .mainColor
            self.level2Button.setTitleColor(.white, for: .normal)
            
            self.level1Button.backgroundColor = .white
            self.level1Button.setTitleColor(.gray, for: .normal)
            self.level3Button.backgroundColor = .white
            self.level3Button.setTitleColor(.gray, for: .normal)
            self.level4Button.backgroundColor = .white
            self.level4Button.setTitleColor(.gray, for: .normal)
            self.level5Button.backgroundColor = .white
            self.level5Button.setTitleColor(.gray, for: .normal)
        }else{
            self.level2Button.backgroundColor = .white
            self.level2Button.setTitleColor(.gray, for: .normal)
        }
    }
    @objc func didClickLevel3Learner(_ button: UIButton) {
        if self.level3Button.backgroundColor == .white {
            self.level3Button.backgroundColor = .mainColor
            self.level3Button.setTitleColor(.white, for: .normal)
            
            self.level2Button.backgroundColor = .white
            self.level2Button.setTitleColor(.gray, for: .normal)
            self.level1Button.backgroundColor = .white
            self.level1Button.setTitleColor(.gray, for: .normal)
            self.level4Button.backgroundColor = .white
            self.level4Button.setTitleColor(.gray, for: .normal)
            self.level5Button.backgroundColor = .white
            self.level5Button.setTitleColor(.gray, for: .normal)
        }else{
            self.level3Button.backgroundColor = .white
            self.level3Button.setTitleColor(.gray, for: .normal)
        }
    }
    @objc func didClickLevel4Learner(_ button: UIButton) {
        if self.level4Button.backgroundColor == .white {
            self.level4Button.backgroundColor = .mainColor
            self.level4Button.setTitleColor(.white, for: .normal)
            
            self.level2Button.backgroundColor = .white
            self.level2Button.setTitleColor(.gray, for: .normal)
            self.level3Button.backgroundColor = .white
            self.level3Button.setTitleColor(.gray, for: .normal)
            self.level1Button.backgroundColor = .white
            self.level1Button.setTitleColor(.gray, for: .normal)
            self.level5Button.backgroundColor = .white
            self.level5Button.setTitleColor(.gray, for: .normal)
        }else{
            self.level4Button.backgroundColor = .white
            self.level4Button.setTitleColor(.gray, for: .normal)
        }
    }
    @objc func didClickLevel5Learner(_ button: UIButton) {
        if self.level5Button.backgroundColor == .white {
            self.level5Button.backgroundColor = .mainColor
            self.level5Button.setTitleColor(.white, for: .normal)
            
            self.level2Button.backgroundColor = .white
            self.level2Button.setTitleColor(.gray, for: .normal)
            self.level3Button.backgroundColor = .white
            self.level3Button.setTitleColor(.gray, for: .normal)
            self.level4Button.backgroundColor = .white
            self.level4Button.setTitleColor(.gray, for: .normal)
            self.level1Button.backgroundColor = .white
            self.level1Button.setTitleColor(.gray, for: .normal)
        }else{
            self.level5Button.backgroundColor = .white
            self.level5Button.setTitleColor(.gray, for: .normal)
        }
    }
//Giver
    @objc func didClickLevel1Giver(_ button: UIButton) {
        if self.giverlevel1Button.backgroundColor == .white {
            self.giverlevel1Button.backgroundColor = .mainColor
            self.giverlevel1Button.setTitleColor(.white, for: .normal)
            
            self.giverlevel2Button.backgroundColor = .white
            self.giverlevel2Button.setTitleColor(.gray, for: .normal)
            self.giverlevel3Button.backgroundColor = .white
            self.giverlevel3Button.setTitleColor(.gray, for: .normal)
            self.giverlevel4Button.backgroundColor = .white
            self.giverlevel4Button.setTitleColor(.gray, for: .normal)
            self.giverlevel5Button.backgroundColor = .white
            self.giverlevel5Button.setTitleColor(.gray, for: .normal)
        }else{
            self.giverlevel1Button.backgroundColor = .white
            self.giverlevel1Button.setTitleColor(.gray, for: .normal)
        }
    }
    @objc func didClickLevel2Giver(_ button: UIButton) {
        if self.giverlevel2Button.backgroundColor == .white {
            self.giverlevel2Button.backgroundColor = .mainColor
            self.giverlevel2Button.setTitleColor(.white, for: .normal)
            
            self.giverlevel1Button.backgroundColor = .white
            self.giverlevel1Button.setTitleColor(.gray, for: .normal)
            self.giverlevel3Button.backgroundColor = .white
            self.giverlevel3Button.setTitleColor(.gray, for: .normal)
            self.giverlevel4Button.backgroundColor = .white
            self.giverlevel4Button.setTitleColor(.gray, for: .normal)
            self.giverlevel5Button.backgroundColor = .white
            self.giverlevel5Button.setTitleColor(.gray, for: .normal)
        }else{
            self.giverlevel2Button.backgroundColor = .white
            self.giverlevel2Button.setTitleColor(.gray, for: .normal)
        }
    }
    @objc func didClickLevel3Giver(_ button: UIButton) {
        if self.giverlevel3Button.backgroundColor == .white {
            self.giverlevel3Button.backgroundColor = .mainColor
            self.giverlevel3Button.setTitleColor(.white, for: .normal)
            
            self.giverlevel2Button.backgroundColor = .white
            self.giverlevel2Button.setTitleColor(.gray, for: .normal)
            self.giverlevel1Button.backgroundColor = .white
            self.giverlevel1Button.setTitleColor(.gray, for: .normal)
            self.giverlevel4Button.backgroundColor = .white
            self.giverlevel4Button.setTitleColor(.gray, for: .normal)
            self.giverlevel5Button.backgroundColor = .white
            self.giverlevel5Button.setTitleColor(.gray, for: .normal)
        }else{
            self.giverlevel3Button.backgroundColor = .white
            self.giverlevel3Button.setTitleColor(.gray, for: .normal)
        }
    }
    @objc func didClickLevel4Giver(_ button: UIButton) {
        if self.giverlevel4Button.backgroundColor == .white {
            self.giverlevel4Button.backgroundColor = .mainColor
            self.giverlevel4Button.setTitleColor(.white, for: .normal)
            
            self.giverlevel2Button.backgroundColor = .white
            self.giverlevel2Button.setTitleColor(.gray, for: .normal)
            self.giverlevel3Button.backgroundColor = .white
            self.giverlevel3Button.setTitleColor(.gray, for: .normal)
            self.giverlevel1Button.backgroundColor = .white
            self.giverlevel1Button.setTitleColor(.gray, for: .normal)
            self.giverlevel5Button.backgroundColor = .white
            self.giverlevel5Button.setTitleColor(.gray, for: .normal)
        }else{
            self.giverlevel4Button.backgroundColor = .white
            self.giverlevel4Button.setTitleColor(.gray, for: .normal)
        }
    }
    @objc func didClickLevel5Giver(_ button: UIButton) {
        if self.giverlevel5Button.backgroundColor == .white {
            self.giverlevel5Button.backgroundColor = .mainColor
            self.giverlevel5Button.setTitleColor(.white, for: .normal)
            
            self.giverlevel2Button.backgroundColor = .white
            self.giverlevel2Button.setTitleColor(.gray, for: .normal)
            self.giverlevel3Button.backgroundColor = .white
            self.giverlevel3Button.setTitleColor(.gray, for: .normal)
            self.giverlevel4Button.backgroundColor = .white
            self.giverlevel4Button.setTitleColor(.gray, for: .normal)
            self.giverlevel1Button.backgroundColor = .white
            self.giverlevel1Button.setTitleColor(.gray, for: .normal)
        }else{
            self.giverlevel5Button.backgroundColor = .white
            self.giverlevel5Button.setTitleColor(.gray, for: .normal)
        }
    }

    
    @objc func didClickDropView1(_ button: UIButton) {
        print("didClickDropView1")
    }
    @objc func didClickGiverdropView1(_ button: UIButton) {
        print("didClickGiverdropView1")
    }
    @objc func didClickReady(sender: UITapGestureRecognizer) {
        print("didClickReady")
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
//LEARNER VIEW
        self.learnerLevelView.snp.makeConstraints{
            $0.top.equalTo(self.line2.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(19)
            $0.trailing.equalToSuperview().offset(-19)
            $0.height.equalTo(30)
        }
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
        self.dropView1Button.snp.makeConstraints{
            $0.leading.equalTo(self.learnerGiverLabel.snp.trailing).offset(20)
            $0.top.equalToSuperview().offset(2)
        }
//        self.learnerDropView.snp.makeConstraints{
//            $0.top.equalTo(self.line3.snp.bottom)
//            $0.leading.equalToSuperview().offset(85)
//            $0.height.equalTo(70)
//            $0.width.equalTo(60)
//        }
        
        
        self.ivIcon2.snp.makeConstraints{
            $0.leading.equalTo(self.dropView1Button.snp.trailing).offset(10)
            $0.width.equalTo(8)
            $0.height.equalTo(4)
            $0.top.equalToSuperview().offset(12)
        }
        self.line3.snp.makeConstraints{
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
            $0.leading.equalTo(self.levelLabel.snp.trailing).offset(5)
            $0.top.equalToSuperview().offset(5)
            $0.height.width.equalTo(21)
        }
        self.level2Button.snp.makeConstraints{
            $0.leading.equalTo(self.level1Button.snp.trailing).offset(4)
            $0.top.equalToSuperview().offset(5)
            $0.height.width.equalTo(21)
        }
        self.level3Button.snp.makeConstraints{
            $0.leading.equalTo(self.level2Button.snp.trailing).offset(5)
            $0.top.equalToSuperview().offset(5)
            $0.height.width.equalTo(21)
        }
        self.level4Button.snp.makeConstraints{
            $0.leading.equalTo(self.level3Button.snp.trailing).offset(5)
            $0.top.equalToSuperview().offset(5)
            $0.height.width.equalTo(21)
        }
        self.level5Button.snp.makeConstraints{
            $0.leading.equalTo(self.level4Button.snp.trailing).offset(5)
            $0.top.equalToSuperview().offset(5)
            $0.height.width.equalTo(21)
        }
        self.line4.snp.makeConstraints{
            $0.top.equalTo(self.levelLabel.snp.bottom).offset(6.5)
            $0.leading.equalTo(self.line3.snp.trailing).offset(7)
            $0.width.equalTo(180)
            $0.height.equalTo(1)
        }
        
        
        
        
//GIVER VIEW
        self.giverLevelView.snp.makeConstraints{
            $0.top.equalTo(self.learnerLevelView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(19)
            $0.trailing.equalToSuperview().offset(-19)
            $0.height.equalTo(30)
        }
        self.giverCircle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.width.equalTo(7)
            $0.height.equalTo(7)
        }
        self.giverLabel.snp.makeConstraints{
            $0.leading.equalTo(self.giverCircle.snp.trailing).offset(1)
            $0.top.equalToSuperview().offset(6)
        }
        self.giverdropView1Button.snp.makeConstraints{
            $0.leading.equalTo(self.giverLabel.snp.trailing).offset(33)
            $0.top.equalToSuperview().offset(2)
        }
        self.giverivIcon2.snp.makeConstraints{
            $0.leading.equalTo(self.giverdropView1Button.snp.trailing).offset(10)
            $0.width.equalTo(8)
            $0.height.equalTo(4)
            $0.top.equalToSuperview().offset(12)
        }
        self.line5.snp.makeConstraints{
            $0.top.equalTo(self.giverLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(7)
            $0.width.equalTo(162)
            $0.height.equalTo(1)
        }
        self.giverlevelLabel.snp.makeConstraints{
            $0.leading.equalTo(self.giverivIcon2.snp.trailing).offset(40)
            $0.top.equalToSuperview().offset(6)
        }
        self.giverlevel1Button.snp.makeConstraints{
            $0.leading.equalTo(self.giverlevelLabel.snp.trailing).offset(10)
            $0.top.equalToSuperview().offset(5)
            $0.height.width.equalTo(21)
        }
        self.giverlevel2Button.snp.makeConstraints{
            $0.leading.equalTo(self.giverlevel1Button.snp.trailing).offset(4)
            $0.top.equalToSuperview().offset(5)
            $0.height.width.equalTo(21)
        }
        self.giverlevel3Button.snp.makeConstraints{
            $0.leading.equalTo(self.giverlevel2Button.snp.trailing).offset(5)
            $0.top.equalToSuperview().offset(5)
            $0.height.width.equalTo(21)
        }
        self.giverlevel4Button.snp.makeConstraints{
            $0.leading.equalTo(self.giverlevel3Button.snp.trailing).offset(5)
            $0.top.equalToSuperview().offset(5)
            $0.height.width.equalTo(21)
        }
        self.giverlevel5Button.snp.makeConstraints{
            $0.leading.equalTo(self.giverlevel4Button.snp.trailing).offset(5)
            $0.top.equalToSuperview().offset(5)
            $0.height.width.equalTo(21)
        }
        self.line6.snp.makeConstraints{
            $0.top.equalTo(self.giverlevelLabel.snp.bottom).offset(6.5)
            $0.leading.equalTo(self.line5.snp.trailing).offset(7)
            $0.width.equalTo(180)
            $0.height.equalTo(1)
        }
        
        
        
        
//
        self.readyLabel.snp.makeConstraints{
            $0.top.equalTo(self.giverLevelView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(26)
        }
        self.readyTextField.snp.makeConstraints{
            $0.top.equalTo(self.giverLevelView.snp.bottom).offset(40)
            $0.leading.equalTo(self.readyLabel.snp.trailing).offset(25)
        }
        self.dropDownImg.snp.makeConstraints{
            $0.top.equalTo(self.giverLevelView.snp.bottom).offset(45)
            $0.trailing.equalToSuperview().offset(-31)
            $0.height.equalTo(4)
            $0.width.equalTo(8)
        }
        self.line7.snp.makeConstraints{
            $0.top.equalTo(self.readyLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(26)
            $0.trailing.equalToSuperview().offset(-26)
            $0.height.equalTo(1)
        }
        
        
    }
    
    //MARK: - Target
    func addTarget(){
        
        
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(didClickBackButton))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(backBtn)
        
        self.confirmButton.addTarget(self, action: #selector(self.didClickConfirm(_:)), for: .touchUpInside)
        
        
        let profilephotoBtn = UITapGestureRecognizer(target: self, action: #selector(didClickProfilePhoto))
        profilePicture.isUserInteractionEnabled = true
        profilePicture.addGestureRecognizer(profilephotoBtn)
        
        
        self.dropView1Button.addTarget(self, action: #selector(self.didClickDropView1(_:)), for: .touchUpInside)
        self.giverdropView1Button.addTarget(self, action: #selector(self.didClickGiverdropView1(_:)), for: .touchUpInside)
        
        
        
        self.level1Button.addTarget(self, action: #selector(self.didClickLevel1Learner(_:)), for: .touchUpInside)
        self.level2Button.addTarget(self, action: #selector(self.didClickLevel2Learner(_:)), for: .touchUpInside)
        self.level3Button.addTarget(self, action: #selector(self.didClickLevel3Learner(_:)), for: .touchUpInside)
        self.level4Button.addTarget(self, action: #selector(self.didClickLevel4Learner(_:)), for: .touchUpInside)
        self.level5Button.addTarget(self, action: #selector(self.didClickLevel5Learner(_:)), for: .touchUpInside)
        
        self.giverlevel1Button.addTarget(self, action: #selector(self.didClickLevel1Giver(_:)), for: .touchUpInside)
        self.giverlevel2Button.addTarget(self, action: #selector(self.didClickLevel2Giver(_:)), for: .touchUpInside)
        self.giverlevel3Button.addTarget(self, action: #selector(self.didClickLevel3Giver(_:)), for: .touchUpInside)
        self.giverlevel4Button.addTarget(self, action: #selector(self.didClickLevel4Giver(_:)), for: .touchUpInside)
        self.giverlevel5Button.addTarget(self, action: #selector(self.didClickLevel5Giver(_:)), for: .touchUpInside)
        
        
        let readyTextFieldBtn = UITapGestureRecognizer(target: self, action: #selector(didClickReady))
        readyTextField.isUserInteractionEnabled = true
        readyTextField.addGestureRecognizer(readyTextFieldBtn)
    }
}
