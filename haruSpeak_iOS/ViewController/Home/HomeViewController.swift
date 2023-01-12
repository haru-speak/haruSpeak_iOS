//
//  HomeViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/11.
//

import Foundation
import UIKit
import SnapKit
import Then
import FSCalendar

class HomeViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance{
    
//MARK: - Properties
    let topView = UIView().then{
        $0.roundCorners(cornerRadius: 30, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        $0.backgroundColor = .white
        
        $0.layer.borderWidth = 0.3
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 1)
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 1.0
    }
    
    let date = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.text = "12월 8일"
        $0.textColor = .lightGray
    }
    let alarm = UIImageView().then{
        $0.image = UIImage(named: "alarm")?.withRenderingMode(.alwaysOriginal)
    }
    let message = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 22)
        $0.text = "승연님, \n어떤 영화를 가장 좋아하세요?"
        $0.numberOfLines = 0
        
        //줄 간격
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    let announcementButton = UIImageView().then{
        $0.image = UIImage(named: "announcement")?.withRenderingMode(.alwaysOriginal)
    }
    let englishMessage = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.text = "What's your favorite movie?"
        $0.textColor = .gray
    }
    let tabbar = CustomTabbar()
    let calendarView = UIView().then{_ in
        
    }
    let calendar = FSCalendar(frame: CGRect(x: 15, y: 20, width: 350, height: 300))
    let line = UIImageView().then{
        $0.image = UIImage(named: "line")?.withRenderingMode(.alwaysOriginal)
    }
    private let recordCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(RecordCell.self, forCellWithReuseIdentifier: RecordCell.identifier)
        $0.backgroundColor = .systemGray6
    }
    

    
    
//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        
        self.recordCollectionView.delegate = self
        self.recordCollectionView.dataSource = self
        
        
        setupView()
        setupLayout()
        addTarget()
        setCalendarUI()
    }

//MARK: - CalendarUI
    private func setCalendarUI(){
        self.calendar.delegate = self
        self.calendar.dataSource = self
        
        self.calendar.locale = Locale(identifier: "ko_KR")
        
        // 상단 요일을 영어로 변경
        self.calendar.calendarWeekdayView.weekdayLabels[0].text = "S"
        self.calendar.calendarWeekdayView.weekdayLabels[1].text = "M"
        self.calendar.calendarWeekdayView.weekdayLabels[2].text = "T"
        self.calendar.calendarWeekdayView.weekdayLabels[3].text = "W"
        self.calendar.calendarWeekdayView.weekdayLabels[4].text = "T"
        self.calendar.calendarWeekdayView.weekdayLabels[5].text = "F"
        self.calendar.calendarWeekdayView.weekdayLabels[6].text = "S"
        
        calendar.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesSingleUpperCase
        
        calendar.scope = .week
        
        //Header (늘릴때 필요?)
        calendar.headerHeight = 0
        calendar.appearance.headerDateFormat = "M월"
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.headerTitleFont = UIFont.appleSDGothicNeo(size: 16, family: .Bold)
        calendar.appearance.headerTitleColor = .black
        
        
        calendar.appearance.weekdayFont = UIFont.appleSDGothicNeo(size: 12)
        calendar.appearance.weekdayTextColor = .lightGray
        calendar.appearance.todayColor = UIColor.lightGray
        calendar.appearance.selectionColor = UIColor.mainColor
    }
    
    
//MARK: - Selector

    
    
    
//MARK: - addSubView
    private func setupView(){
        self.view.addSubview(self.topView)
        self.topView.addSubview(self.date)
        self.topView.addSubview(self.alarm)
        self.topView.addSubview(self.message)
        self.topView.addSubview(self.announcementButton)
        self.topView.addSubview(self.englishMessage)
        self.topView.addSubview(self.tabbar)
        self.topView.addSubview(self.calendarView)
        self.calendarView.backgroundColor = .clear
        self.calendarView.addSubview(self.calendar)
        self.topView.addSubview(self.line)
        self.view.addSubview(self.recordCollectionView)
    }
        
    
//MARK: - Layout
    private func setupLayout(){
        self.topView.snp.makeConstraints{
            $0.top.trailing.leading.equalToSuperview().offset(0)
            $0.height.equalTo(320)
        }
        self.date.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.top).offset(54)
            $0.leading.equalTo(self.topView.snp.leading).offset(31)
        }
        self.alarm.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.top).offset(55)
            $0.trailing.equalTo(self.topView.snp.trailing).offset(-29)
        }
        self.message.snp.makeConstraints{
            $0.top.equalTo(self.date.snp.bottom).offset(9)
            $0.leading.equalTo(self.topView.snp.leading).offset(31)
        }
        self.announcementButton.snp.makeConstraints{
            $0.top.equalTo(self.message.snp.bottom).offset(10)
            $0.leading.equalTo(self.topView.snp.leading).offset(31)
        }
        self.englishMessage.snp.makeConstraints{
            $0.top.equalTo(self.message.snp.bottom).offset(6)
            $0.leading.equalTo(self.announcementButton.snp.trailing).offset(7)
        }
        self.tabbar.snp.makeConstraints{
            $0.top.equalTo(self.englishMessage.snp.bottom).offset(17)
            $0.leading.equalTo(self.topView.snp.leading).offset(10)
            $0.trailing.equalTo(self.topView.snp.trailing).offset(-10)
        }
        self.calendarView.snp.makeConstraints{
            $0.height.equalTo(330)
            $0.top.equalTo(self.tabbar.snp.bottom).offset(0)
            $0.leading.equalTo(self.topView.snp.leading).offset(0)
            $0.trailing.equalTo(self.topView.snp.trailing).offset(0)
        }
        self.line.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.topView.snp.bottom).offset(-11)
        }
        self.recordCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.bottom).offset(10)
            $0.bottom.trailing.leading.equalToSuperview()
            
        }
        
    }
        
    
    
//MARK: - AddTarget
    private func addTarget(){
        
    }
    
}

//테두리 Extension
extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordCell.identifier, for: indexPath) as! RecordCell
        return cell
    }
   
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width , height: 70)
    }
    
}
