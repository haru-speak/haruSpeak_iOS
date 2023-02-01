//
//  RecordViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/14.
//

import Foundation
import UIKit
import SnapKit
import Then
import AVFoundation
import Speech

class RecordViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate{
    //MARK: - Properties
    let arrowLeft = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let formatter = DateFormatter()
    let date = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.text = "MM월 dd일"
        $0.textColor = .black
    }

    let delete = UIButton().then{
        $0.setTitle("삭제", for: .normal)
        $0.setTitleColor(.mainColor, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.isHidden = true
    }
    let line1 = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    let startMsg = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-SemiBold", size: 18)
        $0.textColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
        $0.text = "녹음 버튼을 눌러 스피킹을 기록해보세요!"
    }
    let STTText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-SemiBold", size: 20)
        $0.textColor = .init(red: 0, green: 0, blue: 0, alpha: 0.6)
        $0.text = "  "
        $0.numberOfLines = 100
        $0.isHidden = true
        
        //줄 간격
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    
    let line2 = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    let baseCircle = UIImageView().then{
        $0.image = UIImage(named: "recordButtonBase")?.withRenderingMode(.alwaysOriginal)
    }
    let mainButton = UIImageView().then{
        $0.image = UIImage(named: "startRecording")?.withRenderingMode(.alwaysOriginal)
    }
    let done = UIButton().then{
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.mainColor, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 2
        $0.isHidden = true
    }
    let timerLabel = UILabel().then{
        $0.text = "  "
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 20)
        $0.textColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
        $0.isHidden = true
    }
    
    let nextButton = UIButton(type: .system).then{
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.layer.cornerRadius = 6
        $0.backgroundColor = .mainColor
        $0.isHidden = true
    }
    
    let recordProgressbar = UIProgressView().then{
        $0.isHidden = true
    }
    let playtimeStart = UILabel().then{
        $0.text = "00:00"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 13)
        $0.textColor = .lightGray
        $0.isHidden = true
    }
    let playtimeEnd = UILabel().then{
        $0.text = "00:01"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 13)
        $0.textColor = .lightGray
        $0.isHidden = true
    }
    
    //MARK: - For STT
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer?
    var audioUrl: URL?
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    var text: String?
    
    //MARK: - For timer
    var timer:Timer = Timer()
    var count:Int = 0
    var timeCounting: Bool = false
    
    //MARK: - For progressBar
    var progressTimer : Timer!
    let timePlayerSelector:Selector = #selector(updatePlayTime)
    let timeRecordSelector:Selector = #selector(updateRecordTime)

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true;
        setupView()
        setupLayout()
        addTarget()
        checkTodayDate()
        recordingSession = AVAudioSession.sharedInstance()

        do {
                        // 오디오 세션의 카테고리와 모드를 설정한다.
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
                        // 음성 녹음 권한을 요청한다.
            recordingSession.requestRecordPermission() { allowed in
                if allowed {
                    print("음성 녹음 허용")
                } else {
                    print("음성 녹음 비허용")
                }
            }
        } catch {
            print("음성 녹음 실패")
        }
        
        SFSpeechRecognizer.requestAuthorization { (status) in
                    switch status {
                    case .notDetermined: print("Not determined")
                    case .restricted: print("Restricted")
                    case .denied: print("Denied")
                    case .authorized: print("We can recognize speech now.")
                    @unknown default: print("Unknown case")
                    }
                }
    }
    
    //MARK: - Selector
    func checkTodayDate(){
        var formatter_year = DateFormatter()
        formatter_year.dateFormat = "MM월 dd일"
        var current_year_string = formatter_year.string(from: Date())
        self.date.text = current_year_string
    }
    
    @objc func mainButtonTapped(sender: UITapGestureRecognizer) {

        if self.mainButton.image == UIImage(named:"pause.blue")?.withRenderingMode(.alwaysOriginal){
            print("playPauseButtonTapped")
            playPauseButtonTapped()

        }
        else if self.mainButton.image == UIImage(named:"pauseRecording")?.withRenderingMode(.alwaysOriginal){
            pauseButtonTapped()
            print("pauseButtonTapped")

        }
        else if self.mainButton.image == UIImage(named:"continueRecording")?.withRenderingMode(.alwaysOriginal){
            continueButtonTapped()
            print("continueButtonTapped")

        }
        else if self.mainButton.image == UIImage(named:"play.blue")?.withRenderingMode(.alwaysOriginal){
            playButtonTapped()
            print("playButtonTapped")

        }
        else{
            self.mainButton.image = UIImage(named: "startRecording")?.withRenderingMode(.alwaysOriginal)
            recordButtonTapped()
            print("recordButtonTapped")
        }
    }
    
    @objc func deleteTapped(){
        let VC1 = DeleteViewController()
        VC1.delegate = self
        VC1.modalPresentationStyle = .overCurrentContext
        present(VC1, animated: false)

    }
    @objc func nextTapped(){
        let VC2 = SaveViewController()
        VC2.modalPresentationStyle = .overCurrentContext
        present(VC2, animated: false)
    }
    @objc func backTapped(){
        dismiss(animated: false)
    }
    
    //MARK: - For STT
    @objc func recordButtonTapped() {
        //녹음 시작, 이미지는 pause
        self.mainButton.image = UIImage(named:"pauseRecording")?.withRenderingMode(.alwaysOriginal)
        
        self.STTText.isHidden = false
        self.done.isHidden = false
        self.timerLabel.isHidden = false
        self.startMsg.isHidden = true
        self.delete.isHidden = true
        self.nextButton.isHidden = true
        
        self.line2.isHidden = false
        self.recordProgressbar.isHidden = true
        self.playtimeStart.isHidden = true
        self.playtimeEnd.isHidden = true
        startRecording()
    }
    @objc func pauseButtonTapped(){
        //녹음 멈춤, 이미지는 계속
        self.mainButton.image = UIImage(named:"continueRecording")?.withRenderingMode(.alwaysOriginal)
        
        self.STTText.isHidden = false
        self.done.isHidden = false
        self.timerLabel.isHidden = false
        self.startMsg.isHidden = true
        self.delete.isHidden = true
        self.nextButton.isHidden = true
        
        self.line2.isHidden = false
        self.recordProgressbar.isHidden = true
        self.playtimeStart.isHidden = true
        self.playtimeEnd.isHidden = true
        
        stopRecording()
    }
                                        
    @objc func continueButtonTapped(){
        //녹음 재개, 이미지는 pauseRecording
        self.mainButton.image = UIImage(named:"pauseRecording")?.withRenderingMode(.alwaysOriginal)
        
        self.STTText.isHidden = false
        self.done.isHidden = false
        self.timerLabel.isHidden = false
        self.startMsg.isHidden = true
        self.delete.isHidden = true
        self.nextButton.isHidden = true
        
        self.line2.isHidden = false
        self.recordProgressbar.isHidden = true
        self.playtimeStart.isHidden = true
        self.playtimeEnd.isHidden = true
        
        continueRecording()
    }
                                        
    @objc func doneTapped(){
        //녹음 finish, 이미지는 play.blue
        self.mainButton.image = UIImage(named:"play.blue")?.withRenderingMode(.alwaysOriginal)
        
        finishRecording(success: true)
        transcribeAudio()
//        let data = try? Data.init(contentsOf: audioRecorder.url)
//        
//
//        if data != nil {
//            print("data 존재")
//        }
        audioPlayer = try? AVAudioPlayer(contentsOf: audioRecorder.url)
        audioPlayer?.delegate = self
        
        self.STTText.isHidden = false
        self.delete.isHidden = false
        self.nextButton.isHidden = false
        self.timerLabel.isHidden = true
        self.startMsg.isHidden = true
        self.done.isHidden = true
        
        self.line2.isHidden = true
        self.recordProgressbar.isHidden = false
        self.playtimeStart.isHidden = false
        self.playtimeEnd.isHidden = false
        
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
    }
    
    @objc func playButtonTapped() {
        //오디오 파일 재생, 이미지는 pause.blue
        self.mainButton.image = UIImage(named:"pause.blue")?.withRenderingMode(.alwaysOriginal)
        
        self.STTText.isHidden = false
        self.delete.isHidden = false
        self.nextButton.isHidden = false
        self.timerLabel.isHidden = true
        self.startMsg.isHidden = true
        self.done.isHidden = true
        
        self.line2.isHidden = true
        self.recordProgressbar.isHidden = false
        self.playtimeStart.isHidden = false
        self.playtimeEnd.isHidden = false
        
        audioPlayer?.play()
        
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    
    @objc func playPauseButtonTapped() {
        //오디오 파일 재생 멈춤, 이미지는 play.blue
        self.mainButton.image = UIImage(named:"play.blue")?.withRenderingMode(.alwaysOriginal)
        self.STTText.isHidden = false
        self.delete.isHidden = false
        self.nextButton.isHidden = false
        self.timerLabel.isHidden = true
        self.startMsg.isHidden = true
        self.done.isHidden = true
        
        self.line2.isHidden = true
        self.recordProgressbar.isHidden = false
        self.playtimeStart.isHidden = false
        self.playtimeEnd.isHidden = false
        
        audioPlayer?.pause()
        
        timeCounting = false
        
        }
    
    @objc func transcribeAudio() {
        self.audioUrl = audioRecorder.url
        guard let audioUrl = audioUrl else {
            print("Can't find audio url")
            return
        }

        if speechRecognizer!.isAvailable {
            let request = SFSpeechURLRecognitionRequest(url: audioUrl)
            speechRecognizer?.supportsOnDeviceRecognition = true
            speechRecognizer?.recognitionTask(
                with: request,
                resultHandler: { (result, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else if let result = result {
                        print(result.bestTranscription.formattedString)
                        if result.isFinal {
                            self.text = result.bestTranscription.formattedString
                            self.STTText.text = result.bestTranscription.formattedString
                            }
                        }
                    })
                }
        
    }
    //MARK: - For timer
    @objc func timerCounter() -> Void{
        count = count + 1
        let time = secondsToMinutesSeconds(seconds: count)
        let timeString = makeTimeString(minutes: time.0, seconds: time.1)
        timerLabel.text = timeString
        playtimeEnd.text = timeString
    }
    
    func secondsToMinutesSeconds(seconds: Int) -> (Int, Int){
        return (((seconds % 3600)/60),((seconds % 3600) % 60))
    }
    
    func makeTimeString( minutes: Int, seconds: Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    //MARK: - For progressBar
    
    @objc func initPlay(){
        playtimeEnd.text = convertNSTimeInterval2String(audioPlayer!.duration)
        playtimeStart.text = convertNSTimeInterval2String(0)
    }
    
    func convertNSTimeInterval2String(_ time:TimeInterval) -> String {
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }
    
    @objc func updatePlayTime() {
        playtimeStart.text = convertNSTimeInterval2String(audioPlayer!.currentTime)
        recordProgressbar.progress = Float(audioPlayer!.currentTime/audioPlayer!.duration)
    }
    @objc func updateRecordTime() {
            playtimeEnd.text = convertNSTimeInterval2String(audioRecorder!.currentTime)
        }
    
    //MARK: - addSubView
    private func setupView(){
        self.view.addSubview(self.arrowLeft)
        self.view.addSubview(self.date)
        self.view.addSubview(self.delete)
        self.view.addSubview(self.line1)
        self.view.addSubview(self.line2)
        self.view.addSubview(self.startMsg)
        self.view.addSubview(self.STTText)
        self.view.addSubview(self.baseCircle)
        self.view.addSubview(self.mainButton)
        self.view.addSubview(self.done)
        self.view.addSubview(self.timerLabel)
        self.view.addSubview(self.nextButton)
        self.view.addSubview(self.recordProgressbar)
        self.view.addSubview(self.playtimeStart)
        self.view.addSubview(self.playtimeEnd)
    }
    
    //MARK: - Layout
    private func setupLayout(){
        self.arrowLeft.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(55)
            $0.leading.equalTo(self.view.snp.leading).offset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        self.date.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(61)
        }
        self.delete.snp.makeConstraints{
            $0.trailing.equalTo(self.view.snp.trailing).offset(-29)
            $0.top.equalTo(self.view.snp.top).offset(61)
        }
        
        self.line1.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(107)
            $0.width.equalTo(331)
            $0.height.equalTo(1)
        }
        self.line2.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-218)
            $0.width.equalTo(331)
            $0.height.equalTo(1)
        }
        self.startMsg.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.line1.snp.bottom).offset(215)
        }
        self.STTText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.line1.snp.bottom).offset(28)
            $0.width.equalTo(307)
        }
        self.baseCircle.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-135)
            $0.width.height.equalTo(69)
        }
        self.mainButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-142)
            $0.width.height.equalTo(55)
        }
        self.timerLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.baseCircle.snp.bottom).offset(15)
        }
        self.done.snp.makeConstraints{
            $0.trailing.equalTo(self.view.snp.trailing).offset(-30)
            $0.bottom.equalTo(self.view.snp.bottom).offset(-141)
            $0.width.equalTo(75)
            $0.height.equalTo(45)
            
        }
        self.nextButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
