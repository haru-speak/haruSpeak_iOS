//
//  CustomTabbar.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/12.
//

import UIKit
import Then
import SnapKit

enum topTabBarItem {
    case myLog
    case myMate
    case all
}

final class CustomTabbar: UIView {
    //MARK: - Properties
    var selectedItem: topTabBarItem = .myLog
    
    private let myLogButton = UIButton(type: .system).then {
        $0.setTitle("my log", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .appleSDGothicNeo(size: 14)
        $0.tag = 0
    }
    
    private let myMateButton = UIButton(type: .system).then {
        $0.setTitle("my mate", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont.appleSDGothicNeo(size: 14)
        $0.tag = 1
    }
    
    private let allButton = UIButton(type: .system).then {
        $0.setTitle("all", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont.appleSDGothicNeo(size: 14)
        $0.tag = 2
    }
    
    private var lineLayer: CALayer?
    private var indicatorLayer: CALayer?
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.layout()
        self.addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if self.lineLayer == nil {
            _ = CALayer().then {
                $0.backgroundColor = UIColor.lightGray.cgColor
                self.layer.addSublayer($0)
                self.lineLayer = $0
                $0.frame = CGRect(x: 5,
                                  y: self.frame.height,
                                  width: self.frame.width,
                                  height: 1)
            }
        }
        
        if self.indicatorLayer == nil {
            _ = CALayer().then {
                $0.backgroundColor = UIColor.mainColor.cgColor
                self.layer.addSublayer($0)
                self.indicatorLayer = $0
                $0.frame = CGRect(x: 5,
                                  y: self.frame.height-0.5,
                                  width: 54,
                                  height: 2)
            }
        }
    }
    
    //MARK: - Method
    private func highlightmyLog() {
        UIView.animate(withDuration: 1.0) {
            self.indicatorLayer!.frame = .init(x: 5,
                                              y: self.frame.height-0.5,
                                              width: 54,
                                              height: 2)
        }
        
        self.myLogButton.setTitleColor(.black, for: .normal)
        self.myLogButton.titleLabel?.font = .appleSDGothicNeo(size: 14, family: .Bold)
        
        self.myMateButton.setTitleColor(.lightGray, for: .normal)
        self.myMateButton.titleLabel?.font = .appleSDGothicNeo(size: 14)
        
        self.allButton.setTitleColor(.lightGray, for: .normal)
        self.allButton.titleLabel?.font = .appleSDGothicNeo(size: 14)
        
        self.selectedItem = .myLog
        
        
    }
    
    func highlightmyMate() {
        UIView.animate(withDuration: 1.0) {
            self.indicatorLayer!.frame = .init(x:70,
                                               y: self.frame.height-0.5,
                                               width: 74,
                                               height: 2)
        }
        
        self.myLogButton.setTitleColor(.lightGray, for: .normal)
        self.myLogButton.titleLabel?.font = .appleSDGothicNeo(size: 14)
        
        self.myMateButton.setTitleColor(.black, for: .normal)
        self.myMateButton.titleLabel?.font = .appleSDGothicNeo(size: 14, family: .Bold)
        
        self.allButton.setTitleColor(.lightGray, for: .normal)
        self.allButton.titleLabel?.font = .appleSDGothicNeo(size: 14)
        
        self.selectedItem = .myMate
        
        HomeViewController().mymateFollowerSwitch()
    }
    private func highlightAll() {
        UIView.animate(withDuration: 1.0) {
            self.indicatorLayer!.frame = .init(x: 148,
                                              y: self.frame.height-0.5,
                                              width: 44,
                                              height: 2)
        }
        
        self.myLogButton.setTitleColor(.lightGray, for: .normal)
        self.myLogButton.titleLabel?.font = .appleSDGothicNeo(size: 14)
        
        self.myMateButton.setTitleColor(.lightGray, for: .normal)
        self.myMateButton.titleLabel?.font = .appleSDGothicNeo(size: 14)
        
        self.allButton.setTitleColor(.black, for: .normal)
        self.allButton.titleLabel?.font = .appleSDGothicNeo(size: 14, family: .Bold)
        
        self.selectedItem = .all
    }
    
    
    
    
    //MARK: - Selector
    @objc private func didClickTopTabBar(_ button: UIButton) {
        switch button.tag {
        case 0: self.highlightmyLog()
        case 1: self.highlightmyMate()
        case 2: self.highlightAll()
        default: break
        }
    }
    
    //MARK: - addSubView
    private func addSubView() {
        self.addSubview(self.myLogButton)
        self.addSubview(self.myMateButton)
        self.addSubview(self.allButton)
    }
    
    //MARK: - Layout
    private func layout() {
        self.myLogButton.snp.makeConstraints {
            $0.top.bottom.equalTo(self)
            $0.leading.equalToSuperview().offset(10)
            $0.width.equalTo(44)
        }
        self.myMateButton.snp.makeConstraints {
            $0.top.bottom.equalTo(self)
            $0.leading.equalTo(self.myLogButton.snp.trailing).offset(20)
            $0.width.equalTo(64)
        }
        self.allButton.snp.makeConstraints {
            $0.top.bottom.equalTo(self)
            $0.leading.equalTo(self.myMateButton.snp.trailing).offset(10)
            $0.width.equalTo(44)
        }
    }
    
    //MARK: - AddTarget
    private func addTarget() {
        self.myLogButton.addTarget(self, action: #selector(self.didClickTopTabBar(_:)), for: .touchUpInside)
        self.myMateButton.addTarget(self, action: #selector(self.didClickTopTabBar(_:)), for: .touchUpInside)
        self.allButton.addTarget(self, action: #selector(self.didClickTopTabBar(_:)), for: .touchUpInside)
    }
}

