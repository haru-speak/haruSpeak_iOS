//
//  StudyCustomTabbar.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/13.
//

import UIKit
import Then
import SnapKit

enum studyTabBarItem {
    case myStudy
    case search
}

final class StudyCustomTabbar: UIView {
    //MARK: - Properties
    private var selectedItem: studyTabBarItem = .myStudy
    
    private let myStudyButton = UIButton(type: .system).then {
        $0.setTitle("내 스터디", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .appleSDGothicNeo(size: 14, family: .Bold)
        $0.tag = 0
    }
    
    private let searchButton = UIButton(type: .system).then {
        $0.setTitle("둘러보기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.appleSDGothicNeo(size: 14)
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
                $0.backgroundColor = UIColor.black.cgColor
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
                $0.backgroundColor = UIColor.black.cgColor
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
    private func highlightMyStudy() {
        UIView.animate(withDuration: 1.0) {
            self.indicatorLayer!.frame = .init(x: self.frame.width/2,
                                              y: self.frame.height-0.5,
                                              width: self.frame.width/2,
                                              height: 2)
        }
        
        self.myStudyButton.setTitleColor(.black, for: .normal)
        self.myStudyButton.titleLabel?.font = .appleSDGothicNeo(size: 14, family: .Bold)
        
        self.searchButton.setTitleColor(.white, for: .normal)
        self.searchButton.titleLabel?.font = .appleSDGothicNeo(size: 14)
        
        self.selectedItem = .myStudy
    }
    
    private func highlightSearch() {
        UIView.animate(withDuration: 1.0) {
            self.indicatorLayer!.frame = .init(x: 0,
                                              y: self.frame.height-0.5,
                                              width: self.frame.width/2,
                                              height: 2)
        }
        
        self.myStudyButton.setTitleColor(.white, for: .normal)
        self.myStudyButton.titleLabel?.font = .appleSDGothicNeo(size: 14)
        
        self.searchButton.setTitleColor(.black, for: .normal)
        self.searchButton.titleLabel?.font = .appleSDGothicNeo(size: 14, family: .Bold)
        
        self.selectedItem = .search
    }
    
    //MARK: - Selector
    @objc private func didClickTopTabBar(_ button: UIButton) {
        switch button.tag {
        case 0: self.highlightMyStudy()
        case 1: self.highlightSearch()
        default: break
        }
    }
    
    //MARK: - addSubView
    private func addSubView() {
        self.addSubview(self.myStudyButton)
        self.addSubview(self.searchButton)
    }
    
    //MARK: - Layout
    private func layout() {
        self.myStudyButton.snp.makeConstraints {
            $0.leading.top.bottom.equalTo(self)
            $0.trailing.equalTo(self.snp.centerX)
        }
        
        self.searchButton.snp.makeConstraints {
            $0.trailing.top.bottom.equalTo(self)
            $0.leading.equalTo(self.snp.centerX)
        }
    }
    
    //MARK: - AddTarget
    private func addTarget() {
        self.myStudyButton.addTarget(self, action: #selector(self.didClickTopTabBar(_:)), for: .touchUpInside)
        self.searchButton.addTarget(self, action: #selector(self.didClickTopTabBar(_:)), for: .touchUpInside)
    }
}
