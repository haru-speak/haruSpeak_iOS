//
//  SaveViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/21.
//

import Foundation
import UIKit
import SnapKit
import Then

class SaveViewController: UIViewController, UITextFieldDelegate{
    
    //MARK: - Properties
    let popView = UIView().then{
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    let setTitle = UITextField().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.placeholder = " 오늘의 스피킹에 제목을 달아주세요 :)"
        $0.textColor = .gray
    }
    
    let line = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    let setText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.text = "공개 범위 설정"
        $0.textColor = .black
    }
    let pub = UILabel().then{
//        0: open
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.text = "공개"
        $0.textColor = .black
    }
    let onlyFriend = UILabel().then{
//        1: friend
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.text = "친구만 공개"
        $0.textColor = .black
    }
    let pri = UILabel().then{
//        2: closed
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.text = "비공개"
        $0.textColor = .black
    }
    let base1 = UIImageView().then{
        $0.image = UIImage(named: "radioButtonBase")?.withRenderingMode(.alwaysOriginal)
    }
    let base2 = UIImageView().then{
        $0.image = UIImage(named: "radioButtonBase")?.withRenderingMode(.alwaysOriginal)
    }
    let base3 = UIImageView().then{
        $0.image = UIImage(named: "radioButtonBase")?.withRenderingMode(.alwaysOriginal)
    }
    let selected1 = UIImageView().then{
        $0.image = UIImage(named: "selected")?.withRenderingMode(.alwaysOriginal)
        $0.isHidden = true
    }
    let selected2 = UIImageView().then{
        $0.image = UIImage(named: "selected")?.withRenderingMode(.alwaysOriginal)
        $0.isHidden = true
    }
    let selected3 = UIImageView().then{
        $0.image = UIImage(named: "selected")?.withRenderingMode(.alwaysOriginal)
        $0.isHidden = true
    }
    let uploadButton = UIButton().then{
        $0.backgroundColor = .mainColor
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("올리기", for: .normal)
    }
    let backButton = UIButton().then{
        $0.backgroundColor = .mainColor
        $0.setImage(UIImage(systemName:"backBlue")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    var privacyBound = 0
    var Recordingtitle : String?
    let formatter = DateFormatter()
    let date = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.text = "MM월 dd일"
        $0.textColor = .lightGray
    }

    

//MARK: - LifeCycle
    override func viewDidLoad() {
        self.view.backgroundColor = .black.withAlphaComponent(0.3)
        setKeyboardObserver()
        setUpView()
        layout()
        addTarget()
        checkTodayDate()
        
    }

//MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.popView)
        self.popView.addSubview(self.uploadButton)
        self.popView.addSubview(self.setTitle)
        self.popView.addSubview(self.line)
        self.popView.addSubview(self.setText)
        self.popView.addSubview(self.pub)
        self.popView.addSubview(self.onlyFriend)
        self.popView.addSubview(self.pri)
        self.popView.addSubview(self.base1)
        self.popView.addSubview(self.base2)
        self.popView.addSubview(self.base3)
        self.popView.addSubview(self.selected1)
        self.popView.addSubview(self.selected2)
        self.popView.addSubview(self.selected3)
        self.popView.addSubview(self.backButton)
    }

//MARK: - Selector
    func checkTodayDate(){
        var formatter_year = DateFormatter()
        formatter_year.dateFormat = "MM월 dd일"
        var current_year_string = formatter_year.string(from: Date())
        self.date.text = current_year_string
    }
    
    @objc private func keyboardDown(){
        self.setTitle.resignFirstResponder()
    }
    
    @objc private func didClickBack(_ button: UIButton) {
        dismiss(animated: false)
        print("didClickBack")
    }

    @objc private func didClickUpload(_ button: UIButton) {
        Recordingtitle = setTitle.text
        print(Recordingtitle)
        print(privacyBound)
        print(date.text)
    }
    
    @objc private func didClickPub(sender: UITapGestureRecognizer){
        privacyBound = 0
        self.selected1.isHidden = false
        self.selected2.isHidden = true
        self.selected3.isHidden = true
    }
    @objc private func didClickonlyFriend(sender: UITapGestureRecognizer){
        privacyBound = 1
        self.selected2.isHidden = false
        self.selected1.isHidden = true
        self.selected3.isHidden = true
    }
    @objc private func didClickPri(sender: UITapGestureRecognizer){
        privacyBound = 2
        self.selected3.isHidden = false
        self.selected2.isHidden = true
        self.selected1.isHidden = true
    }
    
    
