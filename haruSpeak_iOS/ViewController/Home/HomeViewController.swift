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
    
    

//MARK: - DatsSource
    //녹음 있는 날짜 Array
    var haveDataCircle = [String]()
    //CollectionView
    var RecordCellTitleArray = [String]()
    var RecordCellHeartCountArray = [String]()
    var RecordCellCommentCountArray = [String]()
    var RecordCellHeartImgArray = [Bool]()
    
    
    func DataSourceSet(){
        haveDataCircle.append(contentsOf: ["2023-01-23", "2023-01-17", "2023-01-11", "2023-01-13"])
        
        RecordCellTitleArray.append(contentsOf: ["No.1", "No.2", "No.3", "No.4", "No.5", "No.6"])
        RecordCellHeartCountArray.append(contentsOf: ["5", "2", "8", "9", "15", "13"])
        RecordCellCommentCountArray.append(contentsOf: ["3", "8", "2", "3", "5", "1"])
        RecordCellHeartImgArray.append(contentsOf: [true, true, false, false, true, false])
                DispatchQueue.main.async {
                    self.recordCollectionView.reloadData()
                    self.checkRecordCellCount()
                }
    }

    
    
    
    //TEST
    func mymateFollowerSwitch(){
        print("aaaa")
        print("asdasd")

//            self.RecordCellTitleArray = ["No.6", "No.5", "No.4", "No.3", "No.2", "No.1"]
//            self.RecordCellHeartCountArray = ["4", "3", "1", "6", "13", "21"]
//            self.RecordCellCommentCountArray = ["9", "1", "7", "6", "4", "2"]
//            self.RecordCellHeartImgArray = [false, true, true, false, true, true]
//        DispatchQueue.main.async {
//            self.recordCollectionView.reloadData()
//        }
        
    }
    //TESTEND
    
    
//MARK: - Properties
    var calendarTopConstraint : Constraint?
    var calendarConstraint : Constraint?
    var blueViewConstraint : Constraint?
    
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
    let englishMessage = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.text = "What's your favorite movie?"
        $0.textColor = .gray
    }
    let tabbar = CustomTabbar()
    
    let calendarView = UIView()
    let calendar = FSCalendar(frame: CGRect(x: 15, y: 20, width: 350, height: 300))
    let calendarRight = UIButton().then{
        $0.setImage(UIImage(named: "calendarright")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        $0.isHidden = true
        $0.alpha = 0
    }
    let calendarLeft = UIButton().then{
        $0.setImage(UIImage(named: "calendarleft")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        $0.isHidden = true
        $0.alpha = 0
    }
    
    private let lineView = UIView().then{
        $0.backgroundColor = .clear
    }
    private let line = UIImageView().then{
        $0.image = UIImage(named: "line")?.withRenderingMode(.alwaysOriginal)
    }
    // TOPVIEW END
    
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
    }
    private let playTitle = UILabel().then{
        $0.text = ""
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
        checkRecordCellCount()
        DataSourceSet()
        
        self.view.translatesAutoresizingMaskIntoConstraints = true
        topView.bringSubviewToFront(self.tabbar)
    }
//MARK: - Check Cell isEmpty
    func checkRecordCellCount(){
        let countRecordCell = Int(RecordCellTitleArray.count)
        if countRecordCell == 0{
            hideRecordView.isHidden = false
            print("hidden")
        }else{
            hideRecordView.isHidden = true
            print("nothidden")
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
    }
    
    // 날짜 선택 해제 시 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print(dateFormatter.string(from: date) + " 해제됨")
    }
    
    //녹음 있는 날짜 출력(작은 동그라미)
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        var dates = [Date]()
        for i in 0...haveDataCircle.count-1{
            let a = formatter.date(from: haveDataCircle[i])
            dates.append(a!)
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
            self.calendarConstraint?.update(offset: 530)
            self.calendarTopConstraint?.update(offset: -5)
            UIView.animate(withDuration: 0.5){
                self.calendar.scope = .month
//                self.calendar.headerHeight = 30
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
//                self.calendar.headerHeight = 0
                self.calendar.appearance.headerDateFormat = ""
                self.calendarRight.alpha = 0
                self.calendarLeft.alpha = 0
                self.view.layoutIfNeeded()
            }

        }
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
        self.topView.addSubview(self.calendarView)
        self.calendarView.backgroundColor = .clear
        self.calendar.addSubview(self.calendarRight)
        self.calendar.addSubview(self.calendarLeft)
        self.calendarView.addSubview(self.calendar)
        self.topView.addSubview(self.lineView)
        self.lineView.addSubview(self.line)
        self.view.addSubview(self.recordCollectionView)
        self.view.addSubview(self.hideRecordView)
        self.hideRecordView.addSubview(self.hideRecordViewLabel)
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
            self.calendarTopConstraint = $0.top.equalTo(self.tabbar.snp.bottom).offset(-30).constraint
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
        self.recordCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.bottom).offset(10)
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
        return RecordCellTitleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordCell.identifier, for: indexPath) as! RecordCell

        cell.title.text = self.RecordCellTitleArray[indexPath.row]
        cell.likeLabel.text = self.RecordCellHeartCountArray[indexPath.row]
        cell.commentLabel.text = self.RecordCellCommentCountArray[indexPath.row]
        if self.RecordCellHeartImgArray[indexPath.row] == true{
            cell.heart.image = UIImage(named: "heart.fill")?.withRenderingMode(.alwaysOriginal)
        }else{
            cell.heart.image = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
        }
        
        
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
        self.playTitle.text = self.RecordCellTitleArray[indexPath.row]
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
