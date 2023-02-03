//
//  MessageCustomTabbar.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/02.
//

import UIKit
import Then
import SnapKit

enum messageTabBarItem {
    case chatting
    case studyGroup
}

final class MessageCustomTabbar: UIView {
    //MARK: - Properties
    private var selectedItem: messageTabBarItem = .chatting
    
    private let chattingButton = UIButton(type: .system).then {
        $0.setTitle("채팅", for: .normal)
        $0.setTitleColor(.mainColor, for: .normal)
        $0.titleLabel?.font = .appleSDGothicNeo(size: 18, family: .Bold)
        $0.tag = 0
    }
    
    private let studyGroupButton = UIButton(type: .system).then {
        $0.setTitle("스터디 그룹 메시지", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont.appleSDGothicNeo(size: 18, family: .Bold)
        $0.tag = 1
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
                $0.backgroundColor = UIColor.systemGray4.cgColor
                self.layer.addSublayer($0)
                self.lineLayer = $0
                $0.frame = CGRect(x: 0,
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
                $0.frame = CGRect(x: 0,
                                  y: self.frame.height-0.5,
                                  width: self.frame.width/2,
                                  height: 2)
            }
        }
    }
    
    //MARK: - Method
    private func highlightStudyGroup() {
        UIView.animate(withDuration: 1.0) {
            self.indicatorLayer!.frame = .init(x: self.frame.width/2,
                                              y: self.frame.height-0.5,
                                              width: self.frame.width/2,
                                              height: 2)
        }
        
        self.chattingButton.setTitleColor(.lightGray, for: .normal)
        self.chattingButton.titleLabel?.font = .appleSDGothicNeo(size: 18, family: .Bold)
        
        self.studyGroupButton.setTitleColor(.mainColor, for: .normal)
        self.studyGroupButton.titleLabel?.font = .appleSDGothicNeo(size: 18, family: .Bold)
        
        self.selectedItem = .chatting
    }
    
    private func highlightChatting() {
        UIView.animate(withDuration: 1.0) {
            self.indicatorLayer!.frame = .init(x: 0,
                                              y: self.frame.height-0.5,
                                              width: self.frame.width/2,
                                              height: 2)
        }
        
        self.chattingButton.setTitleColor(.mainColor, for: .normal)
        self.chattingButton.titleLabel?.font = .appleSDGothicNeo(size: 18, family: .Bold)
        
        self.studyGroupButton.setTitleColor(.lightGray, for: .normal)
        self.studyGroupButton.titleLabel?.font = .appleSDGothicNeo(size: 18, family: .Bold)
        
        self.selectedItem = .studyGroup
    }
    
    //MARK: - Selector
    @objc private func didClickTopTabBar(_ button: UIButton) {
        switch button.tag {
        case 0: self.highlightChatting()
        case 1: self.highlightStudyGroup()
        default: break
        }
    }
    
    //MARK: - addSubView
    private func addSubView() {
        self.addSubview(self.chattingButton)
        self.addSubview(self.studyGroupButton)
    }
    
    //MARK: - Layout
    private func layout() {
        self.chattingButton.snp.makeConstraints {
            $0.leading.top.bottom.equalTo(self)
            $0.trailing.equalTo(self.snp.centerX)
        }
        
        self.studyGroupButton.snp.makeConstraints {
            $0.trailing.top.bottom.equalTo(self)
            $0.leading.equalTo(self.snp.centerX)
        }
    }
    
    //MARK: - AddTarget
    private func addTarget() {
        self.chattingButton.addTarget(self, action: #selector(self.didClickTopTabBar(_:)), for: .touchUpInside)
        self.studyGroupButton.addTarget(self, action: #selector(self.didClickTopTabBar(_:)), for: .touchUpInside)
    }
}
