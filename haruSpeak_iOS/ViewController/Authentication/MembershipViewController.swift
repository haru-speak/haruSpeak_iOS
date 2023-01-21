//
//  JoinMembershipViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/14.
//

import Foundation
import UIKit
import SnapKit
import Then
//Need to add date UIpicker & textfield underline
//Need to add check images
class MembershipViewController: UIViewController{
    //MARK: - Properties
    let arrowLeft = UIButton(type: .system).then{
        $0.setTitle("arrowLeft", for: .normal)
        $0.setImage(UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    let membershipText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.text = "회원가입"
        $0.textColor = .black
    }
    let idText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.text = "아이디 (이메일)"
        $0.textColor = .black
    }
    let idTextField = UITextField().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.placeholder = " 이메일 주소"
        $0.layer.cornerRadius = 6
        $0.borderStyle = .none
        $0.textColor = .systemGray5
    }
    let pwText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.text = "비밀번호"
        $0.textColor = .black
    }
    let pwTextField = UITextField().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.placeholder = " 비밀번호를 입력해주세요."
        $0.layer.cornerRadius = 6
        $0.textColor = .systemGray5
    }
    let pwCheckText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.text = "비밀번호 확인"
        $0.textColor = .black
    }
    let pwCheckTextField = UITextField().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.placeholder = " 다시 한번 입력해주세요."
        $0.layer.cornerRadius = 6
        $0.textColor = .systemGray5
    }
    let nameText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.text = "이름"
        $0.textColor = .black
    }
    let nameTextField = UITextField().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.placeholder = " 이름을 입력해주세요."
        $0.layer.cornerRadius = 6
        $0.textColor = .systemGray5
    }
    let birthText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.text = "생년월일"
        $0.textColor = .black
    }
