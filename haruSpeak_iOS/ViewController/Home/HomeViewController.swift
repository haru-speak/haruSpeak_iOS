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
import MaterialComponents.MaterialButtons

class HomeViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance{
    
//MARK: - Properties
    // TOPVIEW START
    private let topView = UIView().then{
        $0.roundCorners(cornerRadius: 30, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        $0.backgroundColor = .white
        
        $0.layer.borderWidth = 0.3
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 1)
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 1.0
    }
    
    private let date = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.text = "12월 8일"
        $0.textColor = .lightGray
    }
    private let alarmButton = UIImageView().then{
        $0.image = UIImage(named: "alarm")?.withRenderingMode(.alwaysOriginal)
    }
    private let message = UILabel().then{
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
    private let announcementButton = UIImageView().then{
        $0.image = UIImage(named: "announcement")?.withRenderingMode(.alwaysOriginal)
    }
    private let englishMessage = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.text = "What's your favorite movie?"
        $0.textColor = .gray
    }
    private let tabbar = CustomTabbar()
    private let calendarView = UIView().then{_ in
        
    }
    private let calendar = FSCalendar(frame: CGRect(x: 15, y: 20, width: 350, height: 300))
    private let lineView = UIView().then{
        $0.backgroundColor = .clear
    }
    private let line = UIImageView().then{
        $0.image = UIImage(named: "line")?.withRenderingMode(.alwaysOriginal)
    }
    // TOPVIEW END
    
    private let recordCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(RecordCell.self, forCellWithReuseIdentifier: RecordCell.identifier)
        $0.backgroundColor = .systemGray6
    }
    
    var collectionViewindex = 0

    
    
//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        
        self.recordCollectionView.delegate = self
        self.recordCollectionView.dataSource = self
        
        self.navigationController?.navigationBar.isHidden = true;
        
        setupView()
        setupLayout()
        addTarget()
        setCalendarUI()
        setFloatingButton()
        
        self.view.translatesAutoresizingMaskIntoConstraints = true
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
//MARK: - FloatingButton
    func setFloatingButton() {
            let floatingButton = MDCFloatingButton()
            let image = UIImage(systemName: "plus")
            floatingButton.sizeToFit()
            floatingButton.translatesAutoresizingMaskIntoConstraints = false
            floatingButton.setImage(image, for: .normal)
            floatingButton.setImageTintColor(.white, for: .normal)
            floatingButton.backgroundColor = .mainColor
            floatingButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
            view.addSubview(floatingButton)
            view.addConstraint(NSLayoutConstraint(item: floatingButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -100))
            view.addConstraint(NSLayoutConstraint(item: floatingButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -32))
        }
    
//MARK: - Selector
    @objc func tap(_ sender: Any) {
        print("Record Screen Open")
        //testcode start
        let VC = PlaylistViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true)
        //testcode finish
    }
    @objc func didClickAlarm(sender: UITapGestureRecognizer) {
        print("didClickAlarm")
    }
    @objc func didClickAnnouncement(sender: UITapGestureRecognizer) {
        print("didClickAnnouncement")
    }

    // 캘린더 늘리기 일단 보류
//    @objc func didDragCalendar(sender: UIPanGestureRecognizer) {
//        let velocity = sender.velocity(in: self.view) //속도
//        let translation = sender.translation(in: self.view) //위치
//        let height = self.topView.frame.maxY
//
//        if sender.state == .ended{
//            if velocity.y>0{
//                calendar.scope = .month
//                print("down")
//            }else{
//                calendar.scope = .week
//                print("up")
//            }
//        }else{
//            if height <= height+translation.y && height+translation.y <= height+230{
//                self.topView.frame = CGRect(x: 0, y: 0, width: self.topView.frame.width, height: height+translation.y)
//                UIView.animate(withDuration: 0, animations: {
//                    self.view.layoutIfNeeded()
//                    sender.setTranslation(CGPoint.zero, in: self.view)
//                })
//
//
//            }
//        }
//
//    }

    
    
//MARK: - addSubView
    private func setupView(){
        self.view.addSubview(self.topView)
        self.topView.addSubview(self.date)
        self.topView.addSubview(self.alarmButton)
        self.topView.addSubview(self.message)
        self.topView.addSubview(self.announcementButton)
        self.topView.addSubview(self.englishMessage)
        self.topView.addSubview(self.tabbar)
        self.topView.addSubview(self.calendarView)
        self.calendarView.backgroundColor = .clear
        self.calendarView.addSubview(self.calendar)
        self.topView.addSubview(self.lineView)
        self.lineView.addSubview(self.line)
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
        self.alarmButton.snp.makeConstraints{
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
            $0.top.equalTo(self.tabbar.snp.bottom).offset(0)
            $0.leading.equalTo(self.topView.snp.leading).offset(0)
            $0.trailing.equalTo(self.topView.snp.trailing).offset(0)
        }
        self.lineView.snp.makeConstraints{
            $0.top.equalTo(self.calendarView.snp.bottom).offset(0)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.size.height.equalTo(20)
        }
        self.line.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.lineView.snp.bottom).offset(-11)
        }
        self.recordCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.bottom).offset(20)
            $0.bottom.trailing.leading.equalToSuperview()
        }

        
        
    }
        
    
    
//MARK: - AddTarget
    private func addTarget(){
        let AlarmBtn = UITapGestureRecognizer(target: self, action: #selector(didClickAlarm))
        alarmButton.isUserInteractionEnabled = true
        alarmButton.addGestureRecognizer(AlarmBtn)
        
        let AnnouncementBtn = UITapGestureRecognizer(target: self, action: #selector(didClickAnnouncement))
        announcementButton.isUserInteractionEnabled = true
        announcementButton.addGestureRecognizer(AnnouncementBtn)
        
        // 캘린더 늘리기 일단 보류
//        let CalendarDrag = UIPanGestureRecognizer(target: self, action: #selector(didDragCalendar))
//        lineView.isUserInteractionEnabled = true
//        lineView.addGestureRecognizer(CalendarDrag)
//
    }
    

}

//MARK: - Extension
//테두리 Extension
extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}


//CollectionVIew
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionViewindex = indexPath.row
        let VC = ClickRecordViewController()
        VC.modalPresentationStyle = .overCurrentContext
        present(VC, animated: false)
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
