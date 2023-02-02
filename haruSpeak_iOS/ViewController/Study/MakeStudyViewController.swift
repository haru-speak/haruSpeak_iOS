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
        $0.backgroundColor = .white
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
    
    // 질문 1
    let setLanguageText = UILabel().then{
        $0.text = "스터디할 언어를 설정해주세요"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.textColor = .black
    }
    var setLanguageDropView = UIButton().then{
        $0.setTitle("영어", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
    }
    let setLanguageDropDown = DropDown()
    let setLanguage = ["영어", "한국어"]
    let ivIcon1 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    let line1 = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    
    // 질문 2
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
    
    //질문 2 _level button
    let level1 = UIButton().then{
        $0.setTitle("1", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.layer.cornerRadius = 10
    }
    let level2 = UIButton().then{
        $0.setTitle("2", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.layer.cornerRadius = 10
    }
    let level3 = UIButton().then{
        $0.setTitle("3", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.layer.cornerRadius = 10
    }
    let level4 = UIButton().then{
        $0.setTitle("4", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.layer.cornerRadius = 10
    }
    let level5 = UIButton().then{
        $0.setTitle("5", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
        $0.layer.cornerRadius = 10
    }
    let line2 = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    
    //질문 3
    let goalText = UILabel().then{
        $0.text = "목표로 하는 스피킹 시험이 있나요?"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textColor = .black
    }
    let noGoal  = UIImageView().then{
        $0.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
    }
    let noGoalText = UILabel().then{
        $0.text = "없음"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    
    var testNameDropView = UIButton().then{
        $0.setTitle("시험", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
    }
    let testNameDropDown = DropDown()
    let testName = ["TOFEL","OPIc", "TOEIC Speaking"]
    
    var testLevelDropView = UIButton().then{
        $0.setTitle("등급", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
    }
    let testLevelDropDown = DropDown()
    let testLevel = ["AL", "IH", "IM"]
    let ivIcon2 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    let ivIcon3 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    let line3 = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    let line4 = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    
    //질문 4
    let theNumberOfMemText = UILabel().then{
        $0.text = "모집할 스터디 멤버의 정원을 설정해주세요"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textColor = .black
    }
    let noLimit  = UIImageView().then{
        $0.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
    }
    let noLimitText = UILabel().then{
        $0.text = "제한없음"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let minimum = UILabel().then{
        $0.text = "5명"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let maximum = UILabel().then{
        $0.text = "30명"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    //질문 4 _slider
    private let slider: Slider = {
        let slider = Slider()
        slider.minValue = 1
        slider.maxValue = 30
        slider.lower = 1
        slider.upper = 30
        slider.lowerThumbColor = .mainColor
        slider.upperThumbColor = .mainColor
        
        slider.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        return slider
    }()
    
    
    //질문 5
    let whenText = UILabel().then{
        $0.text = "스터디 활동 주기를 설정해주세요"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textColor = .black
    }
    //질문 5 _요일 선택
    let mon = UIButton().then{
        $0.setTitle("월", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:15)
        $0.layer.cornerRadius = 14
    }
    let tue = UIButton().then{
        $0.setTitle("화", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:15)
        $0.layer.cornerRadius = 14
    }
    let wed = UIButton().then{
        $0.setTitle("수", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:15)
        $0.layer.cornerRadius = 14
    }
    let thur = UIButton().then{
        $0.setTitle("목", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:15)
        $0.layer.cornerRadius = 14
    }
    let fri = UIButton().then{
        $0.setTitle("금", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:15)
        $0.layer.cornerRadius = 14
    }
    let sat = UIButton().then{
        $0.setTitle("토", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:15)
        $0.layer.cornerRadius = 14
    }
    let sun = UIButton().then{
        $0.setTitle("일", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:15)
        $0.layer.cornerRadius = 14
    }
    var perWeek = 0
    let perWeekLabel = UILabel().then{
        $0.text = ""
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let line5 = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    
    
    
    //질문 6
    let offLineText = UILabel().then{
        $0.text = "대면 스터디를 병행하시나요?"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
        $0.textColor = .black
    }
    let offyes = UIButton().then{
        $0.setTitle("예", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:15)
        $0.layer.cornerRadius = 14
    }
    let offno = UIButton().then{
        $0.setTitle("아니요", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:15)
        $0.layer.cornerRadius = 14
    }
    
    var whereDropView = UIButton().then{
        $0.setTitle("지역", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Regular", size:13)
    }
    let whereDropDown = DropDown()
    let whereList = ["서울", "수원", "인천", "대구", "부산"]
    let ivIcon4 = UIImageView().then{
        $0.image = UIImage(named: "dropDownVector")?.withRenderingMode(.alwaysOriginal)
    }
    let line6 = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    
    let middleline = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    
    //스터디 디테일 적는 뷰
    let setStudyName = UITextField().then{
        $0.textColor = .black
        $0.placeholder = "내용을 입력하세요 (목표, 시간, 진행방식 등)"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:14)
    }
    let line7 = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    let setStudyDetail = UITextView().then{
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size:14)
    }
    let setStudyDetailLabel = UILabel().then{
        $0.text = "내용을 입력하세요 (목표, 시간, 진행방식 등)"
        $0.textColor = .lightGray
    }
    let middleline2 = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    let thumbnailView = UIImageView().then{
        $0.backgroundColor = .lightGray
    }
    let thumbnailLabel = UILabel().then{
        $0.text = "썸네일 이미지를 설정해주세요"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:16)
        $0.textColor = .white
    }
    let thumbnailLabelImg = UIImageView().then{
        $0.image = UIImage(named: "image")?.withRenderingMode(.alwaysOriginal)
    }
    
    let uploadButton = UIButton(type: .system).then{
        $0.setTitle("업로드", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .mainColor
        
    }
    
    
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
        self.mainView.addSubview(self.noGoal)
        self.mainView.addSubview(self.noGoalText)
        self.mainView.addSubview(self.noLimit)
        self.mainView.addSubview(self.noLimitText)
        self.mainView.addSubview(self.minimum)
        self.mainView.addSubview(self.maximum)
        self.mainView.addSubview(self.slider)
        self.mainView.addSubview(self.mon)
        self.mainView.addSubview(self.tue)
        self.mainView.addSubview(self.wed)
        self.mainView.addSubview(self.thur)
        self.mainView.addSubview(self.fri)
        self.mainView.addSubview(self.sat)
        self.mainView.addSubview(self.sun)
        self.mainView.addSubview(self.perWeekLabel)
        self.mainView.addSubview(self.offyes)
        self.mainView.addSubview(self.offno)
        self.mainView.addSubview(self.middleline)
        self.mainView.addSubview(self.line1)
        self.mainView.addSubview(self.line2)
        self.mainView.addSubview(self.line3)
        self.mainView.addSubview(self.line4)
        self.mainView.addSubview(self.line5)
        self.mainView.addSubview(self.line6)
        self.mainView.addSubview(self.line7)
        self.mainView.addSubview(self.setStudyName)
        self.mainView.addSubview(self.setStudyDetail)
        self.mainView.addSubview(self.setStudyDetailLabel)
        self.mainView.addSubview(self.middleline2)
        self.mainView.addSubview(self.thumbnailView)
        self.thumbnailView.addSubview(self.thumbnailLabel)
        self.thumbnailView.addSubview(self.thumbnailLabelImg)
        self.mainView.addSubview(self.uploadButton)
        
    }
    
    //MARK: - Selector
    @objc func backTapped(){
        let VC1 = DeleteMakeStudyViewController()
        VC1.modalPresentationStyle = .overCurrentContext
        present(VC1, animated: false)
    }
    @objc func setLanguageClicked(_ button: UIButton) {
        setLanguageDropDown.show()
    }
    @objc func testNameClicked(_ button: UIButton) {
        testNameDropDown.show()
    }
    @objc func testLevelClicked(_ button: UIButton) {
        testLevelDropDown.show()
    }
    @objc func whereClicked(_ button: UIButton) {
        whereDropDown.show()
    }
    @objc func level1Clicked(_ button: UIButton) {
        self.level1.backgroundColor = .mainColor
        self.level1.setTitleColor(.white, for: .normal)
        self.level2.backgroundColor = .white
        self.level2.setTitleColor(.lightGray, for: .normal)
        self.level3.backgroundColor = .white
        self.level3.setTitleColor(.lightGray, for: .normal)
        self.level4.backgroundColor = .white
        self.level4.setTitleColor(.lightGray, for: .normal)
        self.level5.backgroundColor = .white
        self.level5.setTitleColor(.lightGray, for: .normal)
    }
    @objc func level2Clicked(_ button: UIButton) {
        self.level1.backgroundColor = .white
        self.level1.setTitleColor(.lightGray, for: .normal)
        self.level2.backgroundColor = .mainColor
        self.level2.setTitleColor(.white, for: .normal)
        self.level3.backgroundColor = .white
        self.level3.setTitleColor(.lightGray, for: .normal)
        self.level4.backgroundColor = .white
        self.level4.setTitleColor(.lightGray, for: .normal)
        self.level5.backgroundColor = .white
        self.level5.setTitleColor(.lightGray, for: .normal)
    }
    @objc func level3Clicked(_ button: UIButton) {
        self.level1.backgroundColor = .white
        self.level1.setTitleColor(.lightGray, for: .normal)
        self.level2.backgroundColor = .white
        self.level2.setTitleColor(.lightGray, for: .normal)
        self.level3.backgroundColor = .mainColor
        self.level3.setTitleColor(.white, for: .normal)
        self.level4.backgroundColor = .white
        self.level4.setTitleColor(.lightGray, for: .normal)
        self.level5.backgroundColor = .white
        self.level5.setTitleColor(.lightGray, for: .normal)
    }
    @objc func level4Clicked(_ button: UIButton) {
        self.level1.backgroundColor = .white
        self.level1.setTitleColor(.lightGray, for: .normal)
        self.level2.backgroundColor = .white
        self.level2.setTitleColor(.lightGray, for: .normal)
        self.level3.backgroundColor = .white
        self.level3.setTitleColor(.lightGray, for: .normal)
        self.level4.backgroundColor = .mainColor
        self.level4.setTitleColor(.white, for: .normal)
        self.level5.backgroundColor = .white
        self.level5.setTitleColor(.lightGray, for: .normal)
    }
    @objc func level5Clicked(_ button: UIButton) {
        self.level1.backgroundColor = .white
        self.level1.setTitleColor(.lightGray, for: .normal)
        self.level2.backgroundColor = .white
        self.level2.setTitleColor(.lightGray, for: .normal)
        self.level3.backgroundColor = .white
        self.level3.setTitleColor(.lightGray, for: .normal)
        self.level4.backgroundColor = .white
        self.level4.setTitleColor(.lightGray, for: .normal)
        self.level5.backgroundColor = .mainColor
        self.level5.setTitleColor(.white, for: .normal)
    }
    
    @objc func noGoalClicked(){
        if noGoal.image == UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal){
            noGoal.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
            self.noGoalText.textColor = .lightGray
            self.testNameDropView.isHidden = false
            self.testLevelDropView.isHidden = false
            self.line4.isHidden = false
            self.ivIcon2.isHidden = false
            self.line3.isHidden = false
            self.ivIcon3.isHidden = false
        }
        else{
            noGoal.image = UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal)
            self.noGoalText.textColor = .mainColor
            self.testNameDropView.isHidden = true
            self.testLevelDropView.isHidden = true
            self.line4.isHidden = true
            self.ivIcon2.isHidden = true
            self.line3.isHidden = true
            self.ivIcon3.isHidden = true
            self.testNameDropView.setTitle("시험", for: .normal)
            self.testNameDropView.setTitleColor(.lightGray, for: .normal)
            self.testLevelDropView.setTitle("등급", for: .normal)
            self.testLevelDropView.setTitleColor(.lightGray, for: .normal)
            
        }
    }
    
    @objc func noLimitClicked(){
        if noLimit.image == UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal){
            noLimit.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
            self.slider.isHidden = false
            self.minimum.isHidden = false
            self.maximum.isHidden = false
            self.noLimitText.textColor = .lightGray
            self.minimum.textColor = .black
            self.maximum.textColor = .black
            self.slider.upperThumbColor = .mainColor
            self.slider.lowerThumbColor = .mainColor
            self.slider.trackTintColor = .mainColor
            
        }
        else{
            noLimit.image = UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal)
            self.slider.isHidden = true
            self.minimum.isHidden = true
            self.maximum.isHidden = true
            self.noLimitText.textColor = .mainColor
            self.minimum.textColor = .lightGray
            self.maximum.textColor = .lightGray
            self.slider.upperThumbColor = .lightGray
            self.slider.lowerThumbColor = .lightGray
            self.slider.trackColor = .lightGray
            self.slider.trackTintColor = .lightGray
        }
    }
    @objc private func changeValue() {
        self.minimum.text = "\(Int(self.slider.lower))명"
        self.maximum.text = "\(Int(self.slider.upper))명"
    }
    
    @objc func monClicked(_ button: UIButton){
        if self.mon.backgroundColor == .mainColor{
            if perWeek != 0{
                perWeek -= 1
            }
            self.mon.backgroundColor = .white
            self.mon.setTitleColor(.lightGray, for: .normal)
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.mon.backgroundColor = .mainColor
            self.mon.setTitleColor(.white, for: .normal)
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회,"
    }
    @objc func tueClicked(_ button: UIButton){
        if self.tue.backgroundColor == .mainColor{
            if perWeek != 0{
                perWeek -= 1
            }
            self.tue.backgroundColor = .white
            self.tue.setTitleColor(.lightGray, for: .normal)
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.tue.backgroundColor = .mainColor
            self.tue.setTitleColor(.white, for: .normal)
            
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회,"
    }
    @objc func wedClicked(_ button: UIButton){
        if self.wed.backgroundColor == .mainColor{
            if perWeek != 0{
                perWeek -= 1
            }
            self.wed.backgroundColor = .white
            self.wed.setTitleColor(.lightGray, for: .normal)
            
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.wed.backgroundColor = .mainColor
            self.wed.setTitleColor(.white, for: .normal)
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회,"
    }
    @objc func thurClicked(_ button: UIButton){
        if self.thur.backgroundColor == .mainColor{
            perWeek -= 1
            self.thur.backgroundColor = .white
            self.thur.setTitleColor(.lightGray, for: .normal)
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.thur.backgroundColor = .mainColor
            self.thur.setTitleColor(.white, for: .normal)
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회,"
    }
    @objc func friClicked(_ button: UIButton){
        if self.fri.backgroundColor == .mainColor{
            if perWeek != 0{
                perWeek -= 1
            }
            self.fri.backgroundColor = .white
            self.fri.setTitleColor(.lightGray, for: .normal)
            
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.fri.backgroundColor = .mainColor
            self.fri.setTitleColor(.white, for: .normal)
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회,"
    }
    @objc func satClicked(_ button: UIButton){
        if self.sat.backgroundColor == .mainColor{
            if perWeek != 0{
                perWeek -= 1
            }
            self.sat.backgroundColor = .white
            self.sat.setTitleColor(.white, for: .normal)
            
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.sat.backgroundColor = .mainColor
            self.sat.setTitleColor(.white, for: .normal)
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회,"
    }
    @objc func sunClicked(_ button: UIButton){
        if self.sun.backgroundColor == .mainColor{
            if perWeek != 0{
                perWeek -= 1
            }
            self.sun.backgroundColor = .white
            self.sun.setTitleColor(.lightGray, for: .normal)
            
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.sun.backgroundColor = .mainColor
            self.sun.setTitleColor(.white, for: .normal)
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회,"
    }
    
    @objc func offyesClicked(_ button: UIButton) {
        self.offyes.backgroundColor = .mainColor
        self.offyes.setTitleColor(.white, for: .normal)
        self.offno.backgroundColor = .white
        self.offno.setTitleColor(.lightGray, for: .normal)
        self.whereDropView.isHidden = false
        self.line6.isHidden = false
        self.ivIcon4.isHidden = false
    }
    
    @objc func offnoClicked(_ button: UIButton) {
        self.offno.backgroundColor = .mainColor
        self.offno.setTitleColor(.white, for: .normal)
        self.offyes.backgroundColor = .white
        self.offyes.setTitleColor(.lightGray, for: .normal)
        self.whereDropView.isHidden = true
        self.line6.isHidden = true
        self.ivIcon4.isHidden = true
        self.whereDropView.setTitle("지역", for: .normal)
        self.whereDropView.setTitleColor(.lightGray, for: .normal)
    }
    @objc func setStudyDetailClicked(){
        self.setStudyDetailLabel.isHidden = true
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
            self.setLanguageDropView.setTitleColor(.black, for: .normal)
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
            self.testNameDropView.setTitleColor(.black, for: .normal)
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
            self.testLevelDropView.setTitleColor(.black, for: .normal)
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
            self.whereDropView.setTitleColor(.black, for: .normal)
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
            $0.top.equalTo(self.makeStudyText.snp.bottom).offset(36)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        self.mainView.snp.makeConstraints{
            $0.width.equalTo(330)
            $0.top.equalTo(self.mainScrollView.snp.top).offset(0)
            $0.leading.equalTo(self.mainScrollView.snp.leading).offset(30)
            $0.trailing.equalTo(self.mainScrollView.snp.trailing).offset(-30)
            $0.bottom.equalToSuperview()
            $0.size.height.equalTo(1350)
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
            $0.leading.equalTo(self.level1.snp.trailing).offset(13)
            $0.width.equalTo(21)
            $0.height.equalTo(21)
        }
        self.level3.snp.makeConstraints{
            $0.top.equalTo(self.setLevelText.snp.bottom).offset(35)
            $0.leading.equalTo(self.level2.snp.trailing).offset(13)
            $0.width.equalTo(21)
            $0.height.equalTo(21)
        }
        self.level4.snp.makeConstraints{
            $0.top.equalTo(self.setLevelText.snp.bottom).offset(35)
            $0.leading.equalTo(self.level3.snp.trailing).offset(13)
            $0.width.equalTo(21)
            $0.height.equalTo(21)
        }
        self.level5.snp.makeConstraints{
            $0.top.equalTo(self.setLevelText.snp.bottom).offset(35)
            $0.leading.equalTo(self.level4.snp.trailing).offset(13)
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
        self.noGoal.snp.makeConstraints{
            $0.bottom.equalTo(self.testNameDropView.snp.top).offset(-7)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(16)
            $0.height.equalTo(16)
        }
        self.noGoalText.snp.makeConstraints{
            $0.bottom.equalTo(self.testNameDropView.snp.top).offset(-7)
            $0.leading.equalTo(self.noGoal.snp.trailing).offset(6)
        }
        
        self.theNumberOfMemText.snp.makeConstraints{
            $0.top.equalTo(self.testNameDropView.snp.bottom).offset(45)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.noLimit.snp.makeConstraints{
            $0.top.equalTo(self.testNameDropView.snp.bottom).offset(88)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(16)
            $0.height.equalTo(16)
        }
        self.noLimitText.snp.makeConstraints{
            $0.top.equalTo(self.testNameDropView.snp.bottom).offset(88)
            $0.leading.equalTo(self.noGoal.snp.trailing).offset(6)
        }
        self.minimum.snp.makeConstraints{
            $0.top.equalTo(self.noLimit.snp.bottom).offset(15)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.maximum.snp.makeConstraints{
            $0.top.equalTo(self.noLimit.snp.bottom).offset(15)
            $0.trailing.equalTo(self.mainView.snp.trailing).offset(0)
        }
        self.slider.snp.makeConstraints{
            $0.top.equalTo(self.noLimit.snp.bottom).offset(15)
            $0.width.equalTo(267)
            $0.height.equalTo(20)
            $0.centerX.equalToSuperview()
        }
        
        self.whenText.snp.makeConstraints{
            $0.top.equalTo(self.theNumberOfMemText.snp.bottom).offset(111)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.mon.snp.makeConstraints{
            $0.top.equalTo(self.whenText.snp.bottom).offset(17)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.tue.snp.makeConstraints{
            $0.top.equalTo(self.whenText.snp.bottom).offset(17)
            $0.leading.equalTo(self.mon.snp.trailing).offset(30)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.wed.snp.makeConstraints{
            $0.top.equalTo(self.whenText.snp.bottom).offset(17)
            $0.leading.equalTo(self.tue.snp.trailing).offset(30)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.thur.snp.makeConstraints{
            $0.top.equalTo(self.whenText.snp.bottom).offset(17)
            $0.leading.equalTo(self.wed.snp.trailing).offset(30)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.fri.snp.makeConstraints{
            $0.top.equalTo(self.whenText.snp.bottom).offset(17)
            $0.leading.equalTo(self.thur.snp.trailing).offset(30)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.sat.snp.makeConstraints{
            $0.top.equalTo(self.whenText.snp.bottom).offset(17)
            $0.leading.equalTo(self.fri.snp.trailing).offset(30)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.sun.snp.makeConstraints{
            $0.top.equalTo(self.whenText.snp.bottom).offset(17)
            $0.leading.equalTo(self.sat.snp.trailing).offset(30)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.perWeekLabel.snp.makeConstraints{
            $0.bottom.equalTo(self.line5.snp.bottom).offset(-5)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        
        self.offLineText.snp.makeConstraints{
            $0.top.equalTo(self.whenText.snp.bottom).offset(137)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.offyes.snp.makeConstraints{
            $0.top.equalTo(self.whenText.snp.bottom).offset(133)
            $0.leading.equalTo(self.offLineText.snp.trailing).offset(46)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
        self.offno.snp.makeConstraints{
            $0.top.equalTo(self.whenText.snp.bottom).offset(133)
            $0.leading.equalTo(self.offyes.snp.trailing).offset(8)
            $0.width.equalTo(52)
            $0.height.equalTo(30)
        }
        self.whereDropView.snp.makeConstraints{
            $0.top.equalTo(self.testNameDropView.snp.bottom).offset(381)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(83)
            $0.height.equalTo(29)
        }
        self.ivIcon4.snp.makeConstraints{
            $0.top.equalTo(self.whereDropView.snp.top).offset(15)
            $0.trailing.equalTo(self.whereDropView.snp.trailing).offset(-13)
            $0.width.equalTo(6)
            $0.height.equalTo(3)
        }
        
        self.middleline.snp.makeConstraints{
            $0.top.equalTo(self.whereDropView.snp.bottom).offset(45)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(391)
            $0.height.equalTo(8)
        }
        self.line1.snp.makeConstraints{
            $0.top.equalTo(self.setLanguageDropView.snp.bottom).offset(0)
            $0.leading.equalTo(self.setLanguageText.snp.trailing).offset(10)
            $0.width.equalTo(83)
            $0.height.equalTo(1)
        }
        self.line2.snp.makeConstraints{
            $0.top.equalTo(self.level1.snp.bottom).offset(10)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(162)
            $0.height.equalTo(1)
        }
        self.line3.snp.makeConstraints{
            $0.top.equalTo(self.testNameDropView.snp.bottom).offset(0)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(83)
            $0.height.equalTo(1)
        }
        self.line4.snp.makeConstraints{
            $0.top.equalTo(self.testLevelDropView.snp.bottom).offset(0)
            $0.leading.equalTo(self.testNameDropView.snp.trailing).offset(12)
            $0.width.equalTo(83)
            $0.height.equalTo(1)
        }
        self.line5.snp.makeConstraints{
            $0.top.equalTo(self.whereDropView.snp.bottom).offset(-108)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(110)
            $0.height.equalTo(1)
        }
        self.line6.snp.makeConstraints{
            $0.top.equalTo(self.whereDropView.snp.bottom).offset(0)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(100)
            $0.height.equalTo(1)
        }
        self.setStudyName.snp.makeConstraints{
            $0.top.equalTo(self.middleline.snp.bottom).offset(26)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(330)
        }
        self.setStudyDetail.snp.makeConstraints{
            $0.top.equalTo(self.middleline.snp.bottom).offset(83)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(330)
            $0.height.equalTo(150)
        }
        self.setStudyDetailLabel.snp.makeConstraints{
            $0.top.equalTo(self.middleline.snp.bottom).offset(83)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
        }
        self.line7.snp.makeConstraints{
            $0.top.equalTo(self.middleline.snp.bottom).offset(57)
            $0.leading.equalTo(self.mainView.snp.leading).offset(0)
            $0.width.equalTo(330)
            $0.height.equalTo(1)
        }
        self.middleline2.snp.makeConstraints{
            $0.top.equalTo(self.line7.snp.bottom).offset(231)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(391)
            $0.height.equalTo(8)
        }
        self.thumbnailView.snp.makeConstraints{
            $0.top.equalTo(self.middleline2.snp.bottom).offset(0)
            $0.leading.trailing.equalTo(self.mainScrollView)
            $0.height.equalTo(152)
        }
        self.thumbnailLabel.snp.makeConstraints{
            $0.top.equalTo(self.thumbnailView.snp.top).offset(16)
            $0.leading.equalTo(self.thumbnailView.snp.leading).offset(30)
        }
        self.thumbnailLabelImg.snp.makeConstraints{
            $0.top.equalTo(self.thumbnailView.snp.top).offset(16)
            $0.leading.equalTo(self.thumbnailLabel.snp.trailing).offset(12)
        }
        self.uploadButton.snp.makeConstraints{
            $0.top.equalTo(self.thumbnailView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(332)
            $0.height.equalTo(45)
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
        self.level1.addTarget(self, action: #selector(self.level1Clicked(_:)), for: .touchUpInside)
        self.level2.addTarget(self, action: #selector(self.level2Clicked(_:)), for: .touchUpInside)
        self.level3.addTarget(self, action: #selector(self.level3Clicked(_:)), for: .touchUpInside)
        self.level4.addTarget(self, action: #selector(self.level4Clicked(_:)), for: .touchUpInside)
        self.level5.addTarget(self, action: #selector(self.level5Clicked(_:)), for: .touchUpInside)
        let noGoalBtn = UITapGestureRecognizer(target: self, action: #selector(noGoalClicked))
        noGoal.isUserInteractionEnabled = true
        noGoal.addGestureRecognizer(noGoalBtn)
        let noLimitBtn = UITapGestureRecognizer(target: self, action: #selector(noLimitClicked))
        noLimit.isUserInteractionEnabled = true
        noLimit.addGestureRecognizer(noLimitBtn)
        self.mon.addTarget(self, action: #selector(self.monClicked(_:)), for: .touchUpInside)
        self.tue.addTarget(self, action: #selector(self.tueClicked(_:)), for: .touchUpInside)
        self.wed.addTarget(self, action: #selector(self.wedClicked(_:)), for: .touchUpInside)
        self.thur.addTarget(self, action: #selector(self.thurClicked(_:)), for: .touchUpInside)
        self.fri.addTarget(self, action: #selector(self.friClicked(_:)), for: .touchUpInside)
        self.sat.addTarget(self, action: #selector(self.satClicked(_:)), for: .touchUpInside)
        self.sun.addTarget(self, action: #selector(self.sunClicked(_:)), for: .touchUpInside)
        self.offyes.addTarget(self, action: #selector(self.offyesClicked(_:)), for: .touchUpInside)
        self.offno.addTarget(self, action: #selector(self.offnoClicked(_:)), for: .touchUpInside)
        let detailBtn = UITapGestureRecognizer(target: self, action: #selector(setStudyDetailClicked))
        setStudyDetail.isUserInteractionEnabled = true
        setStudyDetail.addGestureRecognizer(detailBtn)
    }
}
