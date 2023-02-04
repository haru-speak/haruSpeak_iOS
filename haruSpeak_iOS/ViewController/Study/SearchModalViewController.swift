//
//  SearchModalViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/03.
//

import Foundation
import UIKit
import SnapKit
import Then

class SearchModalViewController: UIViewController{
    
    //MARK: - Properties
    
    let popView = UIView().then{
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    let line = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    let topView = UIView()
    let langLabel = UILabel().then{
        $0.text = "언어"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:16)
        $0.textColor = .lightGray
    }
    let levLabel = UILabel().then{
        $0.text = "레벨"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:16)
        $0.textColor = .lightGray
    }
    let testLabel = UILabel().then{
        $0.text = "자격증"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:16)
        $0.textColor = .lightGray
    }
    let memLabel = UILabel().then{
        $0.text = "모집인원"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:16)
        $0.textColor = .lightGray
    }
    let cycleLabel = UILabel().then{
        $0.text = " 주 회"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:16)
        $0.textColor = .lightGray
    }
    let offLabel = UILabel().then{
        $0.text = "대면"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:16)
        $0.textColor = .lightGray
    }
   //체크박스
    let checkBox1  = UIImageView().then{
        $0.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
    }
    let checkBoxTxt1 = UILabel().then{
        $0.text = "영어"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
        $0.textColor = .lightGray
    }
    let checkBox2  = UIImageView().then{
        $0.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
        $0.isHidden = true
    }
    let checkBoxTxt2 = UILabel().then{
        $0.text = "한국어"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
        $0.textColor = .lightGray
        $0.isHidden = true
    }
    let checkBox3  = UIImageView().then{
        $0.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
        $0.isHidden = true
    }
    let checkBoxTxt3 = UILabel().then{
        $0.text = "Lv.3"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
        $0.isHidden = true
        $0.textColor = .lightGray
    }
    let checkBox4  = UIImageView().then{
        $0.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
        $0.isHidden = true
    }
    let checkBoxTxt4 = UILabel().then{
        $0.text = "Lv.4"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
        $0.isHidden = true
        $0.textColor = .lightGray
    }
    let checkBox5  = UIImageView().then{
        $0.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
        $0.isHidden = true
    }
    let checkBoxTxt5 = UILabel().then{
        $0.text = "Lv.5"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
        $0.isHidden = true
        $0.textColor = .lightGray
    }
    let line1 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.isHidden = true
    }
    let line2 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.isHidden = true
    }
    let line3 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.isHidden = true
    }
    let line4 = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.isHidden = true
    }
    //모집인원 slider
    let minimum = UILabel().then{
        $0.text = "5명"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isHidden = true
    }
    let maximum = UILabel().then{
        $0.text = "30명"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isHidden = true
    }
    private let slider: Slider = {
        let slider = Slider()
        slider.minValue = 1
        slider.maxValue = 30
        slider.lower = 5
        slider.upper = 30
        slider.lowerThumbColor = .mainColor
        slider.upperThumbColor = .mainColor

        return slider
    }().then{
        $0.isHidden = true
    }
    
    //요일 버튼
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
    let dayLabel = UILabel().then{
        $0.text = ""
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
    }
    let line5 = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    var day = [0,0,0,0,0,0,0]
    let dayText = ["월 ","화 ","수 ","목 ","금 ","토 ","일 "]
    
    //맨 밑 버튼
    let resetImg = UIImageView().then{
        $0.image = UIImage(named: "reset")?.withRenderingMode(.alwaysOriginal)
    }
    let resetTxt = UILabel().then{
        $0.textColor = .lightGray
        $0.text = "재설정"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
    }
    
    let resetButton = UIButton(type: .system).then{
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .systemGray6
    }
    
    let searchButton = UIButton(type: .system).then{
        $0.setTitle("382개 스터디", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .mainColor
    }
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        let SearchVC = SearchStudyViewController()
        SearchVC.delegate = self
        self.view.backgroundColor = .black.withAlphaComponent(0.3)
        setUpView()
        layout()
        addTarget()
    }
    
    //MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.popView)
        self.popView.addSubview(self.topView)
        self.topView.addSubview(self.langLabel)
        self.topView.addSubview(self.levLabel)
        self.topView.addSubview(self.testLabel)
        self.topView.addSubview(self.memLabel)
        self.topView.addSubview(self.cycleLabel)
        self.topView.addSubview(self.offLabel)
        self.popView.addSubview(self.line)
        //checkBox
        self.popView.addSubview(self.checkBox1)
        self.popView.addSubview(self.checkBoxTxt1)
        self.popView.addSubview(self.checkBox2)
        self.popView.addSubview(self.checkBoxTxt2)
        self.popView.addSubview(self.checkBox3)
        self.popView.addSubview(self.checkBoxTxt3)
        self.popView.addSubview(self.checkBox4)
        self.popView.addSubview(self.checkBoxTxt4)
        self.popView.addSubview(self.checkBox5)
        self.popView.addSubview(self.checkBoxTxt5)
        self.popView.addSubview(self.line1)
        self.popView.addSubview(self.line2)
        self.popView.addSubview(self.line3)
        self.popView.addSubview(self.line4)
        //slider
        self.popView.addSubview(self.maximum)
        self.popView.addSubview(self.minimum)
        self.popView.addSubview(self.slider)
        self.popView.addSubview(self.resetButton)
        self.resetButton.addSubview(self.resetImg)
        self.resetButton.addSubview(self.resetTxt)
        self.popView .addSubview(self.searchButton)
        //요일
        self.popView.addSubview(self.mon)
        self.popView.addSubview(self.tue)
        self.popView.addSubview(self.wed)
        self.popView.addSubview(self.thur)
        self.popView.addSubview(self.fri)
        self.popView.addSubview(self.sat)
        self.popView.addSubview(self.sun)
        self.popView.addSubview(self.perWeekLabel)
        self.popView.addSubview(self.dayLabel)
        self.popView.addSubview(self.line5)
        
    }
    
    //MARK: - Selector
    @objc private func didClickBack() {
        dismiss(animated: false)
        print("didClickBack")
    }
    
    @objc func langClicked(){
        print("00")
        self.langLabel.textColor = .black
        self.levLabel.textColor = .lightGray
        self.testLabel.textColor = .lightGray
        self.memLabel.textColor = .lightGray
        self.cycleLabel.textColor = .lightGray
        self.offLabel.textColor = .lightGray
        //view isHidden
        
        //checkBox
        self.checkBoxTxt1.text = "영어"
        self.checkBox2.isHidden = false
        self.checkBoxTxt2.isHidden = false
        self.checkBoxTxt2.text = "한국어"
        
        self.checkBox3.isHidden = true
        self.checkBoxTxt3.isHidden = true
        self.checkBox4.isHidden = true
        self.checkBoxTxt4.isHidden = true
        self.checkBox5.isHidden = true
        self.checkBoxTxt5.isHidden = true
        self.line1.isHidden = false
        self.line2.isHidden = true
        self.line3.isHidden = true
        self.line4.isHidden = true
        //slider
        self.maximum.isHidden = true
        self.minimum.isHidden = true
        self.slider.isHidden = true
        
        //요일
        self.mon.isHidden = true
        self.tue.isHidden = true
        self.wed.isHidden = true
        self.thur.isHidden = true
        self.fri.isHidden = true
        self.sat.isHidden = true
        self.sun.isHidden = true
        self.perWeekLabel.isHidden = true
        self.dayLabel.isHidden = true
        self.line5.isHidden = true
        
    }
    @objc func levClicked(){
        print("11")
        self.langLabel.textColor = .lightGray
        self.levLabel.textColor = .black
        self.testLabel.textColor = .lightGray
        self.memLabel.textColor = .lightGray
        self.cycleLabel.textColor = .lightGray
        self.offLabel.textColor = .lightGray
        
        self.checkBoxTxt1.text = "Lv.1"
        self.checkBox2.isHidden = false
        self.checkBoxTxt2.isHidden = false
        self.checkBoxTxt2.text = "Lv.2"
        self.checkBox3.isHidden = false
        self.checkBoxTxt3.isHidden = false
        self.checkBoxTxt3.text = "Lv.3"
        self.checkBox4.isHidden = false
        self.checkBoxTxt4.isHidden = false
        self.checkBoxTxt4.text = "Lv.4"
        self.checkBox5.isHidden = false
        self.checkBoxTxt5.isHidden = false
        self.checkBoxTxt5.text = "Lv.5"
        
        self.line1.isHidden = false
        self.line2.isHidden = false
        self.line3.isHidden = false
        self.line4.isHidden = false
        
        //slider
        self.maximum.isHidden = true
        self.minimum.isHidden = true
        self.slider.isHidden = true

        //요일
        self.mon.isHidden = true
        self.tue.isHidden = true
        self.wed.isHidden = true
        self.thur.isHidden = true
        self.fri.isHidden = true
        self.sat.isHidden = true
        self.sun.isHidden = true
        self.perWeekLabel.isHidden = true
        self.dayLabel.isHidden = true
        self.line5.isHidden = true
    }
    @objc func testClicked(){
        print("22")
        self.langLabel.textColor = .lightGray
        self.levLabel.textColor = .lightGray
        self.testLabel.textColor = .black
        self.memLabel.textColor = .lightGray
        self.cycleLabel.textColor = .lightGray
        self.offLabel.textColor = .lightGray
        
        self.checkBoxTxt1.text = "OPIc"
        self.checkBox2.isHidden = false
        self.checkBoxTxt2.isHidden = false
        self.checkBoxTxt2.text = "TOFEL"
        self.checkBox3.isHidden = false
        self.checkBoxTxt3.isHidden = false
        self.checkBoxTxt3.text = "TOEIC Speaking"
        self.checkBox4.isHidden = true
        self.checkBoxTxt4.isHidden = true
        self.checkBox5.isHidden = true
        self.checkBoxTxt5.isHidden = true
        
        self.line1.isHidden = false
        self.line2.isHidden = false
        self.line3.isHidden = true
        self.line4.isHidden = true
        
        //slider
        self.maximum.isHidden = true
        self.minimum.isHidden = true
        self.slider.isHidden = true

        //요일
        self.mon.isHidden = true
        self.tue.isHidden = true
        self.wed.isHidden = true
        self.thur.isHidden = true
        self.fri.isHidden = true
        self.sat.isHidden = true
        self.sun.isHidden = true
        self.perWeekLabel.isHidden = true
        self.dayLabel.isHidden = true
        self.line5.isHidden = true
    }
    @objc func memClicked(){
        print("33")
        self.langLabel.textColor = .lightGray
        self.levLabel.textColor = .lightGray
        self.testLabel.textColor = .lightGray
        self.memLabel.textColor = .black
        self.cycleLabel.textColor = .lightGray
        self.offLabel.textColor = .lightGray
        
        //checkBox
        self.checkBoxTxt1.text = "제한없음"
        self.checkBox2.isHidden = true
        self.checkBoxTxt2.isHidden = true
        self.checkBox3.isHidden = true
        self.checkBoxTxt3.isHidden = true
        self.checkBox4.isHidden = true
        self.checkBoxTxt4.isHidden = true
        self.checkBox5.isHidden = true
        self.checkBoxTxt5.isHidden = true
        self.line1.isHidden = true
        self.line2.isHidden = true
        self.line3.isHidden = true
        self.line4.isHidden = true
        //slider
        self.maximum.isHidden = false
        self.minimum.isHidden = false
        self.slider.isHidden = false

        //요일
        self.mon.isHidden = true
        self.tue.isHidden = true
        self.wed.isHidden = true
        self.thur.isHidden = true
        self.fri.isHidden = true
        self.sat.isHidden = true
        self.sun.isHidden = true
        self.perWeekLabel.isHidden = true
        self.dayLabel.isHidden = true
        self.line5.isHidden = true
    }
    @objc func cycleClicked(){
        print("44")
        self.langLabel.textColor = .lightGray
        self.levLabel.textColor = .lightGray
        self.testLabel.textColor = .lightGray
        self.memLabel.textColor = .lightGray
        self.cycleLabel.textColor = .black
        self.offLabel.textColor = .lightGray
        
        //checkBox
        self.checkBoxTxt1.text = "매일"
        self.checkBox2.isHidden = true
        self.checkBoxTxt2.isHidden = true
        self.checkBox3.isHidden = true
        self.checkBoxTxt3.isHidden = true
        self.checkBox4.isHidden = true
        self.checkBoxTxt4.isHidden = true
        self.checkBox5.isHidden = true
        self.checkBoxTxt5.isHidden = true
        self.line1.isHidden = true
        self.line2.isHidden = true
        self.line3.isHidden = true
        self.line4.isHidden = true
        //slider
        self.maximum.isHidden = true
        self.minimum.isHidden = true
        self.slider.isHidden = true
        
        //요일
        self.mon.isHidden = false
        self.tue.isHidden = false
        self.wed.isHidden = false
        self.thur.isHidden = false
        self.fri.isHidden = false
        self.sat.isHidden = false
        self.sun.isHidden = false
        self.perWeekLabel.isHidden = false
        self.dayLabel.isHidden = false
        self.line5.isHidden = false
    }
    @objc func offClicked(){
        print("55")
        self.langLabel.textColor = .lightGray
        self.levLabel.textColor = .lightGray
        self.testLabel.textColor = .lightGray
        self.memLabel.textColor = .lightGray
        self.cycleLabel.textColor = .lightGray
        self.offLabel.textColor = .black
        
        //checkBox
        self.checkBoxTxt1.text = "O (대면병행)"
        self.checkBox2.isHidden = false
        self.checkBoxTxt2.isHidden = false
        self.checkBoxTxt2.text = "X"
        
        self.checkBox3.isHidden = true
        self.checkBoxTxt3.isHidden = true
        self.checkBox4.isHidden = true
        self.checkBoxTxt4.isHidden = true
        self.checkBox5.isHidden = true
        self.checkBoxTxt5.isHidden = true
        self.line1.isHidden = false
        self.line2.isHidden = true
        self.line3.isHidden = true
        self.line4.isHidden = true
        //slider
        self.maximum.isHidden = true
        self.minimum.isHidden = true
        self.slider.isHidden = true
        
        //요일
        self.mon.isHidden = true
        self.tue.isHidden = true
        self.wed.isHidden = true
        self.thur.isHidden = true
        self.fri.isHidden = true
        self.sat.isHidden = true
        self.sun.isHidden = true
        self.perWeekLabel.isHidden = true
        self.dayLabel.isHidden = true
        self.line5.isHidden = true
    }
    
    @objc func checkBox1Clicked(){
        if checkBox1.image == UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal){
            checkBox1.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt1.textColor = .lightGray
        }
        else{
            checkBox1.image = UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt1.textColor = .mainColor
        }
    }
    @objc func checkBox2Clicked(){
        if checkBox2.image == UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal){
            checkBox2.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt2.textColor = .lightGray
        }
        else{
            checkBox2.image = UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt2.textColor = .mainColor
        }
    }
    @objc func checkBox3Clicked(){
        if checkBox3.image == UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal){
            checkBox3.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt3.textColor = .lightGray
        }
        else{
            checkBox3.image = UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt3.textColor = .mainColor
        }
    }
    @objc func checkBox4Clicked(){
        if checkBox4.image == UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal){
            checkBox4.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt4.textColor = .lightGray
        }
        else{
            checkBox4.image = UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt4.textColor = .mainColor
        }
    }
    @objc func checkBox5Clicked(){
        if checkBox5.image == UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal){
            checkBox5.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt5.textColor = .lightGray
        }
        else{
            checkBox5.image = UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt5.textColor = .mainColor
        }
    }
    @objc func checkBoxTxt1Clicked(){
        if checkBox1.image == UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal){
            checkBox1.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt1.textColor = .lightGray
        }
        else{
            checkBox1.image = UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt1.textColor = .mainColor
        }
    }
    @objc func checkBoxTxt2Clicked(){
        if checkBox2.image == UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal){
            checkBox2.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt2.textColor = .lightGray
        }
        else{
            checkBox2.image = UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt2.textColor = .mainColor
        }
    }
    @objc func checkBoxTxt3Clicked(){
        if checkBox3.image == UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal){
            checkBox3.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt3.textColor = .lightGray
        }
        else{
            checkBox3.image = UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt3.textColor = .mainColor
        }
    }
    @objc func checkBoxTxt4Clicked(){
        if checkBox4.image == UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal){
            checkBox4.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt4.textColor = .lightGray
        }
        else{
            checkBox4.image = UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt4.textColor = .mainColor
        }
    }
    @objc func checkBoxTxt5Clicked(){
        if checkBox5.image == UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal){
            checkBox5.image = UIImage(named: "checkbox.empty")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt5.textColor = .lightGray
        }
        else{
            checkBox5.image = UIImage(named: "checkbox.fill")?.withRenderingMode(.alwaysOriginal)
            self.checkBoxTxt5.textColor = .mainColor
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
            day[0] = 0
            self.mon.backgroundColor = .white
            self.mon.setTitleColor(.lightGray, for: .normal)
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.mon.backgroundColor = .mainColor
            self.mon.setTitleColor(.white, for: .normal)
            day[0] = 1
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회, "
        dayLabel.text = ""
        printDay()
    }
    @objc func tueClicked(_ button: UIButton){
        if self.tue.backgroundColor == .mainColor{
            if perWeek != 0{
                perWeek -= 1
            }
            self.tue.backgroundColor = .white
            self.tue.setTitleColor(.lightGray, for: .normal)
            day[1] = 0
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.tue.backgroundColor = .mainColor
            self.tue.setTitleColor(.white, for: .normal)
            day[1] = 1
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회, "
        dayLabel.text = ""
        printDay()
    }
    @objc func wedClicked(_ button: UIButton){
        if self.wed.backgroundColor == .mainColor{
            if perWeek != 0{
                perWeek -= 1
            }
            self.wed.backgroundColor = .white
            self.wed.setTitleColor(.lightGray, for: .normal)
            day[2] = 0
            
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.wed.backgroundColor = .mainColor
            self.wed.setTitleColor(.white, for: .normal)
            day[2] = 1
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회, "
        dayLabel.text = ""
        printDay()
    }
    @objc func thurClicked(_ button: UIButton){
        if self.thur.backgroundColor == .mainColor{
            perWeek -= 1
            self.thur.backgroundColor = .white
            self.thur.setTitleColor(.lightGray, for: .normal)
            day[3] = 0
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.thur.backgroundColor = .mainColor
            self.thur.setTitleColor(.white, for: .normal)
            day[3] = 1
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회, "
        dayLabel.text = ""
        printDay()
    }
    @objc func friClicked(_ button: UIButton){
        if self.fri.backgroundColor == .mainColor{
            if perWeek != 0{
                perWeek -= 1
            }
            self.fri.backgroundColor = .white
            self.fri.setTitleColor(.lightGray, for: .normal)
            day[4] = 0
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.fri.backgroundColor = .mainColor
            self.fri.setTitleColor(.white, for: .normal)
            day[4] = 1
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회, "
        dayLabel.text = ""
        printDay()
    }
    @objc func satClicked(_ button: UIButton){
        if self.sat.backgroundColor == .mainColor{
            if perWeek != 0{
                perWeek -= 1
            }
            self.sat.backgroundColor = .white
            self.sat.setTitleColor(.lightGray, for: .normal)
            day[5] = 0
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.sat.backgroundColor = .mainColor
            self.sat.setTitleColor(.white, for: .normal)
            day[5] = 1
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회, "
        dayLabel.text = ""
        printDay()
        
    }
    @objc func sunClicked(_ button: UIButton){
        if self.sun.backgroundColor == .mainColor{
            if perWeek != 0{
                perWeek -= 1
            }
            self.sun.backgroundColor = .white
            self.sun.setTitleColor(.lightGray, for: .normal)
            day[6] = 0
        }
        else{
            if perWeek != 7{
                perWeek += 1
            }
            self.sun.backgroundColor = .mainColor
            self.sun.setTitleColor(.white, for: .normal)
            day[6] = 1
        }
        self.perWeekLabel.text = "주 \(Int(self.perWeek))회, "
        dayLabel.text = ""
        printDay()
    }
    
    func printDay(){
        for i in stride(from: 0, to: 7, by: 1){
            if day[i] == 1{
                dayLabel.text? += dayText[i]
            }
        }
    }
    
    
    
    //MARK: - Layout
    func layout(){
        self.popView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(509)
        }
        self.topView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(25)
            $0.width.equalTo(304)
            $0.height.equalTo(31)
        }
        self.langLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        self.levLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.langLabel.snp.trailing).offset(18)
        }
        self.testLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.levLabel.snp.trailing).offset(18)
        }
        self.memLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.testLabel.snp.trailing).offset(18)
        }
        self.cycleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.memLabel.snp.trailing).offset(18)
        }
        self.offLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.cycleLabel.snp.trailing).offset(18)
        }
        self.line.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(12)
            $0.width.equalTo(44)
            $0.height.equalTo(3)
        }
        
        //checkBox
        self.checkBox1.snp.makeConstraints{
            $0.top.equalToSuperview().offset(73)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(20)
        }
        self.checkBoxTxt1.snp.makeConstraints{
            $0.top.equalToSuperview().offset(76)
            $0.leading.equalTo(self.checkBox1.snp.trailing).offset(10)
        }
        self.checkBox2.snp.makeConstraints{
            $0.top.equalTo(self.line1.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(20)
        }
        self.checkBoxTxt2.snp.makeConstraints{
            $0.top.equalTo(self.line1.snp.bottom).offset(14)
            $0.leading.equalTo(self.checkBox2.snp.trailing).offset(10)
        }
        self.checkBox3.snp.makeConstraints{
            $0.top.equalTo(self.line2.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(20)
        }
        self.checkBoxTxt3.snp.makeConstraints{
            $0.top.equalTo(self.line2.snp.bottom).offset(14)
            $0.leading.equalTo(self.checkBox3.snp.trailing).offset(10)
        }
        self.checkBox4.snp.makeConstraints{
            $0.top.equalTo(self.line3.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(20)
        }
        self.checkBoxTxt4.snp.makeConstraints{
            $0.top.equalTo(self.line3.snp.bottom).offset(14)
            $0.leading.equalTo(self.checkBox4.snp.trailing).offset(10)
        }
        self.checkBox5.snp.makeConstraints{
            $0.top.equalTo(self.line4.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(20)
        }
        self.checkBoxTxt5.snp.makeConstraints{
            $0.top.equalTo(self.line4.snp.bottom).offset(14)
            $0.leading.equalTo(self.checkBox5.snp.trailing).offset(10)
        }
        self.line1.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(105)
            $0.height.equalTo(1)
        }
        self.line2.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(self.line1.snp.bottom).offset(44)
            $0.height.equalTo(1)
        }
        self.line3.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(self.line2.snp.bottom).offset(44)
            $0.height.equalTo(1)
        }
        self.line4.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(self.line3.snp.bottom).offset(44)
            $0.height.equalTo(1)
        }
        
        //slider
        self.minimum.snp.makeConstraints{
            $0.top.equalTo(self.checkBox1.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        self.maximum.snp.makeConstraints{
            $0.top.equalTo(self.checkBox1.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().offset(-43)
        }
        self.slider.snp.makeConstraints{
            $0.top.equalTo(self.checkBox1.snp.bottom).offset(17)
            $0.width.equalTo(267)
            $0.height.equalTo(20)
            $0.leading.equalTo(self.minimum.snp.trailing).offset(9)
        }
        //요일
        self.mon.snp.makeConstraints{
            $0.top.equalTo(self.checkBox1.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.tue.snp.makeConstraints{
            $0.top.equalTo(self.checkBox1.snp.bottom).offset(20)
            $0.leading.equalTo(self.mon.snp.trailing).offset(22)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.wed.snp.makeConstraints{
            $0.top.equalTo(self.checkBox1.snp.bottom).offset(20)
            $0.leading.equalTo(self.tue.snp.trailing).offset(22)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.thur.snp.makeConstraints{
            $0.top.equalTo(self.checkBox1.snp.bottom).offset(20)
            $0.leading.equalTo(self.wed.snp.trailing).offset(22)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.fri.snp.makeConstraints{
            $0.top.equalTo(self.checkBox1.snp.bottom).offset(20)
            $0.leading.equalTo(self.thur.snp.trailing).offset(22)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.sat.snp.makeConstraints{
            $0.top.equalTo(self.checkBox1.snp.bottom).offset(20)
            $0.leading.equalTo(self.fri.snp.trailing).offset(22)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.sun.snp.makeConstraints{
            $0.top.equalTo(self.checkBox1.snp.bottom).offset(20)
            $0.leading.equalTo(self.sat.snp.trailing).offset(22)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
        }
        self.perWeekLabel.snp.makeConstraints{
            $0.top.equalTo(self.mon.snp.bottom).offset(27)
            $0.leading.equalToSuperview().offset(29)
        }
        self.dayLabel.snp.makeConstraints{
            $0.top.equalTo(self.mon.snp.bottom).offset(27)
            $0.leading.equalTo(self.perWeekLabel.snp.trailing).offset(0)
        }
        self.line5.snp.makeConstraints{
            $0.top.equalTo(self.perWeekLabel.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(29)
            $0.width.equalTo(110)
            $0.height.equalTo(1)
        }
        
        //bottomButton
        self.resetButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-44)
            $0.width.equalTo(95)
            $0.height.equalTo(45)
        }
        self.resetImg.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(6)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(26)
        }
        self.resetTxt.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-19)
            $0.centerY.equalToSuperview()
        }
        self.searchButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-44)
            $0.width.equalTo(245)
            $0.height.equalTo(45)
        }
    }
    
    //MARK: - Target
    func addTarget(){
        let backBtn1 = UITapGestureRecognizer(target: self, action: #selector(didClickBack))
        line.isUserInteractionEnabled = true
        line.addGestureRecognizer(backBtn1)
        
        let langBtn = UITapGestureRecognizer(target: self, action: #selector(langClicked))
        langLabel.isUserInteractionEnabled = true
        langLabel.addGestureRecognizer(langBtn)
        let levBtn = UITapGestureRecognizer(target: self, action: #selector(levClicked))
        levLabel.isUserInteractionEnabled = true
        levLabel.addGestureRecognizer(levBtn)
        let testBtn = UITapGestureRecognizer(target: self, action: #selector(testClicked))
        testLabel.isUserInteractionEnabled = true
        testLabel.addGestureRecognizer(testBtn)
        let memBtn = UITapGestureRecognizer(target: self, action: #selector(memClicked))
        memLabel.isUserInteractionEnabled = true
        memLabel.addGestureRecognizer(memBtn)
        let cycleBtn = UITapGestureRecognizer(target: self, action: #selector(cycleClicked))
        cycleLabel.isUserInteractionEnabled = true
        cycleLabel.addGestureRecognizer(cycleBtn)
        let offBtn = UITapGestureRecognizer(target: self, action: #selector(offClicked))
        offLabel.isUserInteractionEnabled = true
        offLabel.addGestureRecognizer(offBtn)
        
        let checkBox1Btn = UITapGestureRecognizer(target: self, action: #selector(checkBox1Clicked))
        checkBox1.isUserInteractionEnabled = true
        checkBox1.addGestureRecognizer(checkBox1Btn)
        let checkBox2Btn = UITapGestureRecognizer(target: self, action: #selector(checkBox2Clicked))
        checkBox2.isUserInteractionEnabled = true
        checkBox2.addGestureRecognizer(checkBox2Btn)
        let checkBox3Btn = UITapGestureRecognizer(target: self, action: #selector(checkBox3Clicked))
        checkBox3.isUserInteractionEnabled = true
        checkBox3.addGestureRecognizer(checkBox3Btn)
        let checkBox4Btn = UITapGestureRecognizer(target: self, action: #selector(checkBox4Clicked))
        checkBox4.isUserInteractionEnabled = true
        checkBox4.addGestureRecognizer(checkBox4Btn)
        let checkBox5Btn = UITapGestureRecognizer(target: self, action: #selector(checkBox5Clicked))
        checkBox5.isUserInteractionEnabled = true
        checkBox5.addGestureRecognizer(checkBox5Btn)
        let checkBoxTxt1Btn = UITapGestureRecognizer(target: self, action: #selector(checkBoxTxt1Clicked))
        checkBoxTxt1.isUserInteractionEnabled = true
        checkBoxTxt1.addGestureRecognizer(checkBoxTxt1Btn)
        let checkBoxTxt2Btn = UITapGestureRecognizer(target: self, action: #selector(checkBoxTxt2Clicked))
        checkBoxTxt2.isUserInteractionEnabled = true
        checkBoxTxt2.addGestureRecognizer(checkBoxTxt2Btn)
        let checkBoxTxt3Btn = UITapGestureRecognizer(target: self, action: #selector(checkBoxTxt3Clicked))
        checkBoxTxt3.isUserInteractionEnabled = true
        checkBoxTxt3.addGestureRecognizer(checkBoxTxt3Btn)
        let checkBoxTxt4Btn = UITapGestureRecognizer(target: self, action: #selector(checkBoxTxt4Clicked))
        checkBoxTxt4.isUserInteractionEnabled = true
        checkBoxTxt4.addGestureRecognizer(checkBoxTxt4Btn)
        let checkBoxTxt5Btn = UITapGestureRecognizer(target: self, action: #selector(checkBoxTxt5Clicked))
        checkBoxTxt5.isUserInteractionEnabled = true
        checkBoxTxt5.addGestureRecognizer(checkBoxTxt5Btn)
        self.slider.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        self.mon.addTarget(self, action: #selector(self.monClicked(_:)), for: .touchUpInside)
        self.tue.addTarget(self, action: #selector(self.tueClicked(_:)), for: .touchUpInside)
        self.wed.addTarget(self, action: #selector(self.wedClicked(_:)), for: .touchUpInside)
        self.thur.addTarget(self, action: #selector(self.thurClicked(_:)), for: .touchUpInside)
        self.fri.addTarget(self, action: #selector(self.friClicked(_:)), for: .touchUpInside)
        self.sat.addTarget(self, action: #selector(self.satClicked(_:)), for: .touchUpInside)
        self.sun.addTarget(self, action: #selector(self.sunClicked(_:)), for: .touchUpInside)
    }
}

extension SearchModalViewController: ClickedDelegate {
    func sendClicked(clicked: Int) {
        print(clicked)
        if clicked == 0{
            self.langClicked()
        }
        else if clicked == 1{
            self.levClicked()
        }
        else if clicked == 2{
            self.testClicked()
        }
        else if clicked == 3{
            self.memClicked()
        }
        else if clicked == 4{
            self.cycleClicked()
        }
        else {
            self.offClicked()
        }
        print(clicked)
    }
}