//            $0.centerY.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-50)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        self.recordProgressbar.snp.makeConstraints{
            $0.bottom.equalTo(self.view.snp.bottom).offset(-230)
            $0.leading.equalToSuperview().offset(29)
            $0.trailing.equalToSuperview().offset(-29)
        }
        self.playtimeStart.snp.makeConstraints{
            $0.top.equalTo(self.recordProgressbar.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(29)
        }
        self.playtimeEnd.snp.makeConstraints{
            $0.top.equalTo(self.recordProgressbar.snp.bottom).offset(13)
            $0.trailing.equalToSuperview().offset(-29)
        }
        
    }
    
    //MARK: - AddTarget
    private func addTarget(){
        let mainBtn = UITapGestureRecognizer(target: self, action: #selector(mainButtonTapped))
        mainButton.isUserInteractionEnabled = true
        mainButton.addGestureRecognizer(mainBtn)
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        arrowLeft.isUserInteractionEnabled = true
        arrowLeft.addGestureRecognizer(backBtn)
        self.delete.addTarget(self, action: #selector(self.deleteTapped), for: .touchUpInside)
        self.done.addTarget(self, action: #selector(self.doneTapped), for: .touchUpInside)
        self.nextButton.addTarget(self, action: #selector(self.nextTapped), for: .touchUpInside)
    }
}

// MARK: - Recording
extension RecordViewController {
    func startRecording() {
        timeCounting = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.wav")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 16000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()

            print("녹음 시작")
        } catch {
            finishRecording(success: false)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func stopRecording(){
        print("stopRecording")
        timeCounting = false
        timer.invalidate()
        audioRecorder.pause()
    }
    
    func continueRecording(){
        print("continueRecording")
        timeCounting = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        audioRecorder.record()
    }
    
    func finishRecording(success: Bool) {
        timeCounting = false
        timer.invalidate()
        audioRecorder.stop()
        if success {
            print("finishRecording - success")
        } else {
            print("finishRecording - fail")
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        progressTimer.invalidate()
        if !flag {
            finishRecording(success: false)
        }
    }
}

extension RecordViewController: SendYesDelegate{
    func sendYes(yes: Bool) {
        if yes == true{
            self.mainButton.image = UIImage(named: "startRecording")?.withRenderingMode(.alwaysOriginal)
            self.startMsg.isHidden = false
            self.STTText.isHidden = true
            self.STTText.text = "  "
            
            self.done.isHidden = true
            self.timerLabel.isHidden = true
            self.timerLabel.text = "  "
            self.delete.isHidden = true
            self.nextButton.isHidden = true
            
            self.line2.isHidden = false
            self.recordProgressbar.isHidden = true
            self.playtimeStart.isHidden = true
            self.playtimeEnd.isHidden = true
            self.count = 0
        }
    }
}
