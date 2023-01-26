//
//  FirstViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/25.
//


import Foundation
import UIKit
import SnapKit
import Then
import DropDown

class FirstViewController: UIViewController{
    
//MARK: - Properties
    let backButton = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let titleLabel = UILabel().then{
        $0.text = "당신이 어떤 사람인지\n하루스픽에 알려주세요!"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 20)
        $0.numberOfLines = 2
    }
    
    let element = UIButton().then{
        $0.setTitle(" 초등학생 ", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    let middle = UIButton().then{
        $0.setTitle(" 중학생 ", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    let high = UIButton().then{
        $0.setTitle(" 고등학생 ", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    let university = UIButton().then{
        $0.setTitle(" 대학생 ", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    let worker = UIButton().then{
        $0.setTitle(" 직장인 ", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    let jobSeeker = UIButton().then{
        $0.setTitle(" 취준생 ", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    let freeman = UIButton().then{
        $0.setTitle(" 나는야, 자유로운 영혼 ", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
    }
    
    
    let learnerLabel1 = UILabel().then{
        $0.text = "어떤 언어를 배우고 싶나요?"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 20)
    }
    let learnerLabel2 = UILabel().then{
        $0.text = "러너가 되어 원하는 언어를 자유롭게 배워보세요!"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.numberOfLines = 2
    }
    let learnerLabel3 = UILabel().then{
        $0.text = "당신은"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
    }
    let learnerLabel4 = UILabel().then{
        $0.text = "러너"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
    }
    
    let ivIcon1 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    var dropView1 = UIButton().then{
        $0.setTitle("영어", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.titleLabel?.textAlignment = .left
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
        $0.roundCorners(cornerRadius: 8, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let LearnerDropDown = DropDown()
    let LearnerLanguage = ["영어", "한국어"]
    let GiverDropDown = DropDown()
    let GiverLanguage = ["한국어", "영어"]
    
    let ivIcon2 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    var dropView2 = UIButton().then{
        $0.setTitle("한국어", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.titleLabel?.textAlignment = .left
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    
    let giverLabel1 = UILabel().then{
        $0.text = "자신있는 언어가 있나요?"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 20)
    }
    let giverLabel2 = UILabel().then{
        $0.text = "기버가 되어 러너에게 도움을 줄 수 있어요!"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.numberOfLines = 2
    }
    let giverLabel3 = UILabel().then{
        $0.text = "당신은"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
    }
    let giverLabel4 = UILabel().then{
        $0.text = "기버"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
    }
    let line1 = UIView().then{
        $0.backgroundColor = .lightGray
    }
    let line2 = UIView().then{
        $0.backgroundColor = .lightGray
    }
    let line3 = UIView().then{
        $0.backgroundColor = .lightGray
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
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true;
        setUpView()
        layout()
        addTarget()
        setDropdown1()
        setDropdown2()
        
    }
//MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.element)
        self.view.addSubview(self.middle)
        self.view.addSubview(self.high)
        self.view.addSubview(self.university)
        self.view.addSubview(self.worker)
        self.view.addSubview(self.jobSeeker)
        self.view.addSubview(self.freeman)
        self.view.addSubview(self.learnerLabel1)
        self.view.addSubview(self.learnerLabel2)
        self.view.addSubview(self.learnerLabel3)
        self.view.addSubview(self.learnerLabel4)
        self.view.addSubview(self.giverLabel1)
        self.view.addSubview(self.giverLabel2)
        self.view.addSubview(self.giverLabel3)
        self.view.addSubview(self.giverLabel4)
        self.view.addSubview(self.line1)
        self.view.addSubview(self.line2)
        self.view.addSubview(self.line3)
        self.view.addSubview(self.nextButton)
        self.view.addSubview(self.dropView1)
        self.view.addSubview(self.ivIcon1)
        self.view.addSubview(self.dropView2)
        self.view.addSubview(self.ivIcon2)
    }

//MARK: - Selector
    
    @objc func elementTapped(){
        element.backgroundColor = .mainColor
        element.setTitleColor(.white, for: .normal)
        element.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 14)
        
        middle.backgroundColor = .white; middle.setTitleColor(.gray, for: .normal); middle.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        high.backgroundColor = .white; high.setTitleColor(.gray, for: .normal); high.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        university.backgroundColor = .white; university.setTitleColor(.gray, for: .normal); university.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        worker.backgroundColor = .white; worker.setTitleColor(.gray, for: .normal); worker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        jobSeeker.backgroundColor = .white; jobSeeker.setTitleColor(.gray, for: .normal); jobSeeker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        freeman.backgroundColor = .white; freeman.setTitleColor(.gray, for: .normal); freeman.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
    }
    @objc func middleTapped(){
        middle.backgroundColor = .mainColor
        middle.setTitleColor(.white, for: .normal)
        middle.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 14)
        
        element.backgroundColor = .white; element.setTitleColor(.gray, for: .normal); element.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        high.backgroundColor = .white; high.setTitleColor(.gray, for: .normal); high.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        university.backgroundColor = .white; university.setTitleColor(.gray, for: .normal); university.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        worker.backgroundColor = .white; worker.setTitleColor(.gray, for: .normal); worker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        jobSeeker.backgroundColor = .white; jobSeeker.setTitleColor(.gray, for: .normal); jobSeeker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        freeman.backgroundColor = .white; freeman.setTitleColor(.gray, for: .normal); freeman.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
    }
    @objc func highTapped(){
        high.backgroundColor = .mainColor
        high.setTitleColor(.white, for: .normal)
        high.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 14)
        
        element.backgroundColor = .white; element.setTitleColor(.gray, for: .normal); element.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        middle.backgroundColor = .white; middle.setTitleColor(.gray, for: .normal); middle.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        university.backgroundColor = .white; university.setTitleColor(.gray, for: .normal); university.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        worker.backgroundColor = .white; worker.setTitleColor(.gray, for: .normal); worker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        jobSeeker.backgroundColor = .white; jobSeeker.setTitleColor(.gray, for: .normal); jobSeeker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        freeman.backgroundColor = .white; freeman.setTitleColor(.gray, for: .normal); freeman.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
    }
    @objc func universityTapped(){
        university.backgroundColor = .mainColor
        university.setTitleColor(.white, for: .normal)
        university.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 14)
        
        element.backgroundColor = .white; element.setTitleColor(.gray, for: .normal); element.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        middle.backgroundColor = .white; middle.setTitleColor(.gray, for: .normal); middle.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        high.backgroundColor = .white; high.setTitleColor(.gray, for: .normal); high.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        worker.backgroundColor = .white; worker.setTitleColor(.gray, for: .normal); worker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        jobSeeker.backgroundColor = .white; jobSeeker.setTitleColor(.gray, for: .normal); jobSeeker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        freeman.backgroundColor = .white; freeman.setTitleColor(.gray, for: .normal); freeman.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
    }
    @objc func workerTapped(){
        worker.backgroundColor = .mainColor
        worker.setTitleColor(.white, for: .normal)
        worker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 14)
        
        element.backgroundColor = .white; element.setTitleColor(.gray, for: .normal); element.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        middle.backgroundColor = .white; middle.setTitleColor(.gray, for: .normal); middle.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        high.backgroundColor = .white; high.setTitleColor(.gray, for: .normal); high.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        university.backgroundColor = .white; university.setTitleColor(.gray, for: .normal); university.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        jobSeeker.backgroundColor = .white; jobSeeker.setTitleColor(.gray, for: .normal); jobSeeker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        freeman.backgroundColor = .white; freeman.setTitleColor(.gray, for: .normal); freeman.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
    }
    @objc func jobSeekerTapped(){
        jobSeeker.backgroundColor = .mainColor
        jobSeeker.setTitleColor(.white, for: .normal)
        jobSeeker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 14)
        
        element.backgroundColor = .white; element.setTitleColor(.gray, for: .normal); element.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        middle.backgroundColor = .white; middle.setTitleColor(.gray, for: .normal); middle.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        high.backgroundColor = .white; high.setTitleColor(.gray, for: .normal); high.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        university.backgroundColor = .white; university.setTitleColor(.gray, for: .normal); university.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        worker.backgroundColor = .white; worker.setTitleColor(.gray, for: .normal); worker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        freeman.backgroundColor = .white; freeman.setTitleColor(.gray, for: .normal); freeman.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
    }
    @objc func freemanTapped(){
        freeman.backgroundColor = .mainColor
        freeman.setTitleColor(.white, for: .normal)
        freeman.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 14)
        
        element.backgroundColor = .white; element.setTitleColor(.gray, for: .normal); element.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        middle.backgroundColor = .white; middle.setTitleColor(.gray, for: .normal); middle.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        high.backgroundColor = .white; high.setTitleColor(.gray, for: .normal); high.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        university.backgroundColor = .white; university.setTitleColor(.gray, for: .normal); university.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        worker.backgroundColor = .white; worker.setTitleColor(.gray, for: .normal); worker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
        jobSeeker.backgroundColor = .white; jobSeeker.setTitleColor(.gray, for: .normal); jobSeeker.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size: 14)
    }
    
    
    
    @objc private func didClickNext(_ button: UIButton) {
        let VC = SecondLearnerViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
        print("didClickNext")
    }
    
    @objc private func didClickBack(_ button: UIButton) {
        dismiss(animated: false)
        print("didClickBack")
    }
    
    //MARK: - DropDown

    func setDropdown1() {
        // DropDown View의 배경
        LearnerDropDown.backgroundColor = .white
        LearnerDropDown.layer.cornerRadius = 5

        DropDown.appearance().backgroundColor = UIColor.white// 아이템 팝업 배경 색상
        DropDown.appearance().setupCornerRadius(5)
        LearnerDropDown.dismissMode = .automatic // 팝업을 닫을 모드 설정
        
        // dataSource로 ItemList를 연결
        LearnerDropDown.dataSource = LearnerLanguage

        // anchorView를 통해 UI와 연결
        LearnerDropDown.anchorView = self.dropView1
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        LearnerDropDown.bottomOffset = CGPoint(x: 0, y: 34)
        
        // Item 선택 시 처리
        LearnerDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.dropView1.setTitle(item, for: .normal)
        }
    }
    func setDropdown2() {
        // DropDown View의 배경
        GiverDropDown.backgroundColor = .white
        GiverDropDown.layer.cornerRadius = 5
        
        DropDown.appearance().textColor = UIColor.black // 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor.white// 아이템 팝업 배경 색상
        DropDown.appearance().setupCornerRadius(5)
        GiverDropDown.dismissMode = .automatic // 팝업을 닫을 모드 설정
        
        // dataSource로 ItemList를 연결
        GiverDropDown.dataSource = GiverLanguage

        // anchorView를 통해 UI와 연결
        GiverDropDown.anchorView = self.dropView2
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        GiverDropDown.bottomOffset = CGPoint(x: 0, y: 34)
        
        // Item 선택 시 처리
        GiverDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.dropView2.setTitle(item, for: .normal)
        }
    }

    // View 클릭 시 Action
    @objc func dropdownClicked1(_ button: UIButton) {
        LearnerDropDown.show()
    }
    @objc func dropdownClicked2(_ button: UIButton) {
        GiverDropDown.show()
    }
    
    
//MARK: - Layout
    func layout(){
        self.backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.leading.equalToSuperview().offset(16)
        }
        
        self.titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(108)
            $0.leading.equalToSuperview().offset(26)
        }
        
        self.element.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(25)
            $0.width.equalTo(75)
            $0.height.equalTo(32)
        }
        self.middle.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            $0.leading.equalTo(self.element.snp.trailing).offset(8)
            $0.width.equalTo(75)
            $0.height.equalTo(32)
        }
        self.high.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            $0.leading.equalTo(self.middle.snp.trailing).offset(8)
            $0.width.equalTo(75)
            $0.height.equalTo(32)
        }
        self.university.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            $0.leading.equalTo(self.high.snp.trailing).offset(8)
            $0.width.equalTo(75)
            $0.height.equalTo(32)
        }
        self.worker.snp.makeConstraints{
            $0.top.equalTo(self.element.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(25)
            $0.width.equalTo(75)
            $0.height.equalTo(32)
        }
        self.jobSeeker.snp.makeConstraints{
            $0.top.equalTo(self.middle.snp.bottom).offset(10)
            $0.leading.equalTo(self.worker.snp.trailing).offset(8)
            $0.width.equalTo(75)
            $0.height.equalTo(32)
        }
        self.freeman.snp.makeConstraints{
            $0.top.equalTo(self.high.snp.bottom).offset(10)
            $0.leading.equalTo(self.jobSeeker.snp.trailing).offset(8)
            $0.width.equalTo(158)
            $0.height.equalTo(32)
        }
        
        self.learnerLabel1.snp.makeConstraints{
            $0.top.equalToSuperview().offset(326)
            $0.leading.equalToSuperview().offset(26)
        }
        self.learnerLabel2.snp.makeConstraints{
            $0.top.equalTo(self.learnerLabel1.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(26)
        }
        self.learnerLabel3.snp.makeConstraints{
            $0.top.equalTo(self.learnerLabel2.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(26)
        }
        self.learnerLabel4.snp.makeConstraints{
            $0.top.equalTo(self.learnerLabel2.snp.bottom).offset(13)
            $0.leading.equalTo(self.dropView1.snp.trailing).offset(7)
        }
        
        self.giverLabel1.snp.makeConstraints{
            $0.top.equalTo(self.line2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
        }
        self.giverLabel2.snp.makeConstraints{
            $0.top.equalTo(self.giverLabel1.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(26)
        }
        self.giverLabel3.snp.makeConstraints{
            $0.top.equalTo(self.giverLabel2.snp.bottom).offset(21)
            $0.leading.equalToSuperview().offset(26)
        }
        self.giverLabel4.snp.makeConstraints{
            $0.top.equalTo(self.giverLabel2.snp.bottom).offset(21)
            $0.leading.equalTo(self.dropView2.snp.trailing).offset(7)
        }
        
        self.line1.snp.makeConstraints{
            $0.top.equalToSuperview().offset(306)
            $0.leading.equalToSuperview().offset(17)
            $0.width.equalTo(357)
            $0.height.equalTo(1)
        }
        self.line2.snp.makeConstraints{
            $0.top.equalTo(self.line1.snp.bottom).offset(164)
            $0.leading.equalToSuperview().offset(17)
            $0.width.equalTo(357)
            $0.height.equalTo(1)
        }
        self.line3.snp.makeConstraints{
            $0.top.equalTo(self.line2.snp.bottom).offset(171)
            $0.leading.equalToSuperview().offset(17)
            $0.width.equalTo(357)
            $0.height.equalTo(1)
        }
        
        self.nextButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
            $0.bottom.equalToSuperview().offset(-44)
            $0.height.equalTo(45)
        }
        self.dropView1.snp.makeConstraints{
            $0.top.equalTo(self.learnerLabel2.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(78)
            $0.width.equalTo(83)
            $0.height.equalTo(32)
        }
        self.ivIcon1.snp.makeConstraints{
            $0.top.equalTo(self.dropView1.snp.top).offset(15)
            $0.trailing.equalTo(self.dropView1.snp.trailing).offset(-11)
            $0.width.equalTo(6)
            $0.height.equalTo(3)
        }
        self.dropView2.snp.makeConstraints{
            $0.top.equalTo(self.giverLabel2.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(78)
            $0.width.equalTo(83)
            $0.height.equalTo(32)
        }
        self.ivIcon2.snp.makeConstraints{
            $0.top.equalTo(self.dropView2.snp.top).offset(15)
            $0.trailing.equalTo(self.dropView2.snp.trailing).offset(-11)
            $0.width.equalTo(6)
            $0.height.equalTo(3)
        }
        
    }
    
//MARK: - Target
    func addTarget(){
        self.element.addTarget(self, action: #selector(elementTapped), for: .touchUpInside)
        self.middle.addTarget(self, action: #selector(middleTapped), for: .touchUpInside)
        self.high.addTarget(self, action: #selector(highTapped), for: .touchUpInside)
        self.university.addTarget(self, action: #selector(universityTapped), for: .touchUpInside)
        self.worker.addTarget(self, action: #selector(workerTapped), for: .touchUpInside)
        self.jobSeeker.addTarget(self, action: #selector(jobSeekerTapped), for: .touchUpInside)
        self.freeman.addTarget(self, action: #selector(freemanTapped), for: .touchUpInside)
        
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(didClickBack))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(backBtn)
        
        self.nextButton.addTarget(self, action: #selector(self.didClickNext(_:)), for: .touchUpInside)
        self.dropView1.addTarget(self, action: #selector(self.dropdownClicked1(_:)), for: .touchUpInside)
        self.dropView2.addTarget(self, action: #selector(self.dropdownClicked2(_:)), for: .touchUpInside)
    }
}
