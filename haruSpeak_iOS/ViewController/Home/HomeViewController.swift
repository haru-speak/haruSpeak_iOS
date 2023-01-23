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
    private var calendarConstraint : Constraint?
    private var blueViewConstraint : Constraint?
    // TOPVIEW START
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
    
    private let date = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.text = "12월 8일"
        $0.textColor = .lightGray
    }
    private let alarmButton = UIImageView().then{
        $0.image = UIImage(named: "alarm.blue")?.withRenderingMode(.alwaysOriginal)
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
    
    let recordCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(RecordCell.self, forCellWithReuseIdentifier: RecordCell.identifier)
        $0.backgroundColor = .systemGray6
    }
    
    var collectionViewindex = 0

    //BLUE PLAYLIST VIEW
    var blueViewRemoved = true
    let blueView = UIView().then{
        $0.backgroundColor = .mainColor
    }
    private let playButton = UIImageView().then{
        $0.image = UIImage(named: "play.white")?.withRenderingMode(.alwaysOriginal)
    }
    private let playTitle = UILabel().then{
        $0.text = "Nothing beats About time"
        $0.textColor = .white
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
    }
    private let closeButton = UIImageView().then{
        $0.image = UIImage(named: "x.white")?.withRenderingMode(.alwaysOriginal)
    }
    
    //ButtonArray
        let playButtonArray = ["play.white","pause.white"]
        var playindex = 0
    
    private let floatingButton = MDCFloatingButton().then{
        $0.sizeToFit()
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.setImageTintColor(.white, for: .normal)
        $0.backgroundColor = .mainColor
    }


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
    
    
    //
//    func blueViewup(){
//        self.blueViewConstraint?.update(offset: 70)
//        UIView.animate(withDuration: 0.3){
//            self.view.layoutIfNeeded()
//        }
//    }
    
//MARK: - Selector
    @objc func tap(_ sender: Any) {
        print("Record Screen Open")

    }
    @objc func didClickAlarm(sender: UITapGestureRecognizer) {
        print("didClickAlarm")
    }
    @objc func didClickAnnouncement(sender: UITapGestureRecognizer) {
        print("didClickAnnouncement")
    }
    @objc func didClickPlay(sender: UITapGestureRecognizer) {
        self.playindex = (self.playindex >= self.playButtonArray.count-1) ? 0 : self.playindex+1
        self.playButton.image = UIImage(named:playButtonArray[playindex])
        if playindex == 0{
            print("clickPause")
        }else{
            print("clickPlay")
        }
    }
    
    @objc func didClickClose(_ sender: Any) {
        print("Click Close blue Playlist")
        self.blueViewConstraint?.update(offset: 0)
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
    }

    
    @objc func didClickBlueView(_ sender: Any) {
        print("Click blue Playlist")
        let VC = PlaylistViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true)
    }
    

    // 캘린더 늘리기 일단 보류
    @objc func didDragCalendar(sender: UITapGestureRecognizer) {
        if self.calendar.scope == .week{
            self.calendarConstraint?.update(offset: 550)
            UIView.animate(withDuration: 0.3){
                self.calendar.scope = .month
                self.view.layoutIfNeeded()
            }
        }else{
            self.calendarConstraint?.update(offset: 320)
            UIView.animate(withDuration: 0){
                self.calendar.scope = .week
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func didClickFloatingButton(sender: UITapGestureRecognizer){
        print("didClickFloatingButton")
    }
    

    //TESTTEST


    
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
        self.view.addSubview(self.blueView)
        self.blueView.addSubview(self.playButton)
        self.blueView.addSubview(self.playTitle)
        self.blueView.addSubview(self.closeButton)
        self.view.addSubview(self.floatingButton)

    }
        
    
//MARK: - Layout

    private func setupLayout(){
        self.topView.snp.makeConstraints{
            $0.top.trailing.leading.equalToSuperview().offset(0)
            self.calendarConstraint = $0.height.equalTo(320).constraint
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
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalTo(self.blueView.snp.top)
        }
        self.blueView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-80)
            self.blueViewConstraint = $0.size.height.equalTo(70).constraint
        }
        self.playButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(26.21)
        }
        self.playTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.playButton.snp.trailing).offset(20)
        }
        self.closeButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-17)
        }
        self.floatingButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-18)
            $0.bottom.equalTo(self.blueView.snp.top).offset(-19)
            $0.height.equalTo(50)
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
        
        let playBtn = UITapGestureRecognizer(target: self, action: #selector(didClickPlay))
        playButton.isUserInteractionEnabled = true
        playButton.addGestureRecognizer(playBtn)
        
        let closeBtn = UITapGestureRecognizer(target: self, action: #selector(didClickClose))
        closeButton.isUserInteractionEnabled = true
        closeButton.addGestureRecognizer(closeBtn)
        
        let blueViewButton = UITapGestureRecognizer(target: self, action: #selector(didClickBlueView))
        blueView.isUserInteractionEnabled = true
        blueView.addGestureRecognizer(blueViewButton)
        
        let CalendarDrag = UITapGestureRecognizer(target: self, action: #selector(didDragCalendar))
        lineView.isUserInteractionEnabled = true
        lineView.addGestureRecognizer(CalendarDrag)
        
        let floatingBtn = UITapGestureRecognizer(target: self, action: #selector(didClickFloatingButton))
        floatingButton.isUserInteractionEnabled = true
        floatingButton.addGestureRecognizer(floatingBtn)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordCell.identifier, for: indexPath) as! RecordCell
//프로필 클릭시 나오는 화면임
//        collectionViewindex = indexPath.row
//        let VC = ClickRecordViewController()
//        VC.modalPresentationStyle = .overCurrentContext
//        present(VC, animated: false)
        self.blueViewConstraint?.update(offset: 70)
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
        
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
