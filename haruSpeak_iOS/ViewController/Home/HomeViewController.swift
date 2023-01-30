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
import AVFoundation

class HomeViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance, SampleProtocol{
    var selectedIndex : IndexPath?


//MARK: - DatsSource
    
    //Announcement 영어 문장
    var announcementString = "What's your favorite movie?"
    
    
    //친구 목록 (MyMate)
    var myMateFriends = [String]()
    
    //녹음 있는 날짜 Array
    var haveDataCircle = [String]()
    //CollectionView
    var RecordCellTitleArray = [String]()
    var RecordCellHeartCountArray = [String]()
    var RecordCellCommentCountArray = [String]()
    var RecordCellHeartImgArray = [Bool]()
    
    func DataSourceSet(){
        //
        myMateFriends.append(contentsOf: ["데이", "연", "동동", "나단", "무유", "우기", "채드"])
        myMateFriends.append(contentsOf: [""])
        //달력 동그라미 데이터
        haveDataCircle.append(contentsOf: ["2023-01-23", "2023-01-17", "2023-01-11", "2023-01-13"])
        //BottomView 데이터
        RecordCellTitleArray.append(contentsOf: ["MyLog_StartData", "MyLog_StartData", "MyLog_StartData", "MyLog_StartData", "MyLog_StartData", "MyLog_StartData"])
        RecordCellHeartCountArray.append(contentsOf: ["5", "2", "8", "9", "15", "13"])
        RecordCellCommentCountArray.append(contentsOf: ["3", "8", "2", "3", "5", "1"])
        RecordCellHeartImgArray.append(contentsOf: [true, true, false, false, true, false])
                DispatchQueue.main.async {
                    self.recordCollectionView.reloadData()
                    self.checkRecordCellCount()
                }

    }
    var checkdata = "data String"
    func sendStringTab(data: String) {
        self.checkdata = data
        if data == "MyLog"{
            print("clickMyLog")
            RecordCellTitleArray = ["MyLog1", "MyLog2", "MyLog3", "MyLog4", "MyLog5", "MyLog6"]
            RecordCellHeartCountArray = ["4", "3", "1", "6", "13", "21"]
            RecordCellCommentCountArray = ["9", "1", "7", "6", "4", "2"]
            RecordCellHeartImgArray = [false, true, true, false, true, true]
            DispatchQueue.main.async {
                self.checkRecordCellCount()
                self.recordCollectionView.reloadData()
            }
            //change layout
            if self.calendar.scope == .week{
                self.calendarConstraint?.update(offset: 320)
                self.calendarTopConstraint?.update(offset: -30)
                self.myMateConstraint?.update(offset: -5)
                self.bottomViewConstraint?.update(offset: 10)
                self.filterButtonView.isHidden = true
                UIView.animate(withDuration: 0.5){
                    self.calendar.scope = .week
                    self.calendar.appearance.headerDateFormat = ""
                    self.calendarRight.alpha = 0
                    self.calendarLeft.alpha = 0
                    self.view.layoutIfNeeded()
                }
            }else{
                self.calendarConstraint?.update(offset: 530)
                self.calendarTopConstraint?.update(offset: -5)
                self.myMateConstraint?.update(offset: 0)
                self.bottomViewConstraint?.update(offset: 10)
                self.filterButtonView.isHidden = true
                UIView.animate(withDuration: 0.5){
                    self.calendar.scope = .month
                    self.calendar.appearance.headerDateFormat = "M월"
                    self.calendarRight.alpha = 1
                    self.calendarLeft.alpha = 1
                    self.view.layoutIfNeeded()
                }
            }
        }else if data == "MyMate"{
            print("clickMyMate")
            
            RecordCellTitleArray = ["MyMate", "MyMate2", "MyMate3", "MyMate4", "MyMate5", "MyMate6"]
            RecordCellHeartCountArray = ["4", "3", "1", "6", "13", "21"]
            RecordCellCommentCountArray = ["9", "1", "7", "6", "4", "2"]
            RecordCellHeartImgArray = [false, true, false, false, true, false]
            DispatchQueue.main.async {
                self.checkRecordCellCount()
                self.recordCollectionView.reloadData()
            }
            //change layout
            if self.calendar.scope == .week{
                self.calendarConstraint?.update(offset: 400)
                self.calendarTopConstraint?.update(offset: -30)
                self.myMateConstraint?.update(offset: 80)
                self.bottomViewConstraint?.update(offset: 10)
                self.filterButtonView.isHidden = true
                UIView.animate(withDuration: 0.5){
                    self.calendar.scope = .week
                    self.calendar.appearance.headerDateFormat = ""
                    self.calendarRight.alpha = 0
                    self.calendarLeft.alpha = 0
                    self.view.layoutIfNeeded()
                }
            }else{
                self.calendarConstraint?.update(offset: 610)
                self.calendarTopConstraint?.update(offset: -5)
                self.myMateConstraint?.update(offset: 80)
                self.bottomViewConstraint?.update(offset: 10)
                self.filterButtonView.isHidden = true
                UIView.animate(withDuration: 0.5){
                    self.calendar.scope = .month
                    self.calendar.appearance.headerDateFormat = "M월"
                    self.calendarRight.alpha = 1
                    self.calendarLeft.alpha = 1
                    self.view.layoutIfNeeded()
                }
            }
        }else{
            print("clickAll")
            RecordCellTitleArray = ["All1", "All2", "All3", "All4", "All5", "All6"]
            RecordCellHeartCountArray = ["4", "3", "1", "6", "13", "21"]
            RecordCellCommentCountArray = ["9", "1", "7", "6", "4", "2"]
            RecordCellHeartImgArray = [true, true, false, true, true, false]
            DispatchQueue.main.async {
                self.checkRecordCellCount()
                self.recordCollectionView.reloadData()
            }
            //change layout
            if self.calendar.scope == .week{
                self.calendarConstraint?.update(offset: 320)
                self.calendarTopConstraint?.update(offset: -30)
                self.myMateConstraint?.update(offset: 0)
                self.bottomViewConstraint?.update(offset: 43)
                self.filterButtonView.isHidden = false
                UIView.animate(withDuration: 0.5){
                    self.calendar.scope = .week
                    self.calendar.appearance.headerDateFormat = ""
                    self.calendarRight.alpha = 0
                    self.calendarLeft.alpha = 0
                    self.view.layoutIfNeeded()
                }
            }else{
                self.calendarConstraint?.update(offset: 530)
                self.calendarTopConstraint?.update(offset: -5)
                self.myMateConstraint?.update(offset: 0)
                self.bottomViewConstraint?.update(offset: 43)
                self.filterButtonView.isHidden = false
                UIView.animate(withDuration: 0.5){
                    self.calendar.scope = .month
                    self.calendar.appearance.headerDateFormat = "M월"
                    self.calendarRight.alpha = 1
                    self.calendarLeft.alpha = 1
                    self.view.layoutIfNeeded()
                }
            }
        }
    }

