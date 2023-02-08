//
//  StudyRoomViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/05.
//

import Foundation
import UIKit
import SnapKit
import Then

class StudyRoomViewController: UIViewController{
    //MARK: - Properties
    let arrowLeft = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft.white")?.withRenderingMode(.alwaysOriginal)
    }
    let thumbnailImg = UIImageView().then{
        $0.backgroundColor = .mainColor
    }
    
    let studyName = UILabel().then{
        $0.text = "오픽 AL 목표로 달려봅시다!!!"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size:15)
        $0.textColor = .white
    }
    let menuImg = UIImageView().then{
        $0.image = UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal)
    }
    let assignmentLabel = UILabel().then{
        $0.text = "과제가 있어요 💪"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size:20)
        $0.textColor = .black
    }
    let submitButton = UIView().then{
        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .mainColor
    }
    let submitText = UILabel().then{
        $0.text = "과제 제출하기"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size:16)
        $0.textColor = .white
    }
    let plusImg = UIImageView().then{
        $0.image = UIImage(named: "plus")?.withRenderingMode(.alwaysOriginal)
    }
    
    var assignmentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(AssignmentCell.self, forCellWithReuseIdentifier: AssignmentCell.identifier)
        $0.backgroundColor = .systemGray6
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    private var previousOffset: CGFloat = 0
    private var currentPage: Int = 0
    
    var QuestionArray = [String]()
    var DeadlineArray = [String]()
    var OrderArray = [String]()
    
    var currentIndex: CGFloat = 0
    var isOneStepPaging = true
    let lineSpacing: CGFloat = 20
    let cellRatio: CGFloat = 0.7
    
    let memAssignmentText = UILabel().then{
        $0.text = "멤버들의 과제를 체크해보세요! 👀"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size:18)
    }
    let deadlineTagView1 = UIView().then{
        $0.roundCorners(cornerRadius: 11, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .lightGray
    }
    let deadlineTagText1 = UILabel().then{
        $0.text = "~12월 8일"
        $0.textColor = .white
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
       }
    let deadlineTagView2 = UIView().then{
        $0.roundCorners(cornerRadius: 11, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .koreanTag
    }
    let deadlineTagText2 = UILabel().then{
        $0.text = "~12월 10일"
        $0.textColor = .white
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
       }
    let deadlineTagView3 = UIView().then{
        $0.roundCorners(cornerRadius: 11, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .lightGray
    }
    let deadlineTagText3 = UILabel().then{
        $0.text = "~12월 16일"
        $0.textColor = .white
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size:13)
       }
    let memAssignment1 = MemberAssignmentCell()
    let memAssignment2 = MemberAssignmentCell().then{
        $0.time.text = "12/07"
    }
    let memAssignment3 = MemberAssignmentCell()
    func dataSourceSet(){
        QuestionArray.append(contentsOf: ["Explain the details about what you\nrecently did with your family.", "Explain the details about what you\nrecently did with your family.", "Explain the details about what you\nrecently did with your family."])
        DeadlineArray.append(contentsOf: ["~12월 10일", "~4월 11일", "~2월 15일"])
        OrderArray.append(contentsOf: ["오픽 질문입니다. 120초 동안 답변한거 올려주세요!", "오픽 질문입니다. 120초 동안 답변한거 올려주세요!", "오픽 질문입니다. 120초 동안 답변한거 올려주세요!"])

        DispatchQueue.main.async {
            self.assignmentCollectionView.reloadData()
            self.checkAssignmentCellCount()
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        setUpView()
        layout()
        addTarget()
        checkAssignmentCellCount()
        dataSourceSet()
        setupCollectionView()
        self.view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = true;
        
        let attributedStr = NSMutableAttributedString(string: assignmentLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.mainColor, range: (assignmentLabel.text! as NSString).range(of: "과제"))
        assignmentLabel.attributedText = attributedStr
        
        let attributedStr2 = NSMutableAttributedString(string: memAssignmentText.text!)
        attributedStr2.addAttribute(.foregroundColor, value: UIColor.mainColor, range: (memAssignmentText.text! as NSString).range(of: "체크"))
        memAssignmentText.attributedText = attributedStr2
        
        self.navigationController?.navigationBar.isHidden = true;
        }
    
    //MARK: - SetupCollectionView
    func setupCollectionView(){
        
        self.assignmentCollectionView.delegate = self
        self.assignmentCollectionView.dataSource = self
        
        let collectionViewLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: self.view.bounds.width - 40, height: self.view.bounds.height - 80)
            layout.minimumLineSpacing = 20
            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            layout.scrollDirection = .horizontal
            return layout
        }()
        
        assignmentCollectionView.collectionViewLayout = collectionViewLayout
        
        assignmentCollectionView.decelerationRate = .fast
        assignmentCollectionView.isPagingEnabled = false
        
    }
    
//MARK: - Check Cell isEmpty
    func checkAssignmentCellCount(){
        let countRecordCell = Int(QuestionArray.count)
        if countRecordCell == 0{
            print("none")
        }
    }
    
    //MARK: - AddSubview
    func setUpView(){
        self.view.addSubview(self.thumbnailImg)
        self.view.addSubview(self.arrowLeft)
        self.view.addSubview(self.studyName)
        self.view.addSubview(self.menuImg)
        self.view.addSubview(self.assignmentCollectionView)
        self.view.addSubview(self.assignmentLabel)
        self.view.addSubview(self.submitButton)
        self.submitButton.addSubview(self.submitText)
        self.submitButton.addSubview(self.plusImg)
        self.view.addSubview(self.memAssignmentText)
        self.view.addSubview(self.deadlineTagView1)
        self.deadlineTagView1.addSubview(self.deadlineTagText1)
        self.view.addSubview(self.deadlineTagView2)
        self.deadlineTagView2.addSubview(self.deadlineTagText2)
        self.view.addSubview(self.deadlineTagView3)
        self.deadlineTagView3.addSubview(self.deadlineTagText3)
        self.view.addSubview(self.memAssignment1)
        self.view.addSubview(self.memAssignment2)
        self.view.addSubview(self.memAssignment3)
    }
    
    //MARK: - Selector
    @objc func backTapped(){
        dismiss(animated: false)
    }
    
    //MARK: - Layout
    func layout(){
        self.thumbnailImg.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(94)
        }
        self.arrowLeft.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(57)
            $0.leading.equalTo(self.view.snp.leading).offset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        self.studyName.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(62)
            $0.leading.equalTo(self.arrowLeft.snp.trailing).offset(12)
        }
        self.menuImg.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(58)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        self.assignmentCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(156)
            $0.size.height.equalTo(245)
        }
        self.assignmentLabel.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(20)
            $0.top.equalTo(self.view.snp.top).offset(120)
        }
        self.submitButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.thumbnailImg.snp.bottom).offset(321)
            $0.width.equalTo(350)
            $0.height.equalTo(49)
        }
        self.submitText.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(17)
            $0.centerY.equalToSuperview()

        }
        self.plusImg.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-17.8)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(16)
            $0.height.equalTo(16)
        }
        self.memAssignmentText.snp.makeConstraints{
            $0.leading.equalTo(self.view.snp.leading).offset(20)
            $0.top.equalTo(self.submitButton.snp.bottom).offset(41)
        }
        self.deadlineTagView1.snp.makeConstraints{
            $0.top.equalTo(self.memAssignmentText.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(84)
            $0.height.equalTo(23)
        }
        self.deadlineTagText1.snp.makeConstraints{
            $0.centerY.equalTo(self.deadlineTagView1)
            $0.centerX.equalTo(self.deadlineTagView1)
        }
        self.deadlineTagView2.snp.makeConstraints{
            $0.top.equalTo(self.memAssignmentText.snp.bottom).offset(14)
            $0.leading.equalTo(self.deadlineTagView1.snp.trailing).offset(8)
            $0.width.equalTo(84)
            $0.height.equalTo(23)
        }
        self.deadlineTagText2.snp.makeConstraints{
            $0.centerY.equalTo(self.deadlineTagView2)
            $0.centerX.equalTo(self.deadlineTagView2)
        }
        self.deadlineTagView3.snp.makeConstraints{
            $0.top.equalTo(self.memAssignmentText.snp.bottom).offset(14)
            $0.leading.equalTo(self.deadlineTagView2.snp.trailing).offset(8)
            $0.width.equalTo(84)
            $0.height.equalTo(23)
        }
        self.deadlineTagText3.snp.makeConstraints{
            $0.centerY.equalTo(self.deadlineTagView3)
            $0.centerX.equalTo(self.deadlineTagView3)
        }
        self.memAssignment1.snp.makeConstraints{
            $0.top.equalTo(self.deadlineTagView1.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
//            $0.size.width.equalTo(350)
            $0.size.height.equalTo(81)
        }
        self.memAssignment2.snp.makeConstraints{
            $0.top.equalTo(self.memAssignment1.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview()
//            $0.size.width.equalTo(350)
            $0.size.height.equalTo(81)
        }
        self.memAssignment3.snp.makeConstraints{
            $0.top.equalTo(self.memAssignment2.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview()
//            $0.size.width.equalTo(350)
            $0.size.height.equalTo(81)
        }
    }
    
    //MARK: - Target
    func addTarget(){
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        arrowLeft.isUserInteractionEnabled = true
        arrowLeft.addGestureRecognizer(backBtn)
    }
}


//CollectionVIew
extension StudyRoomViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return QuestionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AssignmentCell.identifier, for: indexPath) as! AssignmentCell
        cell.question.text = QuestionArray[indexPath.row]
        cell.order.text = OrderArray[indexPath.row]
        cell.deadlineTagText.text = DeadlineArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        스터디 상세설명페이지 제작 후 주석 해제
        let VC = StudyDetailViewController()
        VC.modalPresentationStyle = .overCurrentContext
        present(VC, animated: false)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: collectionView.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
           let point = self.targetContentOffset(scrollView, withVelocity: velocity)
           targetContentOffset.pointee = point
           
           UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: velocity.x, options: .allowUserInteraction, animations: {
               self.assignmentCollectionView.setContentOffset(point, animated: true)
           }, completion: nil)
       }
       
       func targetContentOffset(_ scrollView: UIScrollView, withVelocity velocity: CGPoint) -> CGPoint {
           
           guard let flowLayout = assignmentCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
           
           if previousOffset > assignmentCollectionView.contentOffset.x && velocity.x < 0 {
               currentPage = currentPage - 1
           } else if previousOffset < assignmentCollectionView.contentOffset.x && velocity.x > 0 {
               currentPage = currentPage + 1
           }
           
           let additional = (flowLayout.itemSize.width + flowLayout.minimumLineSpacing) - flowLayout.headerReferenceSize.width
           
           let updatedOffset = (flowLayout.itemSize.width + flowLayout.minimumLineSpacing) * CGFloat(currentPage) - additional
           
           previousOffset = updatedOffset
           
           return CGPoint(x: updatedOffset, y: 0)
       }
    
    
   
}
