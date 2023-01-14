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

class RecordViewController: UIViewController{
    //MARK: - Properties
    let arrowLeft = UIButton().then{
        $0.setTitle("arrowLeft", for: .normal)
        $0.setImage(UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    let date = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo", size: 16)
        $0.text = "12월 8일"
        $0.textColor = .lightGray
    }

//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupLayout()
    }
//MARK: - addSubView
    private func setupView(){
        self.view.addSubview(self.arrowLeft)
        self.view.addSubview(self.date)
        
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
            $0.top.equalTo(self.view.snp.top).offset(55)
        }
    }
}