//    let date = UITextField().then{
//        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
//        $0.placeholder = " 생년월일"
//        $0.layer.cornerRadius = 6
//        $0.textColor = .systemGray5
//    }
    let date = UIDatePicker().then{
        $0.datePickerMode = .date
        $0.preferredDatePickerStyle = .wheels
        $0.locale = Locale(identifier: "ko_KR")
    }
    let genderText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
        $0.text = "성별"
        $0.textColor = .black
    }
    let idCheckButton = UIButton(type: .system).then{
        $0.setTitle("중복확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 15)
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .mainColor
    }
    let man = UIButton(type: .system).then{
        $0.setTitle("남성", for: .normal)
        $0.setTitleColor(.systemGray5, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.layer.cornerRadius = 20
        $0.layer.borderColor = UIColor.systemGray5.cgColor
        $0.layer.borderWidth = 1
        $0.tag = 0
    }
    let woman = UIButton(type: .system).then{
        $0.setTitle("여성", for: .normal)
        $0.setTitleColor(.systemGray5, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.layer.cornerRadius = 20
        $0.layer.borderColor = UIColor.systemGray5.cgColor
        $0.layer.borderWidth = 1
        $0.tag = 1
    }

    let membershipButton = UIButton(type: .system).then{
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.layer.cornerRadius = 7
        $0.backgroundColor = .mainColor
    }
    //textfield underline
    let line1 = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    let line2 = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    let line3 = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    let line4 = UIView().then{
        $0.backgroundColor = .systemGray5
    }
    //textfield check image
    let check1 = UIImageView().then{
        $0.image = UIImage(named: "check.blue")?.withRenderingMode(.alwaysOriginal)
    }
    let check2 = UIImageView().then{
        $0.image = UIImage(named: "check.blue")?.withRenderingMode(.alwaysOriginal)
    }
    let check3 = UIImageView().then{
        $0.image = UIImage(named: "check.blue")?.withRenderingMode(.alwaysOriginal)
    }
    let check4 = UIImageView().then{
        $0.image = UIImage(named: "check.blue")?.withRenderingMode(.alwaysOriginal)
    }
    //textfield 오류 멘트
    let idErr = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 12)
        $0.text = "형식에 맞지 않는 이메일입니다."
        $0.textColor = .red
    }
    let pwErr = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 12)
        $0.text = "최소 8자리를 입력해주세요. (영문, 숫자 포함)"
        $0.textColor = .red
    }
    let pwCheckErr = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 12)
        $0.text = "비밀번호가 일치하지 않습니다."
        $0.textColor = .red
    }
    
    
    private var lineLayer: CALayer?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupLayout()
        addTarget()
    }
    
    
    //MARK: - Selector
    @objc func arrowLeftButtonTapped(){
        self.navigationController?.pushViewController(AuthenticationViewController(), animated: true)
    }
    
    @objc func membershipButtonTapped(){
        self.navigationController?.pushViewController(MSDoneViewController(), animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc private func genderButtonTapped(_ button: UIButton) {
        switch button.tag {
        case 0: self.manButtonTapped()
        case 1: self.womanButtonTapped()
        default: break
        }
    }
    
    @objc func manButtonTapped(){
        man.setTitleColor(.mainColor, for: .normal)
        man.layer.borderColor = UIColor.mainColor.cgColor
        woman.setTitleColor(.systemGray5, for: .normal)
        woman.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    @objc func womanButtonTapped(){
        woman.setTitleColor(.mainColor, for: .normal)
        woman.layer.borderColor = UIColor.mainColor.cgColor
        man.setTitleColor(.systemGray5, for: .normal)
        man.layer.borderColor = UIColor.systemGray5.cgColor
    }

        
       
    
    //MARK: - addSubView
        private func setupView(){
            self.view.addSubview(self.arrowLeft)
            self.view.addSubview(self.membershipText)
            self.view.addSubview(self.idText)
            self.view.addSubview(self.idTextField)
            self.view.addSubview(self.pwText)
            self.view.addSubview(self.pwTextField)
            self.view.addSubview(self.pwCheckText)
            self.view.addSubview(self.pwCheckTextField)
            self.view.addSubview(self.nameText)
            self.view.addSubview(self.nameTextField)
            self.view.addSubview(self.birthText)
            self.view.addSubview(self.date)
            self.view.addSubview(self.genderText)
            self.view.addSubview(self.idCheckButton)
            self.view.addSubview(self.man)
            self.view.addSubview(self.woman)
            self.view.addSubview(self.membershipButton)
            self.view.addSubview(self.line1)
            self.view.addSubview(self.line2)
            self.view.addSubview(self.line3)
            self.view.addSubview(self.line4)
            self.view.addSubview(self.check1)
            self.view.addSubview(self.check2)
            self.view.addSubview(self.check3)
            self.view.addSubview(self.check4)
            self.view.addSubview(self.idErr)
            self.view.addSubview(self.pwErr)
            self.view.addSubview(self.pwCheckErr)
        }
    
    //MARK: - Layout
    private func setupLayout(){
        self.arrowLeft.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(55)
            $0.leading.equalTo(self.view.snp.leading).offset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        
        self.membershipText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(61)
        }
        //
        self.idText.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(29)
            $0.top.equalTo(self.membershipText.snp.bottom).offset(29)
        }

        self.idTextField.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(27)
            $0.top.equalTo(self.idText.snp.bottom).offset(5)
            $0.width.equalTo(207)
            $0.height.equalTo(40)
        }

        self.pwText.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(29)
            $0.top.equalTo(self.idTextField.snp.bottom).offset(34)
        }

        self.pwTextField.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(27)
            $0.top.equalTo(self.pwText.snp.bottom).offset(5)
            $0.width.equalTo(307)
            $0.height.equalTo(40)
        }
        
        self.pwCheckText.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(29)
            $0.top.equalTo(self.pwTextField.snp.bottom).offset(34)
        }

        self.pwCheckTextField.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(27)
            $0.top.equalTo(self.pwCheckText.snp.bottom).offset(5)
            $0.width.equalTo(307)
            $0.height.equalTo(40)
        }

        self.nameText.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(29)
            $0.top.equalTo(self.pwCheckTextField.snp.bottom).offset(34)
        }

        self.nameTextField.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(27)
            $0.top.equalTo(self.nameText.snp.bottom).offset(5)
            $0.width.equalTo(307)
            $0.height.equalTo(40)
        }

        self.birthText.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(29)
            $0.top.equalTo(self.nameTextField.snp.bottom).offset(34)
        }

        self.date.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(29)
            $0.top.equalTo(self.birthText.snp.bottom).offset(10)
            $0.width.equalTo(335)
            $0.height.equalTo(40)
        }

        self.genderText.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(29)
            $0.top.equalTo(self.date.snp.bottom).offset(34)
        }

        self.idCheckButton.snp.makeConstraints{
            $0.trailing.equalTo(self.view.snp.trailing).offset(-28)
            $0.top.equalTo(self.membershipText.snp.bottom).offset(52)
            $0.width.equalTo(86)
            $0.height.equalTo(40)
        }
        
        self.man.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(16)
            $0.top.equalTo(self.genderText.snp.bottom).offset(10)
            $0.width.equalTo(164)
            $0.height.equalTo(42)
        }
        self.woman.snp.makeConstraints{
            $0.trailing.equalTo(self.view.snp.trailing).offset(-29)
            $0.top.equalTo(self.genderText.snp.bottom).offset(10)
            $0.width.equalTo(164)
            $0.height.equalTo(42)
            
        }

        self.membershipButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-60)//44
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        self.line1.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(27)
            $0.top.equalTo(self.idText.snp.bottom).offset(45)
            $0.width.equalTo(207)
            $0.height.equalTo(1)
        }
        self.line2.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(27)
            $0.top.equalTo(self.pwText.snp.bottom).offset(45)
            $0.width.equalTo(335)
            $0.height.equalTo(1)
        }
        self.line3.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(27)
            $0.top.equalTo(self.pwCheckText.snp.bottom).offset(45)
            $0.width.equalTo(335)
            $0.height.equalTo(1)
        }
        self.line4.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(27)
            $0.top.equalTo(self.nameText.snp.bottom).offset(45)
            $0.width.equalTo(335)
            $0.height.equalTo(1)
        }
        
        self.check1.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(234)
            $0.top.equalTo(self.idText.snp.bottom).offset(13)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        self.check2.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(334)
            $0.top.equalTo(self.pwText.snp.bottom).offset(13)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        self.check3.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(334)
            $0.top.equalTo(self.pwCheckText.snp.bottom).offset(13)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        self.check4.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(334)
            $0.top.equalTo(self.nameText.snp.bottom).offset(13)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        
        self.idErr.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(30)
            $0.top.equalTo(self.idText.snp.bottom).offset(45)
        }
        self.pwErr.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(30)
            $0.top.equalTo(self.pwText.snp.bottom).offset(45)
        }
        self.pwCheckErr.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(30)
            $0.top.equalTo(self.pwCheckText.snp.bottom).offset(45)
        }
        
    }
    
//MARK: - AddTarget
    private func addTarget(){
        self.arrowLeft.addTarget(self, action: #selector(self.arrowLeftButtonTapped), for: .touchUpInside)
        self.membershipButton.addTarget(self, action: #selector(self.membershipButtonTapped), for: .touchUpInside)
        self.man.addTarget(self, action: #selector(self.genderButtonTapped), for: .touchUpInside)
        self.woman.addTarget(self, action: #selector(self.genderButtonTapped), for: .touchUpInside)
    }
}