//MARK: - Layout
    func layout(){
        self.popView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
            $0.bottom.equalToSuperview().offset(0)
            $0.size.height.equalTo(241)
            
        }
        self.setTitle.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.popView.snp.top).offset(33)
            $0.width.equalTo(331)
            $0.height.equalTo(35)
        }
        self.line.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.popView.snp.top).offset(68)
            $0.width.equalTo(331)
            $0.height.equalTo(1)
            
        }
        self.setText.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(30)
            $0.top.equalTo(self.line.snp.top).offset(27)
        }
        self.pub.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(52)
            $0.top.equalTo(self.line.snp.top).offset(66)
        }
        self.onlyFriend.snp.makeConstraints{
            $0.leading.equalTo(self.pub.snp.trailing).offset(68)
            $0.top.equalTo(self.line.snp.top).offset(66)
        }
        self.pri.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-69)
            $0.top.equalTo(self.line.snp.top).offset(66)
        }
        self.base1.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(30)
            $0.top.equalTo(self.line.snp.top).offset(66)
            $0.width.height.equalTo(15)
        }
        self.base2.snp.makeConstraints{
            $0.trailing.equalTo(self.onlyFriend.snp.leading).offset(-7)
            $0.top.equalTo(self.line.snp.top).offset(66)
            $0.width.height.equalTo(15)
        }
        self.base3.snp.makeConstraints{
            $0.trailing.equalTo(self.pri.snp.leading).offset(-7)
            $0.top.equalTo(self.line).offset(66)
            $0.width.height.equalTo(15)
        }
        self.selected1.snp.makeConstraints{
            $0.centerX.equalTo(self.base1)
            $0.centerY.equalTo(self.base1)
            $0.width.height.equalTo(9)
        }
        self.selected2.snp.makeConstraints{
            $0.centerX.equalTo(self.base2)
            $0.centerY.equalTo(self.base2)
            $0.width.height.equalTo(9)
        }
        self.selected3.snp.makeConstraints{
            $0.centerX.equalTo(self.base3)
            $0.centerY.equalTo(self.base3)
            $0.width.height.equalTo(9)
        }
        self.uploadButton.snp.makeConstraints{
            $0.bottom.equalTo(self.popView.snp.bottom).offset(0)
            $0.leading.equalTo(self.popView.snp.leading).offset(0)
            $0.trailing.equalTo(self.popView.snp.trailing).offset(0)
            $0.height.equalTo(74)
        }
        self.backButton.snp.makeConstraints{
            $0.top.equalTo(self.popView.snp.top).offset(14)
            $0.trailing.equalToSuperview().offset(-16)
            $0.size.width.height.equalTo(24)
        }
    }
    
//MARK: - Target
    func addTarget(){
        let down = UITapGestureRecognizer(target: self, action: #selector(self.keyboardDown))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(down)
        self.backButton.addTarget(self, action: #selector(self.didClickBack(_:)), for: .touchUpInside)
        
        self.uploadButton.addTarget(self, action: #selector(self.didClickUpload(_:)), for: .touchUpInside)

        let pubBtn = UITapGestureRecognizer(target: self, action: #selector(didClickPub(sender: )))
        pub.isUserInteractionEnabled = true
        pub.addGestureRecognizer(pubBtn)
        
        let pubBtn2 = UITapGestureRecognizer(target: self, action: #selector(didClickPub(sender: )))
        base1.isUserInteractionEnabled = true
        base1.addGestureRecognizer(pubBtn2)
        
        let onlyFriendBtn = UITapGestureRecognizer(target: self, action: #selector(didClickonlyFriend(sender: )))
        onlyFriend.isUserInteractionEnabled = true
        onlyFriend.addGestureRecognizer(onlyFriendBtn)
        
        let onlyFriendBtn2 = UITapGestureRecognizer(target: self, action: #selector(didClickonlyFriend(sender: )))
        base2.isUserInteractionEnabled = true
        base2.addGestureRecognizer(onlyFriendBtn2)
        
        let priBtn = UITapGestureRecognizer(target: self, action: #selector(didClickPri(sender: )))
        pri.isUserInteractionEnabled = true
        pri.addGestureRecognizer(priBtn)
        
        let priBtn2 = UITapGestureRecognizer(target: self, action: #selector(didClickPri(sender: )))
        base3.isUserInteractionEnabled = true
        base3.addGestureRecognizer(priBtn2)
        
       }
        
    }

extension SaveViewController {
    
    func setKeyboardObserver() {
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object:nil)
        }
        
        @objc func keyboardWillShow(notification: NSNotification) {
              if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                      let keyboardRectangle = keyboardFrame.cgRectValue
                      let keyboardHeight = keyboardRectangle.height
                  UIView.animate(withDuration: 1) {
                      self.view.window?.frame.origin.y -= keyboardHeight
                  }
              }
          }
        
        @objc func keyboardWillHide(notification: NSNotification) {
            if self.view.window?.frame.origin.y != 0 {
                if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                        let keyboardRectangle = keyboardFrame.cgRectValue
                        let keyboardHeight = keyboardRectangle.height
                    UIView.animate(withDuration: 1) {
                        self.view.window?.frame.origin.y += keyboardHeight
                    }
                }
            }
        }
    }