    func address(of object: UnsafeRawPointer) -> String{
        let address = Int(bitPattern: object)
        return String(format: "%p", address)
    }

    
//MARK: - Constraints
    var calendarTopConstraint : Constraint?
    var calendarConstraint : Constraint?
    var blueViewConstraint : Constraint?
    var myMateConstraint : Constraint?
    var bottomViewConstraint : Constraint?
    
//MARK: - Properties

    
    let formatter = DateFormatter()
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
        $0.text = "MM월 dd일"
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
        //.alwaysTemplate으로 바꾸면 색깔 변경 가능
        $0.image = UIImage(named: "announcement")?.withRenderingMode(.alwaysOriginal)
//        $0.tintColor = UIColor.mainColor
    }
    let englishMessage = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 16)
        $0.text = "will be added"
        $0.textColor = .gray
    }
    let tabbar = CustomTabbar()
    var myMateFriendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(MyMateFriendCell.self, forCellWithReuseIdentifier: MyMateFriendCell.identifier)
        $0.backgroundColor = .white
        
        if let layout = $0.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        $0.showsHorizontalScrollIndicator = false
    }
    let seperateLine = UIView().then{
        $0.backgroundColor = UIColor.systemGray4
    }
    let calendarView = UIView()
    let calendar = FSCalendar(frame: CGRect(x: 15, y: 20, width: 350, height: 300))
    let calendarRight = UIButton().then{
        $0.setImage(UIImage(named: "calendarright")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.alpha = 0
    }
    let calendarLeft = UIButton().then{
        $0.setImage(UIImage(named: "calendarleft")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.alpha = 0
    }
    
    private let lineView = UIView().then{
        $0.backgroundColor = .clear
    }
    
    private let line = UIImageView().then{
        $0.image = UIImage(named: "line")?.withRenderingMode(.alwaysOriginal)
    }
    // TOPVIEW END
    let filterButtonView = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.isHidden = true
    }
    let filterText = UILabel().then{
        $0.text = "최신 순"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 15)
        $0.textColor = .lightGray
    }
    let filterButton = UIImageView().then{
        $0.image = UIImage(named: "filterbutton")?.withRenderingMode(.alwaysOriginal)
    }
    
    var recordCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(RecordCell.self, forCellWithReuseIdentifier: RecordCell.identifier)
        $0.backgroundColor = .systemGray6
    }
    var collectionViewindex = 0
    
    let hideRecordView = UIView().then{
        $0.backgroundColor = .systemGray6
    }
    let hideRecordViewLabel = UILabel().then{
        $0.text = "오늘의 스피킹을 기록해보세요!"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 16)
        $0.textColor = .gray
    }

    //BLUE PLAYLIST VIEW
    var blueViewRemoved = true
    let blueView = UIView().then{
        $0.backgroundColor = .mainColor
    }
    private let playButton = UIImageView().then{
        $0.image = UIImage(named: "play.white")?.withRenderingMode(.alwaysOriginal)
        $0.isHidden = true
    }
    private let playTitle = UILabel().then{
        $0.text = ""
        $0.textColor = .white
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.isHidden = true
    }
    private let blueViewHeartButton = UIImageView().then{
        $0.image = UIImage(named: "heartempty.white")?.withRenderingMode(.alwaysOriginal)
        $0.isHidden = true
    }
    private let closeButton = UIImageView().then{
        $0.image = UIImage(named: "x.white")?.withRenderingMode(.alwaysOriginal)
        $0.isHidden = true
    }
    
    //ButtonArray
        let heartButtonArray = ["heartempty.white","heart.fill"]
        var heartindex = 0
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
        self.myMateFriendCollectionView.delegate = self
        self.myMateFriendCollectionView.dataSource = self
        
        tabbar.delegate = self
        
        self.navigationController?.navigationBar.isHidden = true;
        setupView()
        setupLayout()
        addTarget()
        setCalendarUI()
        checkRecordCellCount()
        DataSourceSet()
        checkTodayDate()
        
        
        self.englishMessage.text = announcementString
        
        self.view.translatesAutoresizingMaskIntoConstraints = true
        topView.bringSubviewToFront(self.tabbar)
        topView.bringSubviewToFront(self.seperateLine)
        self.view.bringSubviewToFront(self.filterButtonView)
        
        let OnboardingVC = OnboardingViewController()
        OnboardingVC.modalPresentationStyle = .fullScreen
        present(OnboardingVC, animated: false)

    }
    func checkTodayDate(){
        var formatter_year = DateFormatter()
        formatter_year.dateFormat = "MM월 dd일"
        var current_year_string = formatter_year.string(from: Date())
        self.date.text = current_year_string
    }

    
