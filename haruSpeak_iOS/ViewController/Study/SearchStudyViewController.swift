//
//  SearchStudyViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/16.
//

import Foundation
import UIKit
import SnapKit
import Then

protocol ClickedDelegate{
    func sendClicked(clicked: Int)
}
class SearchStudyViewController: UIViewController{
    
    //MARK: - Properties
    
    let searchView = UISearchBar().then{
        $0.searchBarStyle = .minimal
    }
    var delegate: ClickedDelegate?
    //filter
    let filterView = UIScrollView().then{
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    let languageFilter = SearchFilterView().then{
        $0.filterLabel.text = "언어"
    }
    let levelFilter = SearchFilterView().then{
        $0.filterLabel.text = "레벨"
    }
    let certificateFilter = SearchFilterView().then{
        $0.filterLabel.text = "자격증"
    }
    let peopleFilter = SearchFilterView().then{
        $0.filterLabel.text = "모집 인원"
    }
    let weekFilter = SearchFilterView().then{
        $0.filterLabel.text = "주 회"
    }
    let onlineFilter = SearchFilterView().then{
        $0.filterLabel.text = "대면"
    }
    //tag
    let selectImg1 = UIImageView().then{
        $0.image = UIImage(named: "checkcircle.empty")?.withRenderingMode(.alwaysOriginal)
    }
    let recruitText = UILabel().then{
        $0.text = "모집 중"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size:13)
    }
    
