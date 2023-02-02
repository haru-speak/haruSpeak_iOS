//
//  FourthViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/26.
//

import Foundation
import UIKit
import SnapKit
import Then

class FourthViewController: UIViewController{
    
//MARK: - Properties
    let backButton = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let progressBar = ProgressBarView()
    var pass = 0
    let titleLabel = UILabel().then{
        $0.text = "관심있는 주제를 선택해주세요"
        $0.textColor = .black
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 24)
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    let titleLabel2 = UILabel().then{
        $0.text = "선택한 주제를 바탕으로 스피킹 질문을 구성해드려요!\n주제를 3가지 이상 선택하고 관심있는 분야의\n스피킹 질문을 받아보세요 :)"
        $0.textColor = .lightGray
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
        $0.numberOfLines = 3
        $0.textAlignment = .center
    }
    let travel = UIButton().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let movie = UIButton().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let work = UIButton().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let shopping = UIButton().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let food = UIButton().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let relationship = UIButton().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let health = UIButton().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let neighborhood = UIButton().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let love = UIButton().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.roundCorners(cornerRadius: 5, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    
    let travelImg = UIImageView().then{
        $0.image = UIImage(named: "travel")?.withRenderingMode(.alwaysOriginal)
    }
    let movieImg = UIImageView().then{
        $0.image = UIImage(named: "movie")?.withRenderingMode(.alwaysOriginal)
    }
    let workImg = UIImageView().then{
        $0.image = UIImage(named: "work")?.withRenderingMode(.alwaysOriginal)
    }
    let shoppingImg = UIImageView().then{
        $0.image = UIImage(named: "shopping")?.withRenderingMode(.alwaysOriginal)
    }
    let foodImg = UIImageView().then{
        $0.image = UIImage(named: "food")?.withRenderingMode(.alwaysOriginal)
    }
    let relationshipImg = UIImageView().then{
        $0.image = UIImage(named: "relationship")?.withRenderingMode(.alwaysOriginal)
    }
    let healthImg = UIImageView().then{
        $0.image = UIImage(named: "health")?.withRenderingMode(.alwaysOriginal)
    }
    let neighborhoodImg = UIImageView().then{
        $0.image = UIImage(named: "neighborhood")?.withRenderingMode(.alwaysOriginal)
    }
    let loveImg = UIImageView().then{
        $0.image = UIImage(named: "love")?.withRenderingMode(.alwaysOriginal)
    }
    
    let travelTxt = UILabel().then{
        $0.text = "여행"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let movieTxt = UILabel().then{
        $0.text = "영화&음악"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let workTxt = UILabel().then{
        $0.text = "일&회사"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let shoppingTxt = UILabel().then{
        $0.text = "쇼핑"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let foodTxt = UILabel().then{
        $0.text = "음식"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let relationshipTxt = UILabel().then{
        $0.text = "가족&친구"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let healthTxt = UILabel().then{
        $0.text = "운동&건강"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let neighborhoodTxt = UILabel().then{
        $0.text = "동네"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    let loveTxt = UILabel().then{
        $0.text = "연애"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }

    
    
    
    let nextButton = UIButton().then{
        $0.setTitle("다음", for: .normal)
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
        let attributedStr = NSMutableAttributedString(string: titleLabel2.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.mainColor, range: (titleLabel2.text! as NSString).range(of: "3가지"))
        titleLabel2.attributedText = attributedStr
        self.progressBar.ratio = 4/5
    }
//MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.progressBar)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.titleLabel2)
        self.view.addSubview(self.nextButton)
        self.view.addSubview(self.travel)
        self.view.addSubview(self.movie)
        self.view.addSubview(self.work)
        self.view.addSubview(self.shopping)
        self.view.addSubview(self.food)
        self.view.addSubview(self.relationship)
        self.view.addSubview(self.health)
        self.view.addSubview(self.neighborhood)
        self.view.addSubview(self.love)
        
        self.travel.addSubview(self.travelImg)
        self.movie.addSubview(self.movieImg)
        self.work.addSubview(self.workImg)
        self.shopping.addSubview(self.shoppingImg)
        self.food.addSubview(self.foodImg)
        self.relationship.addSubview(self.relationshipImg)
        self.health.addSubview(self.healthImg)
        self.neighborhood.addSubview(self.neighborhoodImg)
        self.love.addSubview(self.loveImg)
        
        self.travel.addSubview(self.travelTxt)
        self.movie.addSubview(self.movieTxt)
        self.work.addSubview(self.workTxt)
        self.shopping.addSubview(self.shoppingTxt)
        self.food.addSubview(self.foodTxt)
        self.relationship.addSubview(self.relationshipTxt)
        self.health.addSubview(self.healthTxt)
        self.neighborhood.addSubview(self.neighborhoodTxt)
        self.love.addSubview(self.loveTxt)
    }

//MARK: - Selector
    @objc private func didClickNext(_ button: UIButton) {
        let VC = FifthViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
        print("didClickNext")
    }
    
    @objc private func didClickBack(_ button: UIButton) {
        dismiss(animated: false)
        print("didClickBack")
    }
    @objc private func didClickTravel(_ button: UIButton) {
        if self.travel.backgroundColor == .mainColor{
            pass -= 1
            self.travel.backgroundColor = .white
            self.travelTxt.textColor = .black
        }
        else{
            pass += 1
            self.travel.backgroundColor = .mainColor
            self.travelTxt.textColor = .white
        }
        nextPage()
    }
    @objc private func didClickMovie(_ button: UIButton) {
        if self.movie.backgroundColor == .mainColor{
            pass -= 1
            self.movie.backgroundColor = .white
            self.movieTxt.textColor = .black
        }
        else{
            pass += 1
            self.movie.backgroundColor = .mainColor
            self.movieTxt.textColor = .white
        }
        nextPage()

    }
    @objc private func didClickWork(_ button: UIButton) {
        if self.work.backgroundColor == .mainColor{
            pass -= 1
            self.work.backgroundColor = .white
            self.workTxt.textColor = .black
        }
        else{
            pass += 1
            self.work.backgroundColor = .mainColor
            self.workTxt.textColor = .white
        }
        nextPage()
        
    }
    @objc private func didClickShopping(_ button: UIButton) {
        if self.shopping.backgroundColor == .mainColor{
            pass -= 1
            self.shopping.backgroundColor = .white
            self.shoppingTxt.textColor = .black
        }
        else{
            pass += 1
            self.shopping.backgroundColor = .mainColor
            self.shoppingTxt.textColor = .white
        }
        nextPage()
        

    }
    @objc private func didClickFood(_ button: UIButton) {
        if self.food.backgroundColor == .mainColor{
            pass -= 1
            self.food.backgroundColor = .white
            self.foodTxt.textColor = .black
        }
        else{
            pass += 1
            self.food.backgroundColor = .mainColor
            self.foodTxt.textColor = .white
        }
        nextPage()
        

    }
    @objc private func didClickRelationship(_ button: UIButton) {
        if self.relationship.backgroundColor == .mainColor{
            pass -= 1
            self.relationship.backgroundColor = .white
            self.relationshipTxt.textColor = .black
        }
        else{
            pass += 1
            self.relationship.backgroundColor = .mainColor
            self.relationshipTxt.textColor = .white
        }
        nextPage()

    }
    @objc private func didClickHealth(_ button: UIButton) {
        if self.health.backgroundColor == .mainColor{
            pass -= 1
            self.health.backgroundColor = .white
            self.healthTxt.textColor = .black
        }
        else{
            pass += 1
            self.health.backgroundColor = .mainColor
            self.healthTxt.textColor = .white
        }
        nextPage()

    }
    @objc private func didClickNeighborhood(_ button: UIButton) {
        if self.neighborhood.backgroundColor == .mainColor{
            pass -= 1
            self.neighborhood.backgroundColor = .white
            self.neighborhoodTxt.textColor = .black
        }
        else{
            pass += 1
            self.neighborhood.backgroundColor = .mainColor
            self.neighborhoodTxt.textColor = .white
        }
        nextPage()

    }
    @objc private func didClickLove(_ button: UIButton) {
        if self.love.backgroundColor == .mainColor{
            pass -= 1
            self.love.backgroundColor = .white
            self.loveTxt.textColor = .black
        }
        else{
            pass += 1
            self.love.backgroundColor = .mainColor
            self.loveTxt.textColor = .white
        }
        nextPage()

    }
    
    func nextPage(){
        if pass >= 3{
            self.nextButton.backgroundColor = .mainColor
            self.nextButton.isEnabled = true
        }
        else{
            self.nextButton.backgroundColor = .systemGray6
            self.nextButton.isEnabled = false
        }
    }
    
    
//MARK: - Layout
    func layout(){
        self.backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.leading.equalToSuperview().offset(16)
        }
        self.progressBar.snp.makeConstraints{
            $0.top.equalToSuperview().offset(69)
            $0.leading.equalTo(self.backButton.snp.trailing).offset(21)
            $0.trailing.equalToSuperview().offset(-65)
            $0.height.equalTo(2)
        }
        self.titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(121)
            $0.leading.equalToSuperview().offset(53)
        }
        self.titleLabel2.snp.makeConstraints{
            $0.top.equalToSuperview().offset(162)
            $0.leading.equalToSuperview().offset(40)
        }
        self.nextButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
            $0.bottom.equalToSuperview().offset(-44)
            $0.height.equalTo(45)
        }
        self.travel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(286)
            $0.leading.equalToSuperview().offset(38)
            $0.width.equalTo(96)
            $0.height.equalTo(96)
        }
        self.movie.snp.makeConstraints{
            $0.top.equalToSuperview().offset(286)
            $0.leading.equalTo(self.travel.snp.trailing).offset(13.2)
            $0.width.equalTo(96)
            $0.height.equalTo(96)
        }
        self.work.snp.makeConstraints{
            $0.top.equalToSuperview().offset(286)
            $0.leading.equalTo(self.movie.snp.trailing).offset(13.2)
            $0.width.equalTo(96)
            $0.height.equalTo(96)
        }
        self.shopping.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(38)
            $0.top.equalTo(self.travel.snp.bottom).offset(13.2)
            $0.width.equalTo(96)
            $0.height.equalTo(96)
        }
        self.food.snp.makeConstraints{
            $0.leading.equalTo(self.shopping.snp.trailing).offset(13.2)
            $0.top.equalTo(self.movie.snp.bottom).offset(13.2)
            $0.width.equalTo(96)
            $0.height.equalTo(96)
        }
        self.relationship.snp.makeConstraints{
            $0.leading.equalTo(self.food.snp.trailing).offset(13.2)
            $0.top.equalTo(self.work.snp.bottom).offset(13.2)
            $0.width.equalTo(96)
            $0.height.equalTo(96)
        }
        self.health.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(38)
            $0.top.equalTo(self.shopping.snp.bottom).offset(13.2)
            $0.width.equalTo(96)
            $0.height.equalTo(96)
        }
        self.neighborhood.snp.makeConstraints{
            $0.leading.equalTo(self.health.snp.trailing).offset(13.2)
            $0.top.equalTo(self.food.snp.bottom).offset(13.2)
            $0.width.equalTo(96)
            $0.height.equalTo(96)
        }
        self.love.snp.makeConstraints{
            $0.leading.equalTo(self.neighborhood.snp.trailing).offset(13.2)
            $0.top.equalTo(self.relationship.snp.bottom).offset(13.2)
            $0.width.equalTo(96)
            $0.height.equalTo(96)
        }
        self.travelImg.snp.makeConstraints{
            $0.centerX.equalTo(self.travel)
            $0.top.equalTo(self.travel.snp.top).offset(16)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        self.movieImg.snp.makeConstraints{
            $0.centerX.equalTo(self.movie)
            $0.top.equalTo(self.movie.snp.top).offset(16)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        self.workImg.snp.makeConstraints{
            $0.centerX.equalTo(self.work)
            $0.top.equalTo(self.work.snp.top).offset(16)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        self.shoppingImg.snp.makeConstraints{
            $0.centerX.equalTo(self.shopping)
            $0.top.equalTo(self.shopping.snp.top).offset(16)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        self.foodImg.snp.makeConstraints{
            $0.centerX.equalTo(self.food)
            $0.top.equalTo(self.food.snp.top).offset(16)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        self.relationshipImg.snp.makeConstraints{
            $0.centerX.equalTo(self.relationship)
            $0.top.equalTo(self.relationship.snp.top).offset(16)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        self.healthImg.snp.makeConstraints{
            $0.centerX.equalTo(self.health)
            $0.top.equalTo(self.health.snp.top).offset(16)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        self.neighborhoodImg.snp.makeConstraints{
            $0.centerX.equalTo(self.neighborhood)
            $0.top.equalTo(self.neighborhood.snp.top).offset(16)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        self.loveImg.snp.makeConstraints{
            $0.centerX.equalTo(self.love)
            $0.top.equalTo(self.love.snp.top).offset(16)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        self.travelTxt.snp.makeConstraints{
            $0.centerX.equalTo(self.travel)
            $0.top.equalTo(self.travel.snp.top).offset(60)
        }
        self.movieTxt.snp.makeConstraints{
            $0.centerX.equalTo(self.movie)
            $0.top.equalTo(self.movie.snp.top).offset(60)
        }
        self.workTxt.snp.makeConstraints{
            $0.centerX.equalTo(self.work)
            $0.top.equalTo(self.work.snp.top).offset(60)
        }
        self.shoppingTxt.snp.makeConstraints{
            $0.centerX.equalTo(self.shopping)
            $0.top.equalTo(self.shopping.snp.top).offset(60)
        }
        self.foodTxt.snp.makeConstraints{
            $0.centerX.equalTo(self.food)
            $0.top.equalTo(self.food.snp.top).offset(60)
        }
        self.relationshipTxt.snp.makeConstraints{
            $0.centerX.equalTo(self.relationship)
            $0.top.equalTo(self.relationship.snp.top).offset(60)
        }
        self.healthTxt.snp.makeConstraints{
            $0.centerX.equalTo(self.health)
            $0.top.equalTo(self.health.snp.top).offset(60)
        }
        self.neighborhoodTxt.snp.makeConstraints{
            $0.centerX.equalTo(self.neighborhood)
            $0.top.equalTo(self.neighborhood.snp.top).offset(60)
        }
        self.loveTxt.snp.makeConstraints{
            $0.centerX.equalTo(self.love)
            $0.top.equalTo(self.love.snp.top).offset(60)
        }
        
    }
    
//MARK: - Target
    func addTarget(){
        self.travel.addTarget(self, action: #selector(self.didClickTravel(_:)), for: .touchUpInside)
        self.movie.addTarget(self, action: #selector(self.didClickMovie(_:)), for: .touchUpInside)
        self.work.addTarget(self, action: #selector(self.didClickWork(_:)), for: .touchUpInside)
        self.shopping.addTarget(self, action: #selector(self.didClickShopping(_:)), for: .touchUpInside)
        self.food.addTarget(self, action: #selector(self.didClickFood(_:)), for: .touchUpInside)
        self.relationship.addTarget(self, action: #selector(self.didClickRelationship(_:)), for: .touchUpInside)
        self.health.addTarget(self, action: #selector(self.didClickHealth(_:)), for: .touchUpInside)
        self.neighborhood.addTarget(self, action: #selector(self.didClickNeighborhood(_:)), for: .touchUpInside)
        self.love.addTarget(self, action: #selector(self.didClickLove(_:)), for: .touchUpInside)
        
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(didClickBack))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(backBtn)
        self.nextButton.addTarget(self, action: #selector(self.didClickNext(_:)), for: .touchUpInside)
        
    }
}