//MARK: - Check Cell isEmpty
    func checkRecordCellCount(){
        let countRecordCell = Int(RecordCellTitleArray.count)
        if countRecordCell == 0{
            hideRecordView.isHidden = false
        }else{
            hideRecordView.isHidden = true
        }
    }
//MARK: - CalendarUI

    private func setCalendarUI(){
        self.calendar.delegate = self
        self.calendar.dataSource = self
        self.calendar.locale = Locale(identifier: "en_EN")

        calendar.scope = .week
        
        //Header (늘릴때 필요?)
        calendar.headerHeight = 25
        calendar.appearance.headerDateFormat = ""
        calendar.appearance.headerMinimumDissolvedAlpha = 0
        calendar.appearance.headerTitleFont = UIFont.appleSDGothicNeo(size: 16, family: .Bold)
        calendar.appearance.headerTitleColor = .black
        
        
        calendar.appearance.weekdayFont = UIFont.appleSDGothicNeo(size: 12)
        calendar.appearance.weekdayTextColor = .lightGray
        calendar.appearance.todayColor = UIColor.lightGray
        calendar.appearance.selectionColor = UIColor.mainColor
        
        //이벤트 동그라미
        calendar.appearance.eventDefaultColor = UIColor.mainColor
        calendar.appearance.eventSelectionColor = UIColor.mainColor

        //해당 월만 보이게끔
        calendar.placeholderType = .none
        
    }

    // 날짜 선택 시 콜백 메소드 (백엔드 들어오면 해당 날짜 데이터 가져오기, mylog, mymate 구분도 해야됨)
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print(dateFormatter.string(from: date) + " 선택됨")
        
        //날짜 클릭하면 cell 변경
        if dateFormatter.string(from: date) == "2023-01-23"{
            self.RecordCellTitleArray = ["No.6", "No.5", "No.4", "No.3", "No.2", "No.1"]
            self.RecordCellHeartCountArray = ["4", "3", "1", "6", "13", "21"]
            self.RecordCellCommentCountArray = ["9", "1", "7", "6", "4", "2"]
            self.RecordCellHeartImgArray = [false, true, true, false, true, true]
        DispatchQueue.main.async {
            self.checkRecordCellCount()
            self.recordCollectionView.reloadData()
        }
        }
    }
    
    // 날짜 선택 해제 시 콜백 메소드
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print(dateFormatter.string(from: date) + " 해제됨")
    }
    
    //녹음 있는 날짜 출력(작은 동그라미)
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        var dates = [Date]()
        if haveDataCircle.count > 0{
            for i in 0...haveDataCircle.count-1{
                let a = formatter.date(from: haveDataCircle[i])
                dates.append(a!)
            }
        }
        if dates.contains(date){
            return 1
        }
        return 0
    }


