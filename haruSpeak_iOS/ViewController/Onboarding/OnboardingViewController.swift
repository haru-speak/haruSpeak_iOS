//
//  OnboardingViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/28.
//

import Foundation
import UIKit
import SnapKit
import Then

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
    lazy var onboardingImage = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
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
        
        self.onboardingImage.delegate = self
        self.onboardingImage.dataSource = self
        onboardingImage.decelerationRate = .fast
        onboardingImage.isPagingEnabled = false
        collectionViewLayout()
        
    }
    
//MARK: - CollectionView Layout
    func collectionViewLayout(){
        if let layout = onboardingImage.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        let collectionViewLayout: UICollectionViewFlowLayout = {
            let layout = MyPageCustomCollectionViewFlowLayout()
            layout.itemSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
            layout.minimumLineSpacing = 0
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.scrollDirection = .horizontal
            return layout
        }()
        onboardingImage.collectionViewLayout = collectionViewLayout
    }
    
    //MARK: - AddSubview
    func setUpView() {
//        self.view.addSubview(self.scroll)
        self.view.addSubview(self.page)
        self.view.addSubview(self.login)
        self.view.addSubview(self.start)
        self.view.addSubview(self.onboardingImage)
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
        self.onboardingImage.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
            $0.bottom.equalTo(self.start.snp.top).offset(-50)
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




// CollectionView
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as! OnboardingCell
            
        if indexPath.row == 0{
            imageCell.mainImage.image = UIImage(named: "onboarding1")?.withRenderingMode(.alwaysOriginal)
        }else if indexPath.row == 1{
            imageCell.mainImage.image = UIImage(named: "onboarding2")?.withRenderingMode(.alwaysOriginal)
        }else{
            imageCell.mainImage.image = UIImage(named: "onboarding3")?.withRenderingMode(.alwaysOriginal)
        }
        
        
            
            return imageCell
        
        }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    //section 사이의 공간을 제거
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.view.bounds.width , height: self.view.bounds.height-150)

        
    }
    
}
