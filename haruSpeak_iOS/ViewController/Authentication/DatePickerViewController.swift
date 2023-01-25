//
//  DatePickerViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/25.
//


import Foundation
import UIKit
import SnapKit
import Then
import Foundation
import UIKit
import SnapKit
import Then

class DatePickerViewController: UIViewController{
    
    //MARK: - Properties
    let popView = UIView().then{
        $0.backgroundColor = UIColor.systemGray6    }
    
    private let done = UIButton().then{
        $0.setTitle("Done", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 18)
    }
    private let datePicker = UIDatePicker().then{
            $0.datePickerMode = .date
            $0.preferredDatePickerStyle = .wheels
            $0.locale = Locale(identifier: "ko_KR")
        }
    

//MARK: - LifeCycle
    override func viewDidLoad() {
        self.view.backgroundColor = .black.withAlphaComponent(0.3)
        setUpView()
        layout()
        addTarget()
        
    }
//MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.popView)
        self.popView.addSubview(done)
        self.popView.addSubview(self.datePicker)

    }

//MARK: - Selector
    @objc private func didClickDone(_ button: UIButton) {
        dismiss(animated: false)
    }
    @objc private func didClickBack() {
        dismiss(animated: false)
    }
    
    
    
//MARK: - Layout
    func layout(){
        self.popView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
            $0.bottom.equalToSuperview().offset(0)
            $0.size.height.equalTo(316)
        }
        self.done.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(self.popView.snp.top).offset(10)
        }
        self.datePicker.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
            $0.bottom.equalToSuperview().offset(0)
            $0.size.height.equalTo(290)
        }
    }
    
//MARK: - Target
    func addTarget(){
        self.done.addTarget(self, action: #selector(self.didClickDone(_:)), for: .touchUpInside)
        let close = UITapGestureRecognizer(target: self, action: #selector(didClickBack))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(close)
    }
    

}