//MARK: - Selector
    private var currentPage: Date?
    private lazy var today: Date = {
        return Date()
    }()
    @objc func monthForthButtonPressed(_ sender: Any) {
        self.moveCurrentPage(moveUp: true)
    }
    @objc func monthBackButtonPressed(_ sender: Any) {
        self.moveCurrentPage(moveUp: false)
    }
    private func moveCurrentPage(moveUp: Bool) {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = moveUp ? 1 : -1
        self.currentPage = calendar.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        self.calendar.setCurrentPage(self.currentPage!, animated: true)
    }
    
    @objc func tap(_ sender: Any) {
        print("Record Screen Open")

    }
    @objc func didClickAlarm(sender: UITapGestureRecognizer) {
        print("didClickAlarm")
    }
    
    let synthesizer = AVSpeechSynthesizer()

    @objc func didClickAnnouncement(sender: UITapGestureRecognizer) {
        print("didClickAnnouncement")
        let utterance = AVSpeechUtterance(string: announcementString)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.volume = 10
        utterance.rate = 0.4
        synthesizer.speak(utterance)
        print(utterance.rate)
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
        self.playTitle.isHidden = true
        self.blueViewHeartButton.isHidden = true
        self.closeButton.isHidden = true
        self.playButton.isHidden = true
        
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
    }

    @objc func didClickheart(sender: UITapGestureRecognizer) {
        self.heartindex = (self.heartindex >= self.heartButtonArray.count-1) ? 0 : self.heartindex+1
        self.blueViewHeartButton.image = UIImage(named:heartButtonArray[heartindex])
        if self.heartindex == 0{
            print("clickUnlike")
        }else{
            print("clickLike")
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
        if checkdata == "MyMate" {
            if self.calendar.scope == .week{
                self.calendarConstraint?.update(offset: 610)
                self.calendarTopConstraint?.update(offset: -5)
                UIView.animate(withDuration: 0.5){
                    self.calendar.scope = .month
                    self.calendar.appearance.headerDateFormat = "M월"
                    self.calendarRight.alpha = 1
                    self.calendarLeft.alpha = 1
                    self.view.layoutIfNeeded()
                }
            }else{
                self.calendarConstraint?.update(offset: 400)
                self.calendarTopConstraint?.update(offset: -30)
                UIView.animate(withDuration: 0){
                    self.calendar.scope = .week
                    self.calendar.appearance.headerDateFormat = ""
                    self.calendarRight.alpha = 0
                    self.calendarLeft.alpha = 0
                    self.view.layoutIfNeeded()
                }
            }
        }else{
            if self.calendar.scope == .week{
                self.calendarConstraint?.update(offset: 530)
                self.calendarTopConstraint?.update(offset: -5)
                UIView.animate(withDuration: 0.5){
                    self.calendar.scope = .month
                    self.calendar.appearance.headerDateFormat = "M월"
                    self.calendarRight.alpha = 1
                    self.calendarLeft.alpha = 1
                    self.view.layoutIfNeeded()
                }
            }else{
                self.calendarConstraint?.update(offset: 320)
                self.calendarTopConstraint?.update(offset: -30)
                UIView.animate(withDuration: 0){
                    self.calendar.scope = .week
                    self.calendar.appearance.headerDateFormat = ""
                    self.calendarRight.alpha = 0
                    self.calendarLeft.alpha = 0
                    self.view.layoutIfNeeded()
                }
                
            }
        }
    }
    @objc func didClickFilterButton(sender: UITapGestureRecognizer){
        print("didClickFilterButton")
    }
    @objc func didClickFloatingButton(sender: UITapGestureRecognizer){
        print("didClickFloatingButton")
        let VC = RecordViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true)
    }

    
