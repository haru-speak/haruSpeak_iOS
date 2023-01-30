//
//  CustonTabbar.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/30.
//

import UIKit
import Then
import SnapKit

enum topTabBarItem2 {
    case Follower
    case Following
}

protocol MyPageTabbarProtocol {
  func sendStringTab(data: String)
}

class CustomTabbarMyPage: UIView{
    
    //MARK: - Properties
    var selectedItem: topTabBarItem2 = .Follower
    var delegate : MyPageTabbarProtocol?
    
    let followerButton = UIButton(type: .system).then {
        $0.setTitle("팔로워", for: .normal)
        $0.setTitleColor(.mainColor, for: .normal)
        $0.titleLabel?.font = .appleSDGothicNeo(size: 18)
        $0.tag = 0
    }
    
    let followingButton = UIButton(type: .system).then {
        $0.setTitle("팔로잉", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont.appleSDGothicNeo(size: 18)
        $0.tag = 1
    }
    
    var lineLayer: CALayer?
    var indicatorLayer: CALayer?
    
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
                                  width: self.frame.width / 2,
                                  height: 2)
            }
        }
    }
    
    //MARK: - Method
    func highlightFollower() {
        UIView.animate(withDuration: 1.0) {
            self.indicatorLayer!.frame = .init(x: 0,
                                              y: self.frame.height-0.5,
                                              width: self.frame.width / 2,
                                              height: 2)
        }
        
        self.followerButton.setTitleColor(.mainColor, for: .normal)
        self.followerButton.titleLabel?.font = .appleSDGothicNeo(size: 18, family: .Bold)
        
        self.followingButton.setTitleColor(.lightGray, for: .normal)
        self.followingButton.titleLabel?.font = .appleSDGothicNeo(size: 18)
        
        self.selectedItem = .Follower
        
        delegate?.sendStringTab(data: "Follower")
        print("Follower (CELL)")
    }
    
    func highlightFollowing() {
        UIView.animate(withDuration: 1.0) {
            self.indicatorLayer!.frame = .init(x:self.frame.width / 2,
                                               y: self.frame.height-0.5,
                                               width: self.frame.width / 2,
                                               height: 2)
        }
        
        self.followerButton.setTitleColor(.lightGray, for: .normal)
        self.followerButton.titleLabel?.font = .appleSDGothicNeo(size: 18)
        
        self.followingButton.setTitleColor(.mainColor, for: .normal)
        self.followingButton.titleLabel?.font = .appleSDGothicNeo(size: 18, family: .Bold)
        
        self.selectedItem = .Following
   
        delegate?.sendStringTab(data: "Following")
        print("Following (CELL)")
        
    }


    
    //MARK: - Selector
    @objc private func didClickTopTabBar(_ button: UIButton) {
        switch button.tag {
        case 0: self.highlightFollower()
        case 1: self.highlightFollowing()
        default: break
        }
    }
    
    //MARK: - addSubView
    private func addSubView() {
        self.addSubview(self.followerButton)
        self.addSubview(self.followingButton)
    }
    
    //MARK: - Layout
    private func layout() {
        self.followerButton.snp.makeConstraints {
            $0.top.bottom.equalTo(self)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(2)
        }
        self.followingButton.snp.makeConstraints {
            $0.top.bottom.equalTo(self)
            $0.trailing.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(2)
        }
    }
    
    //MARK: - AddTarget
    private func addTarget() {
        self.followerButton.addTarget(self, action: #selector(self.didClickTopTabBar(_:)), for: .touchUpInside)
        self.followingButton.addTarget(self, action: #selector(self.didClickTopTabBar(_:)), for: .touchUpInside)
    }
}

