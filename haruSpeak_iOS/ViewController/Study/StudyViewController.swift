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

    lazy var studyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(TopViewCollectionViewCell.self, forCellWithReuseIdentifier: TopViewCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    private var previousOffset: CGFloat = 0
    private var currentPage: Int = 0
    
    //Bottom View
    let scrollView = UIScrollView().then{
        $0.backgroundColor = .mainColor
    }
    
    private let blueView = UIView().then{
        $0.backgroundColor = .mainColor
    }
    let bottomView = UIView().then{
        $0.backgroundColor = .white
    }
    let testView = MyStudyBottomView()

    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        
        setUpView()
        setupLayout()
        addTarget()
        setupCollectionView()
        
        self.navigationController?.navigationBar.isHidden = true;
    }
    
    //MARK: - SetupCollectionView
    func setupCollectionView(){
        
        self.studyCollectionView.delegate = self
        self.studyCollectionView.dataSource = self
        
        let collectionViewLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: self.view.bounds.width - 40, height: self.view.bounds.height - 80)
            layout.minimumLineSpacing = 20
            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            layout.scrollDirection = .horizontal
            return layout
        }()
        
        studyCollectionView.collectionViewLayout = collectionViewLayout
        
        studyCollectionView.decelerationRate = .fast
        studyCollectionView.isPagingEnabled = false
        
    }
    
    
    //MARK: - Selector
    
    @objc func didClickSearch(sender: UITapGestureRecognizer) {
        let VC = SearchStudyViewController()
        VC.modalPresentationStyle = .overFullScreen
        present(VC, animated: true)
        print("didClickSearch")
    }
    
    
    //MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.topView)
        topView.addSubview(self.searchView)
        topView.addSubview(self.addFileButton)
        topView.addSubview(self.chatButton)
        topView.addSubview(self.searchButton)
        topView.addSubview(self.tabbar)
        self.view.addSubview(self.scrollView)
        scrollView.addSubview(self.bottomView)
        bottomView.addSubview(self.blueView)
        bottomView.addSubview(self.studyCollectionView)
        bottomView.addSubview(self.testView)
        
    }
    
    //MARK: - Layout
    private func setupLayout(){
        self.topView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.size.height.equalTo(152)
        }
        self.searchView.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.top).offset(55)
            $0.leading.equalTo(self.topView.snp.leading).offset(16)
            $0.height.equalTo(24)
            $0.width.equalToSuperview().dividedBy(3)
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
            $0.top.equalTo(self.searchView.snp.bottom).offset(24)
            $0.width.equalToSuperview().dividedBy(2)
            $0.leading.equalTo(self.topView.snp.leading).offset(30)
        }
        self.scrollView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview().offset(0)
            $0.top.equalTo(self.topView.snp.bottom).offset(0)
        }
        self.bottomView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
        }
        self.blueView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.bottomView)
            $0.size.height.equalTo(35)
        }
        self.studyCollectionView.snp.makeConstraints{
            $0.top.equalTo(self.bottomView.snp.top).offset(0)
            $0.leading.equalTo(self.bottomView.snp.leading).offset(0)
            $0.trailing.equalTo(self.bottomView.snp.trailing).offset(-16)
            $0.size.height.equalTo(227)
        }
        self.testView.snp.makeConstraints{
            $0.size.height.equalTo(700)
            $0.bottom.equalToSuperview()
            $0.top.equalTo(self.studyCollectionView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }

        
    }
    
    
    //MARK: - AddTarget
    private func addTarget(){
        let SearchBtn = UITapGestureRecognizer(target: self, action: #selector(didClickSearch))
        searchButton.isUserInteractionEnabled = true
        searchButton.addGestureRecognizer(SearchBtn)
    }
    
    
    
}


//CollectionVIew
extension StudyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopViewCollectionViewCell.identifier, for: indexPath) as! TopViewCollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        스터디 상세설명페이지 제작 후 주석 해제
//        let VC = ClickRecordViewController()
//        VC.modalPresentationStyle = .overCurrentContext
//        present(VC, animated: false)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: collectionView.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
           let point = self.targetContentOffset(scrollView, withVelocity: velocity)
           targetContentOffset.pointee = point
           
           UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: velocity.x, options: .allowUserInteraction, animations: {
               self.studyCollectionView.setContentOffset(point, animated: true)
           }, completion: nil)
       }
       
       func targetContentOffset(_ scrollView: UIScrollView, withVelocity velocity: CGPoint) -> CGPoint {
           
           guard let flowLayout = studyCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
           
           if previousOffset > studyCollectionView.contentOffset.x && velocity.x < 0 {
               currentPage = currentPage - 1
           } else if previousOffset < studyCollectionView.contentOffset.x && velocity.x > 0 {
               currentPage = currentPage + 1
           }
           
           let additional = (flowLayout.itemSize.width + flowLayout.minimumLineSpacing) - flowLayout.headerReferenceSize.width
           
           let updatedOffset = (flowLayout.itemSize.width + flowLayout.minimumLineSpacing) * CGFloat(currentPage) - additional
           
           previousOffset = updatedOffset
           
           return CGPoint(x: updatedOffset, y: 0)
       }
    
    
   
}
