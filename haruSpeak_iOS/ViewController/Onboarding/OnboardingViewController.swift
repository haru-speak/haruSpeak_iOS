//
//  OnboardingViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/28.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController{
    
    //MARK: - Properties
//    let scroll = UIScrollView()
    let page = UIPageControl().then{
        $0.currentPage = 0
        $0.numberOfPages = 3
        $0.pageIndicatorTintColor = .lightGray // 페이지를 암시하는 동그란 점의 색상
        $0.currentPageIndicatorTintColor = .mainColor // 현재 페이지를 암시하는 동그란 점 색상
    }
    let login = UILabel().then{
        $0.text = "이미 계정이 있으신가요? 바로 로그인"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 13)
        $0.textColor = .lightGray
    }
    let start = UIButton().then{
        $0.setTitle("시작하기", for: .normal)
        $0.backgroundColor = .mainColor
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size:16)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true;
        
        let attributedStr = NSMutableAttributedString(string: login.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.mainColor, range: (login.text! as NSString).range(of: "바로 로그인"))
        login.attributedText = attributedStr
        
        
    }
    
    //MARK: - AddSubview
    func setUpView() {
//        self.view.addSubview(self.scroll)
        self.view.addSubview(self.page)
        self.view.addSubview(self.login)
        self.view.addSubview(self.start)
    }
    
    //MARK: - Selector
    @objc private func didClickStart(_ button: UIButton) {
        let VC = FirstViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
        print("didClickStart")
    }
    
    @objc func loginButtonTapped(){
        let AuthenticationVC = AuthenticationViewController()
        AuthenticationVC.modalPresentationStyle = .fullScreen
        present(AuthenticationVC, animated: true)
    }
    
    //MARK: - Layout
    func layout(){
        self.page.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-168)
        }
        
        self.start.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
            $0.bottom.equalToSuperview().offset(-82)
            $0.height.equalTo(45)
        }
        
        self.login.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-51)
        }
    }
    
    //MARK: - AddTarget
    func addTarget(){
        self.start.addTarget(self, action: #selector(self.didClickStart(_:)), for: .touchUpInside)
        let loginBtn = UITapGestureRecognizer(target: self, action: #selector(loginButtonTapped))
        login.isUserInteractionEnabled = true
        login.addGestureRecognizer(loginBtn)
    }
}