    let selectImg2 = UIImageView().then{
        $0.image = UIImage(named: "checkcircle.empty")?.withRenderingMode(.alwaysOriginal)
    }
    let newText = UILabel().then{
        $0.text = "신규"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size:13)
    }
    let newTagView = UIView().then{
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .koreanTag
    }
    let newTagText = UILabel().then{
        $0.text = "New"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
    }
    
    let selectImg3 = UIImageView().then{
        $0.image = UIImage(named: "checkcircle.empty")?.withRenderingMode(.alwaysOriginal)
    }
    let existingText = UILabel().then{
        $0.text = "기존"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size:13)
    }
    let existingTagView = UIView().then{
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .mainColor
    }
    let existingTagText = UILabel().then{
        $0.text = "Since"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
        $0.textColor = .white
    }
    let line1 = UIView().then{
        $0.backgroundColor = .systemGray6
    }
    let line2 = UIView().then{
        $0.backgroundColor = .systemGray4
    }
    var searchCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
        $0.backgroundColor = .white
    }
    let VC1 = SearchModalViewController().then{
        $0.modalPresentationStyle = .overCurrentContext
    }
    let hiddenTxt = UILabel().then{
        $0.text = "필터 검색 결과가 없어요"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size:16)
        $0.isHidden = true
    }
    let hiddenTxt2 = UILabel().then{
        $0.text = "다시 검색해 보세요."
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:15)
        $0.textColor = .lightGray
        $0.isHidden = true
    }
    
    
    var collectionViewindex = 0
    //CollectionView
    var SearchCellRecruitArray = [Bool]()
    var SearchCellNewArray = [Bool]()
    var SearchCellMemArray = [String]()
    var SearchCellNameArray = [String]()
    var SearchCellContentArray = [String]()
    var SearchCellLikeArray = [Bool]()
    
    
    //    func dataSourceSet(){
    //        SearchCellRecruit.append(contentsOf: ["연", "채드", "나단", "무유", "데이"])
    //        SearchCellNew.append(contentsOf: ["mypage", "mypage", "mypage", "mypage", "mypage"])
    //        SearchCellMem.append(contentsOf: ["어제", "어제", "1월 2일", "12월 27일", "12월 13일"])
    //        SearchCellNameArray.append(contentsOf: ["오후 3시 52분", "오후 3시 52분", "오후 3시 52분", "오후 3시 52분", "오후 3시 52분"])
    //        SearchCellContentArray.append(contentsOf: ["과제 늦지않게 제출해주세요~!", "피드백 감사합니다! 다음주에 봬요 :)", "넵 초대 메시지 보내드릴게요!", "이번주에 참여 가능합니다~", "데이님이 스터디룸 초대장을 보냈습니다!"])
    //        SearchCellLike.append(contentsOf: ["3", "1", "1", "3", "2"])
    //
    //        DispatchQueue.main.async {
    //            self.searchCollectionView.reloadData()
    //            self.checkSearchCellCount()
    //        }
    //    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.searchCollectionView.delegate = self
        self.searchCollectionView.dataSource = self
        self.navigationController?.navigationBar.isHidden = true;
        setUpView()
        setupLayout()
        addTarget()
        checkSearchCellCount()
    }
    
    //MARK: - Check Cell isEmpty
        func checkSearchCellCount(){
            let countRecordCell = Int(SearchCellNameArray.count)
            if countRecordCell == 0{
                hiddenTxt.isHidden = false
                hiddenTxt2.isHidden = false
            }else{
                hiddenTxt.isHidden = true
                hiddenTxt2.isHidden = true
            }
        }
    
    
    
    func setUpView(){
        self.view.addSubview(self.searchView)
        self.view.addSubview(self.filterView)
        filterView.addSubview(self.languageFilter)
        filterView.addSubview(self.levelFilter)
        filterView.addSubview(self.certificateFilter)
        filterView.addSubview(self.peopleFilter)
        filterView.addSubview(self.weekFilter)
        filterView.addSubview(self.onlineFilter)
        self.view.addSubview(self.selectImg1)
        self.view.addSubview(self.recruitText)
        self.view.addSubview(self.selectImg2)
        self.view.addSubview(self.newText)
        self.view.addSubview(self.newTagView)
        self.view.addSubview(self.newTagText)
        self.view.addSubview(self.selectImg3)
        self.view.addSubview(self.existingText)
        self.view.addSubview(self.existingTagView)
        self.view.addSubview(self.existingTagText)
        self.view.addSubview(self.line1)
        self.view.addSubview(self.line2)
        self.view.addSubview(self.searchCollectionView)
        self.view.addSubview(self.hiddenTxt)
        self.view.addSubview(self.hiddenTxt2)
    }
    
    //MARK: - Selector
    
    @objc func langClicked(){
        print("0")
        self.delegate?.sendClicked(clicked: 0)
        present(VC1, animated: false)
    }
    @objc func levClicked(){
        print("1")
        self.delegate?.sendClicked(clicked: 1)
        present(VC1, animated: false)
    }
    @objc func testClicked(){
        print("2")
        self.delegate?.sendClicked(clicked: 2)
        present(VC1, animated: false)
    }
    @objc func memClicked(){
        print("3")
        self.delegate?.sendClicked(clicked: 3)
        present(VC1, animated: false)
    }
    @objc func cycleClicked(){
        print("4")
        self.delegate?.sendClicked(clicked: 4)
        present(VC1, animated: false)
    }
    @objc func offClicked(){
        print("5")
        self.delegate?.sendClicked(clicked: 5)
        present(VC1, animated: false)
    }
    
    func setupLayout(){
        self.searchView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(57)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
        self.filterView.snp.makeConstraints{
            $0.top.equalTo(self.searchView.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview()
            $0.size.height.equalTo(35)
        }
        self.languageFilter.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(63)
        }
        self.levelFilter.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.languageFilter.snp.trailing).offset(8)
            $0.width.equalTo(63)
        }
        self.certificateFilter.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.levelFilter.snp.trailing).offset(8)
            $0.width.equalTo(74)
        }
        self.peopleFilter.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.certificateFilter.snp.trailing).offset(8)
            $0.width.equalTo(85)
        }
        self.weekFilter.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.peopleFilter.snp.trailing).offset(8)
            $0.width.equalTo(66)
        }
        self.onlineFilter.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.weekFilter.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(63)
        }
        self.selectImg1.snp.makeConstraints{
            $0.top.equalTo(self.weekFilter.snp.bottom).offset(23)
            $0.width.height.equalTo(16)
            $0.leading.equalToSuperview().offset(20)
        }
        self.recruitText.snp.makeConstraints{
            $0.top.equalTo(self.weekFilter.snp.bottom).offset(25)
            $0.leading.equalTo(self.selectImg1.snp.trailing).offset(4)
        }
        
        self.selectImg2.snp.makeConstraints{
            $0.top.equalTo(self.weekFilter.snp.bottom).offset(23)
            $0.width.height.equalTo(16)
            $0.leading.equalTo(self.selectImg1.snp.trailing).offset(54)
        }
        self.newText.snp.makeConstraints{
            $0.top.equalTo(self.weekFilter.snp.bottom).offset(25)
            $0.leading.equalTo(self.selectImg2.snp.trailing).offset(4)
        }
        self.newTagView.snp.makeConstraints{
            $0.top.equalTo(self.weekFilter.snp.bottom).offset(20)
            $0.leading.equalTo(self.newText.snp.trailing).offset(3)
            $0.width.equalTo(46)
            $0.height.equalTo(22)
        }
        self.newTagText.snp.makeConstraints{
            $0.centerY.equalTo(self.newTagView)
            $0.centerX.equalTo(self.newTagView)
        }
        
        self.selectImg3.snp.makeConstraints{
            $0.top.equalTo(self.weekFilter.snp.bottom).offset(23)
            $0.width.height.equalTo(16)
            $0.leading.equalTo(self.selectImg1.snp.trailing).offset(159)
        }
        self.existingText.snp.makeConstraints{
            $0.top.equalTo(self.weekFilter.snp.bottom).offset(25)
            $0.leading.equalTo(self.selectImg3.snp.trailing).offset(4)
        }
        self.existingTagView.snp.makeConstraints{
            $0.top.equalTo(self.weekFilter.snp.bottom).offset(20)
            $0.leading.equalTo(self.existingText.snp.trailing).offset(3)
            $0.width.equalTo(50)
            $0.height.equalTo(22)
        }
        self.existingTagText.snp.makeConstraints{
            $0.centerY.equalTo(self.existingTagView)
            $0.centerX.equalTo(self.existingTagView)
        }
        self.line1.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.existingTagView.snp.bottom).offset(20)
            $0.height.equalTo(8)
        }
        self.line2.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.existingTagView.snp.bottom).offset(20)
            $0.height.equalTo(1)
        }
        self.searchCollectionView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(self.line1.snp.bottom).offset(0)
        }
        self.hiddenTxt.snp.makeConstraints{
            $0.top.equalTo(self.line1.snp.bottom).offset(246)
            $0.centerX.equalToSuperview()
        }
        self.hiddenTxt2.snp.makeConstraints{
            $0.top.equalTo(self.hiddenTxt.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    func addTarget(){
        let langBtn = UITapGestureRecognizer(target: self, action: #selector(langClicked))
        languageFilter.isUserInteractionEnabled = true
        languageFilter.addGestureRecognizer(langBtn)
        
        let levBtn = UITapGestureRecognizer(target: self, action: #selector(levClicked))
        levelFilter.isUserInteractionEnabled = true
        levelFilter.addGestureRecognizer(levBtn)
        
        let testBtn = UITapGestureRecognizer(target: self, action: #selector(testClicked))
        certificateFilter.isUserInteractionEnabled = true
        certificateFilter.addGestureRecognizer(testBtn)
        
        let memBtn = UITapGestureRecognizer(target: self, action: #selector(memClicked))
        peopleFilter.isUserInteractionEnabled = true
        peopleFilter.addGestureRecognizer(memBtn)
        
        let weekBtn = UITapGestureRecognizer(target: self, action: #selector(cycleClicked))
        weekFilter.isUserInteractionEnabled = true
        weekFilter.addGestureRecognizer(weekBtn)
        
        let offBtn = UITapGestureRecognizer(target: self, action: #selector(offClicked))
        onlineFilter.isUserInteractionEnabled = true
        onlineFilter.addGestureRecognizer(offBtn)
        
    }
}
    
    //CollectionVIew
extension SearchStudyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            //        return SearchCellNameArray.count
        return 5
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let Scell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: indexPath) as! SearchCell
            //        Ccell.name.text = self.ChattingCellNameArray[indexPath.row]
            //        Ccell.profileimg.image = UIImage(named: self.ChattingCellProfileImgArray[indexPath.row])?.withRenderingMode(.alwaysOriginal)
            //        Ccell.date.text = self.ChattingCellDateArray[indexPath.row]
            //        Ccell.time.text = self.ChattingCellTimeArray[indexPath.row]
            //        Ccell.content.text = self.ChattingCellContentArray[indexPath.row]
            //        Ccell.num.text = self.ChattingCellNumArray[indexPath.row]
        return Scell
    }
        
}
    
extension SearchStudyViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.view.frame.width , height: 129)
    }
        
}