//MARK: - addSubView
    private func setupView(){
        self.view.addSubview(self.topView)
        self.topView.addSubview(self.date)
        self.topView.addSubview(self.alarmButton)
        self.topView.addSubview(self.message)
        self.topView.addSubview(self.announcementButton)
        self.topView.addSubview(self.englishMessage)
        self.topView.addSubview(self.tabbar)
        self.topView.addSubview(self.myMateFriendCollectionView)
        self.topView.addSubview(self.seperateLine)
        self.topView.addSubview(self.calendarView)
        self.calendarView.backgroundColor = .clear
        self.calendar.addSubview(self.calendarRight)
        self.calendar.addSubview(self.calendarLeft)
        self.calendarView.addSubview(self.calendar)
        self.topView.addSubview(self.lineView)
        self.lineView.addSubview(self.line)
        self.view.addSubview(self.filterButtonView)
        self.filterButtonView.addSubview(self.filterText)
        self.filterButtonView.addSubview(self.filterButton)
        self.view.addSubview(self.recordCollectionView)
        self.view.addSubview(self.hideRecordView)
        self.hideRecordView.addSubview(self.hideRecordViewLabel)
        self.view.addSubview(self.blueView)
        self.blueView.addSubview(self.playButton)
        self.blueView.addSubview(self.playTitle)
        self.blueView.addSubview(self.blueViewHeartButton)
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
            $0.leading.equalTo(self.topView.snp.leading).offset(30)
            $0.trailing.equalTo(self.topView.snp.trailing).offset(-30)
        }
        self.myMateFriendCollectionView.snp.makeConstraints{
            $0.top.equalTo(self.tabbar.snp.bottom).offset(0)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            self.myMateConstraint = $0.height.equalTo(0).constraint
        }
        self.seperateLine.snp.makeConstraints{
            $0.top.equalTo(self.myMateFriendCollectionView.snp.bottom)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(1)
        }
        self.calendarView.snp.makeConstraints{
            self.calendarTopConstraint = $0.top.equalTo(self.myMateFriendCollectionView.snp.bottom).offset(-30).constraint
            $0.leading.equalTo(self.topView.snp.leading)
            $0.trailing.equalTo(self.topView.snp.trailing)
        }
        self.calendarRight.snp.makeConstraints{
            $0.top.equalToSuperview().offset(6)
            $0.trailing.equalToSuperview().offset(-135)
        }
        self.calendarLeft.snp.makeConstraints{
            $0.top.equalToSuperview().offset(2)
            $0.leading.equalToSuperview().offset(135)
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
        self.filterButtonView.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.bottom).offset(14)
            $0.trailing.equalToSuperview().offset(-23)
            $0.width.equalTo(67)
            $0.height.equalTo(22)
        }
        self.filterText.snp.makeConstraints{
            $0.top.bottom.leading.equalToSuperview()
            $0.width.equalTo(43)
        }
        self.filterButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(7.54)
            $0.trailing.equalToSuperview().offset(-7.33)
            $0.width.equalTo(11.67)
            $0.height.equalTo(7.13)
        }
        self.recordCollectionView.snp.makeConstraints {
            self.bottomViewConstraint = $0.top.equalTo(self.topView.snp.bottom).offset(10).constraint
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalTo(self.blueView.snp.top)
        }
        self.hideRecordView.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.bottom).offset(10)
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalTo(self.blueView.snp.top)
        }
        self.hideRecordViewLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        self.blueView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-80)
            self.blueViewConstraint = $0.size.height.equalTo(0).constraint
        }
        self.playButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(26.21)
            $0.width.equalTo(14.58)
            $0.height.equalTo(17.5)
        }
        self.playTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.playButton.snp.trailing).offset(20)
        }
        self.closeButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-17)
        }
        self.blueViewHeartButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(self.closeButton.snp.leading).offset(-10)
            $0.width.equalTo(21.67)
            $0.height.equalTo(20.04)
        }
        self.floatingButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-18)
            $0.bottom.equalTo(self.blueView.snp.top).offset(-19)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
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
        
        let heartBtn = UITapGestureRecognizer(target: self, action: #selector(didClickheart))
        blueViewHeartButton.isUserInteractionEnabled = true
        blueViewHeartButton.addGestureRecognizer(heartBtn)
        
        let blueViewButton = UITapGestureRecognizer(target: self, action: #selector(didClickBlueView))
        blueView.isUserInteractionEnabled = true
        blueView.addGestureRecognizer(blueViewButton)
        
        let CalendarDrag = UITapGestureRecognizer(target: self, action: #selector(didDragCalendar))
        lineView.isUserInteractionEnabled = true
        lineView.addGestureRecognizer(CalendarDrag)
        
        let filterBtn = UITapGestureRecognizer(target: self, action: #selector(didClickFilterButton))
        filterButtonView.isUserInteractionEnabled = true
        filterButtonView.addGestureRecognizer(filterBtn)
        
        let floatingBtn = UITapGestureRecognizer(target: self, action: #selector(didClickFloatingButton))
        floatingButton.isUserInteractionEnabled = true
        floatingButton.addGestureRecognizer(floatingBtn)
        
        self.calendarRight.addTarget(self, action: #selector(self.monthForthButtonPressed), for: .touchUpInside)
        
        self.calendarLeft.addTarget(self, action: #selector(self.monthBackButtonPressed), for: .touchUpInside)
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
        if collectionView == self.recordCollectionView{
            return RecordCellTitleArray.count
        }else{
            return myMateFriends.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == self.recordCollectionView{
            let Rcell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordCell.identifier, for: indexPath) as! RecordCell
            Rcell.title.text = self.RecordCellTitleArray[indexPath.row]
            Rcell.likeLabel.text = self.RecordCellHeartCountArray[indexPath.row]
            Rcell.commentLabel.text = self.RecordCellCommentCountArray[indexPath.row]
            if self.RecordCellHeartImgArray[indexPath.row] == true{
                Rcell.heart.image = UIImage(named: "heart.fill")?.withRenderingMode(.alwaysOriginal)
            }else{
                Rcell.heart.image = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
            }
            return Rcell
        }
        else{
            let Mcell = collectionView.dequeueReusableCell(withReuseIdentifier: MyMateFriendCell.identifier, for: indexPath) as! MyMateFriendCell
            Mcell.profileName.text = self.myMateFriends[indexPath.row]
                if indexPath == selectedIndex{
                    Mcell.borderView.backgroundColor = .mainColor
                    Mcell.profileName.textColor = .mainColor
                    self.myMateFriendCollectionView.layoutIfNeeded()
                }else{
                    Mcell.borderView.backgroundColor = .systemGray6
                    Mcell.profileName.textColor = .gray
                    self.myMateFriendCollectionView.layoutIfNeeded()
                }
                return Mcell
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.recordCollectionView{
//            let Rcell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordCell.identifier, for: indexPath) as! RecordCell
            self.blueViewConstraint?.update(offset: 70)
            self.playTitle.text = self.RecordCellTitleArray[indexPath.row]
            self.playTitle.isHidden = false
            self.blueViewHeartButton.isHidden = false
            self.closeButton.isHidden = false
            self.playButton.isHidden = false
            
            UIView.animate(withDuration: 0.3){
                self.view.layoutIfNeeded()
            }
        }else{
            selectedIndex = indexPath
            myMateFriendCollectionView.reloadData()
            print(indexPath.row)
        }
//프로필 클릭시 나오는 화면임
//        collectionViewindex = indexPath.row
//        let VC = ClickRecordViewController()
//        VC.modalPresentationStyle = .overCurrentContext
//        present(VC, animated: false)

    }
   
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.recordCollectionView{
            return 5
        }else{
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.recordCollectionView{
            return 0
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.recordCollectionView{
            return CGSize(width: self.view.frame.width , height: 70)
        }else{
            return CGSize(width: 50 , height: 60)
        }
        
    }
    
}
