//
//  StudyViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/11.
//

import Foundation
import UIKit
import SnapKit
import Then
import XLPagerTabStrip


class StudyViewController: UIViewController{
    //MARK: - Properties
    private let topView = UIView().then{
        $0.backgroundColor = .mainColor
    }
    private let searchView = UIView().then{
        $0.backgroundColor = .white
    }
    private let addFileButton = UIImageView().then{
        $0.image = UIImage(named: "fileadd")?.withRenderingMode(.alwaysOriginal)
    }
    private let chatButton = UIImageView().then{
        $0.image = UIImage(named: "chat")?.withRenderingMode(.alwaysOriginal)
    }
    private let searchButton = UIImageView().then{
        $0.image = UIImage(named: "magnifier")?.withRenderingMode(.alwaysOriginal)
    }
    private let tabbar = StudyCustomTabbar()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUpView()
        setupLayout()
        addTarget()
    }
    
    //MARK: - Selector
    
    
    
    //MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.topView)
        topView.addSubview(self.searchView)
        topView.addSubview(self.addFileButton)
        topView.addSubview(self.chatButton)
        topView.addSubview(self.searchButton)
        topView.addSubview(self.tabbar)
        
    }
    
    //MARK: - Layout
    private func setupLayout(){
        self.topView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.size.height.equalTo(187)
        }
        self.searchView.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.top).offset(55)
            $0.leading.equalTo(self.topView.snp.leading).offset(16)
            $0.size.height.equalTo(14)
            $0.size.width.equalTo(110)
        }
        self.addFileButton.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.top).offset(55)
            $0.trailing.equalTo(self.chatButton.snp.leading).offset(-29)
        }
        self.chatButton.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.top).offset(55)
            $0.trailing.equalTo(self.searchButton.snp.leading).offset(-29)
        }
        self.searchButton.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.top).offset(55)
            $0.trailing.equalTo(self.topView.snp.trailing).offset(-20)
        }
        self.tabbar.snp.makeConstraints{
            $0.top.equalTo(self.searchView.snp.bottom).offset(16)
            $0.leading.equalTo(self.topView.snp.leading).offset(30)
            $0.trailing.equalTo(self.topView.snp.trailing).offset(30)
        }

        
    }
    
    
    //MARK: - AddTarget
    private func addTarget(){
        
    }
}
