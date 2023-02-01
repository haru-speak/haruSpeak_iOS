//
//  MakeStudyViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/31.
//

import Foundation
import UIKit
import SnapKit
import Then
import DropDown

class MakeStudyViewController: UIViewController{
//MARK: - Datasource
  
    
//MARK: - Properties
    let blueView = UIView().then{
        $0.backgroundColor = .mainColor
    }
    
    let arrowLeft = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft.white")?.withRenderingMode(.alwaysOriginal)
    }
    
    let step1 = UIImageView().then{
        $0.image = UIImage(named: "step1")?.withRenderingMode(.alwaysOriginal)
    }
    let mainScrollView = UIScrollView().then{
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    let mainView = UIView().then{
        $0.backgroundColor = .lightGray
    }
    
    let newStudyText = UILabel().then{
        $0.text = "새 스터디"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.textColor = .white
    }
    let makeStudyText = UILabel().then{
        $0.text = "새로운 스터디를 만들어볼까요?"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 22)
        $0.textColor = .black
    }
    let setLanguageText = UILabel().then{
        $0.text = "스터디할 언어를 설정해주세요"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.textColor = .black
    }
    let ivIcon1 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    let ivIcon2 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    let ivIcon3 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    let ivIcon4 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    var setLanguageDropView = UIButton().then{
        $0.setTitle("영어", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
    }
    let setLanguageDropDown = DropDown()
    let setLanguage = ["영어", "한국어"]
    let setLevelText = UILabel().then{
        $0.text = "우리 스터디의 레벨을 설정해주세요"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textColor = .black
    }
    let setLevelText2 = UILabel().then{
        $0.text = "비슷한 레벨의 멤버들과 스터디할 수 있어요!"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.textColor = .lightGray
    }
    let level1 = UIButton().then{
        $0.setTitle("1", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.backgroundColor = .mainColor
        $0.layer.cornerRadius = 10
    }
    let level2 = UIButton().then{
        $0.setTitle("2", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.backgroundColor = .mainColor
        $0.layer.cornerRadius = 10
    }
    let level3 = UIButton().then{
        $0.setTitle("3", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.backgroundColor = .mainColor
        $0.layer.cornerRadius = 10
    }
    let level4 = UIButton().then{
        $0.setTitle("4", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.backgroundColor = .mainColor
        $0.layer.cornerRadius = 10
    }
    let level5 = UIButton().then{
        $0.setTitle("5", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.backgroundColor = .mainColor
        $0.layer.cornerRadius = 10
    }
    let goalText = UILabel().then{
        $0.text = "목표로 하는 스피킹 시험이 있나요?"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textColor = .black
    }
    let theNumberOfMemText = UILabel().then{
        $0.text = "모집할 스터디 멤버의 정원을 설정해주세요"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textColor = .black
    }
    let whenText = UILabel().then{
        $0.text = "스터디 활동 주기를 설정해주세요"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textColor = .black
    }
    let offLineText = UILabel().then{
        $0.text = "대면 스터디를 병행하시나요?"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textColor = .black
    }
    var testNameDropView = UIButton().then{
        $0.setTitle("시험", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
    }
    let testNameDropDown = DropDown()
    let testName = ["TOFEL","OPIc", "TOEIC Speaking"]
    
    var testLevelDropView = UIButton().then{
        $0.setTitle("등급", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
    }
    let testLevelDropDown = DropDown()
    let testLevel = ["AL", "IH", "IM"]
    
    var whereDropView = UIButton().then{
        $0.setTitle("지역", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
    }
    let whereDropDown = DropDown()
    let whereList = ["서울", "수원", "인천", "대구", "부산"]
    
    
//MARK: - LifeCycle
    override func viewDidLoad() {
        view.backgroundColor = .white
        setUpView()
        layout()
        addTarget()
        setDropdown1()
        setDropdown2()
        setDropdown3()
        setDropdown4()
        let attributedStr = NSMutableAttributedString(string: makeStudyText.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.mainColor, range: (makeStudyText.text! as NSString).range(of: "새로운 스터디"))
        makeStudyText.attributedText = attributedStr
        self.navigationController?.navigationBar.isHidden = true;
    }
//MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.blueView)
        self.view.addSubview(self.arrowLeft)
        self.view.addSubview(self.step1)
        self.view.addSubview(self.mainScrollView)
        self.view.addSubview(self.newStudyText)
        self.view.addSubview(self.makeStudyText)
        self.mainScrollView.addSubview(self.mainView)
        self.mainView.addSubview(self.setLanguageText)
        self.mainView.addSubview(self.setLanguageDropView)
        self.mainView.addSubview(self.testNameDropView)
        self.mainView.addSubview(self.testLevelDropView)
        self.mainView.addSubview(self.whereDropView)
        self.mainView.addSubview(self.ivIcon1)
        self.mainView.addSubview(self.ivIcon2)
        self.mainView.addSubview(self.ivIcon3)
        self.mainView.addSubview(self.ivIcon4)
        self.mainView.addSubview(self.setLevelText)
        self.mainView.addSubview(self.setLevelText2)
        self.mainView.addSubview(self.level1)
        self.mainView.addSubview(self.level2)
        self.mainView.addSubview(self.level3)
        self.mainView.addSubview(self.level4)
        self.mainView.addSubview(self.level5)
        self.mainView.addSubview(self.goalText)
        self.mainView.addSubview(self.theNumberOfMemText)
        self.mainView.addSubview(self.whenText)
        self.mainView.addSubview(self.offLineText)
        
    }

//MARK: - Selector
    @objc func backTapped(){
        dismiss(animated: false)
    }
    @objc func setLanguageClicked(_ button: UIButton) {
        print("setLanguage")
        setLanguageDropDown.show()
    }
    @objc func testNameClicked(_ button: UIButton) {
        print("testName")
        testNameDropDown.show()
    }
    @objc func testLevelClicked(_ button: UIButton) {
        print("testLevel")
        testLevelDropDown.show()
    }
    @objc func whereClicked(_ button: UIButton) {
        print("where")
        whereDropDown.show()
    }
    
    //MARK: - DropDown

    func setDropdown1() {
        // DropDown View의 배경
        setLanguageDropDown.backgroundColor = .white
        setLanguageDropDown.layer.cornerRadius = 5

        DropDown.appearance().backgroundColor = UIColor.white// 아이템 팝업 배경 색상
        DropDown.appearance().setupCornerRadius(5)
        setLanguageDropDown.dismissMode = .automatic // 팝업을 닫을 모드 설정
        
        // dataSource로 ItemList를 연결
        setLanguageDropDown.dataSource = setLanguage

        // anchorView를 통해 UI와 연결
        setLanguageDropDown.anchorView = self.setLanguageDropView
        
        // View를 가리지 않고 View아래에 Item 팝업이 붙도록 설정
        setLanguageDropDown.bottomOffset = CGPoint(x: 0, y: 30)
        
        // Item 선택 시 처리
        setLanguageDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.setLanguageDropView.setTitle(item, for: .normal)
        }
    }
    func setDropdown2() {
        // DropDown View의 배경
        testNameDropDown.backgroundColor = .white
        testNameDropDown.layer.cornerRadius = 5

        DropDown.appearance().backgroundColor = UIColor.white// 아이템 팝업 배경 색상
        DropDown.appearance().setupCornerRadius(5)
        testNameDropDown.dismissMode = .automatic // 팝업을 닫을 모드 설정
        
        // dataSource로 ItemList를 연결
        testNameDropDown.dataSource = testName
        

        // anchorView를 통해 UI와 연결
        testNameDropDown.anchorView = self.testNameDropView
        
        // View를 가리지 않고 View아래에 Item 팝업이 붙도록 설정
        testNameDropDown.bottomOffset = CGPoint(x: 0, y: 30)
        
        // Item 선택 시 처리
        testNameDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.testNameDropView.setTitle(item, for: .normal)
        }
    }
    func setDropdown3() {
        // DropDown View의 배경
        testLevelDropDown.backgroundColor = .white
        testLevelDropDown.layer.cornerRadius = 5

        DropDown.appearance().backgroundColor = UIColor.white// 아이템 팝업 배경 색상
        DropDown.appearance().setupCornerRadius(5)
        testLevelDropDown.dismissMode = .automatic // 팝업을 닫을 모드 설정
        
        // dataSource로 ItemList를 연결
        testLevelDropDown.dataSource = testLevel

        // anchorView를 통해 UI와 연결
        testLevelDropDown.anchorView = self.testLevelDropView
        
        // View를 가리지 않고 View아래에 Item 팝업이 붙도록 설정
        testLevelDropDown.bottomOffset = CGPoint(x: 0, y: 30)
        
        // Item 선택 시 처리
        testLevelDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.testLevelDropView.setTitle(item, for: .normal)
        }
    }
    func setDropdown4() {
        // DropDown View의 배경
        whereDropDown.backgroundColor = .white
        whereDropDown.layer.cornerRadius = 5

        DropDown.appearance().backgroundColor = UIColor.white// 아이템 팝업 배경 색상
        DropDown.appearance().setupCornerRadius(5)
        whereDropDown.dismissMode = .automatic // 팝업을 닫을 모드 설정
        
        // dataSource로 ItemList를 연결
        whereDropDown.dataSource = whereList

        // anchorView를 통해 UI와 연결
        whereDropDown.anchorView = self.whereDropView
        
        // View를 가리지 않고 View아래에 Item 팝업이 붙도록 설정
        whereDropDown.bottomOffset = CGPoint(x: 0, y: 30)
        
        // Item 선택 시 처리
        whereDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.whereDropView.setTitle(item, for: .normal)
        }
    }
   
    
//MARK: - Layout
    func layout(){
        self.blueView.snp.makeConstraints{
            $0.top.trailing.leading.equalToSuperview().offset(0)
            $0.height.equalTo(128)
        }
        self.arrowLeft.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(55)
            $0.leading.equalTo(self.view.snp.leading).offset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        self.step1.snp.makeConstraints{
            $0.top.equalToSuperview().offset(95.55)
            $0.leading.equalToSuperview().offset(19.44)
        }
        self.newStudyText.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(62)
            $0.centerX.equalToSuperview()
        }
        self.mainScrollView.snp.makeConstraints{
            $0.top.equalTo(self.makeStudyText.snp.bottom).offset(0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        self.mainView.snp.makeConstraints{
            $0.top.equalTo(self.mainScrollView.snp.top).offset(36)
            $0.leading.equalTo(self.mainScrollView.snp.leading).offset(30)
            $0.trailing.equalTo(self.mainScrollView.snp.trailing).offset(-30)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(700)
        }
        
        self.makeStudyText.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(182)
            $0.leading.equalTo(self.view.snp.leading).offset(30)
        }
        self.setLanguageText.snp.makeConstraints{
            $0.top.equalTo(self.mainView.snp.top).offset(12)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.setLanguageDropView.snp.makeConstraints{
            $0.top.equalTo(self.mainView.snp.top).offset(5)
            $0.leading.equalTo(self.setLanguageText.snp.trailing).offset(10)
            $0.width.equalTo(83)
            $0.height.equalTo(29)
        }
        self.ivIcon1.snp.makeConstraints{
            $0.top.equalTo(self.setLanguageDropView.snp.top).offset(15)
            $0.trailing.equalTo(self.setLanguageDropView.snp.trailing).offset(-13)
            $0.width.equalTo(6)
            $0.height.equalTo(3)
        }
        self.setLevelText.snp.makeConstraints{
            $0.top.equalTo(self.setLanguageText.snp.bottom).offset(45)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.setLevelText2.snp.makeConstraints{
            $0.top.equalTo(self.setLanguageText.snp.bottom).offset(71)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.level1.snp.makeConstraints{
            $0.top.equalTo(self.setLevelText.snp.bottom).offset(35)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(21)
            $0.height.equalTo(21)
        }
        self.level2.snp.makeConstraints{
            $0.top.equalTo(self.setLevelText.snp.bottom).offset(35)
            $0.leading.equalTo(self.level1.snp.trailing).offset(17)
            $0.width.equalTo(21)
            $0.height.equalTo(21)
        }
        self.level3.snp.makeConstraints{
            $0.top.equalTo(self.setLevelText.snp.bottom).offset(35)
            $0.leading.equalTo(self.level2.snp.trailing).offset(17)
            $0.width.equalTo(21)
            $0.height.equalTo(21)
        }
        self.level4.snp.makeConstraints{
            $0.top.equalTo(self.setLevelText.snp.bottom).offset(35)
            $0.leading.equalTo(self.level3.snp.trailing).offset(17)
            $0.width.equalTo(21)
            $0.height.equalTo(21)
        }
        self.level5.snp.makeConstraints{
            $0.top.equalTo(self.setLevelText.snp.bottom).offset(35)
            $0.leading.equalTo(self.level4.snp.trailing).offset(17)
            $0.width.equalTo(21)
            $0.height.equalTo(21)
        }
        self.goalText.snp.makeConstraints{
            $0.top.equalTo(self.setLanguageDropView.snp.bottom).offset(181)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.testNameDropView.snp.makeConstraints{
            $0.top.equalTo(self.goalText.snp.bottom).offset(33)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(83)
            $0.height.equalTo(29)
        }
        self.ivIcon2.snp.makeConstraints{
            $0.top.equalTo(self.testNameDropView.snp.top).offset(15)
            $0.trailing.equalTo(self.testNameDropView.snp.trailing).offset(-13)
            $0.width.equalTo(6)
            $0.height.equalTo(3)
        }
        self.testLevelDropView.snp.makeConstraints{
            $0.top.equalTo(self.goalText.snp.bottom).offset(33)
            $0.leading.equalTo(self.testNameDropView.snp.trailing).offset(12)
            $0.width.equalTo(83)
            $0.height.equalTo(29)
        }
        self.ivIcon3.snp.makeConstraints{
            $0.top.equalTo(self.testLevelDropView.snp.top).offset(15)
            $0.trailing.equalTo(self.testLevelDropView.snp.trailing).offset(-13)
            $0.width.equalTo(6)
            $0.height.equalTo(3)
        }
        self.theNumberOfMemText.snp.makeConstraints{
            $0.top.equalTo(self.testNameDropView.snp.bottom).offset(45)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.whenText.snp.makeConstraints{
            $0.top.equalTo(self.theNumberOfMemText.snp.bottom).offset(111)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.offLineText.snp.makeConstraints{
            $0.top.equalTo(self.whenText.snp.bottom).offset(137)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.whereDropView.snp.makeConstraints{
            $0.top.equalTo(self.testNameDropView.snp.bottom).offset(381)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.ivIcon4.snp.makeConstraints{
            $0.top.equalTo(self.whereDropView.snp.top).offset(15)
            $0.trailing.equalTo(self.whereDropView.snp.trailing).offset(-13)
            $0.width.equalTo(6)
            $0.height.equalTo(3)
        }
    }
    
//MARK: - Target
    func addTarget(){
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        arrowLeft.isUserInteractionEnabled = true
        arrowLeft.addGestureRecognizer(backBtn)
        self.setLanguageDropView.addTarget(self, action: #selector(self.setLanguageClicked(_:)), for: .touchUpInside)
        self.testNameDropView.addTarget(self, action: #selector(self.testNameClicked(_:)), for: .touchUpInside)
        self.testLevelDropView.addTarget(self, action: #selector(self.testLevelClicked(_:)), for: .touchUpInside)
        self.whereDropView.addTarget(self, action: #selector(self.whereClicked(_:)), for: .touchUpInside)
    }
}
