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

class SearchStudyViewController: UIViewController{
    
    //MARK: - Properties
    let searchView = UISearchBar()
    let filterView = UIView().then{
        $0.backgroundColor = .white
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
        $0.filterLabel.text = "인원 수"
    }
    let weekFilter = SearchFilterView().then{
        $0.filterLabel.text = "주 회"
    }
    let onlineFilter = SearchFilterView().then{
        $0.filterLabel.text = "대면"
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        
        setUpView()
        setupLayout()
        addTarget()
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
    }
    func setupLayout(){
        self.searchView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(57)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
        self.filterView.snp.makeConstraints{
            $0.top.equalTo(self.searchView.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.size.height.equalTo(31)
        }
        self.languageFilter.snp.makeConstraints{
            $0.top.leading.bottom.equalToSuperview()
        }
        self.levelFilter.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.languageFilter.snp.trailing).offset(5)
        }
        self.certificateFilter.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.levelFilter.snp.trailing).offset(5)
        }
        self.peopleFilter.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.certificateFilter.snp.trailing).offset(5)
        }
        self.weekFilter.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.peopleFilter.snp.trailing).offset(5)
        }
        self.onlineFilter.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.weekFilter.snp.trailing).offset(5)
        }
    }
    func addTarget(){

    }

}
