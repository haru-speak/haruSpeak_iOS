//
//  PlaylistViewController.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/20.
//

import Foundation
import UIKit
import SnapKit
import Then


class PlaylistViewController: UIViewController{
    //MARK: - Properties
// NAVIGATION BAR
    let backButton = UIImageView().then{
        $0.image = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
    }
    let reportButton = UIImageView().then{
        $0.image = UIImage(named: "reportbutton")?.withRenderingMode(.alwaysOriginal)
    }
    let mainScrollView = UIScrollView()
    let totalView = UIView().then{
        $0.backgroundColor = .white
    }
// TOPVIEW
    let topView = UIView().then{
        $0.backgroundColor = .white
    }
    let profileImage = UIImageView().then{
        $0.backgroundColor = .lightGray
    }
    let nameLabel = UILabel().then{
        $0.text = "무유"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
    }
    let dateLabel = UILabel().then{
        $0.text = "01/10 22:00"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let playlistTitle = UILabel().then{
        $0.text = "Nothing beats \"About time\""
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 20)
        $0.numberOfLines = 1
    }
    let lyricsScrollView = UIScrollView()
    let lyricsView = UIView().then{
        $0.backgroundColor = .white
    }
    let lyricsLabel = UILabel().then{
        $0.text = "My room is tiny. \n When I say tiny… I mean, really tiny. \nMy room is tiny.\nWhen I say tiny… I mean, really tiny.\nMy room is tiny.\n When I say tiny… I mean, really tiny. \nMy room is tiny.\nWhen I say tiny… I mean, really tiny.\nMy room is tiny.\n When I say tiny… I mean, really tiny. \nMy room is tiny.\nWhen I say tiny… I mean, really tiny.\nMy room is tiny.\n When I say tiny… I mean, really tiny. \nMy room is tiny.\nWhen I say tiny… I mean, really tiny.\nMy room is tiny."
        $0.numberOfLines = 0
    }
    let playlistProgressbar = UIProgressView()
    let playtimeStart = UILabel().then{
        $0.text = "00:00"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let playtimeEnd = UILabel().then{
        $0.text = "00:19"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let commentImage = UIImageView().then{
        $0.image = UIImage(named: "chatblue")?.withRenderingMode(.alwaysOriginal)
    }
    let commentCount = UILabel().then{
        $0.text = "3"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let playButton = UIImageView().then{
        $0.image = UIImage(named: "play.blue")?.withRenderingMode(.alwaysOriginal)
    }
    let heartImage = UIImageView().then{
        $0.image = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
    }
    let heartCount = UILabel().then{
        $0.text = "28"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        $0.textColor = .lightGray
    }
    let sepView = UIView().then{
        $0.backgroundColor = .systemGray6
    }
//BOTTOMVIEW
    let bottomView = UIView().then{
        $0.backgroundColor = .white
    }
    let labelBottomview = UILabel().then{
        $0.text = "댓글"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 15)
    }
    lazy var commentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(CommentCell.self, forCellWithReuseIdentifier: CommentCell.identifier)
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    
    
    

//COMMENTSUMBMIT
    let bottomFixedView = UIView().then{
        $0.backgroundColor = .white
    }
    let commentSubmitView = UIView().then{
        $0.backgroundColor = .systemGray6
        $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let commentTextField = UITextField().then{
        $0.placeholder = "피드백을 남겨보세요!"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
        
    }
    let submitButton = UIImageView().then{
        $0.image = UIImage(named: "commentupload")?.withRenderingMode(.alwaysOriginal)
    }
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true;
        
        setupView()
        setupLayout()
        addTarget()
        setupCollectionView()
        
        self.navigationController?.navigationBar.isHidden = true;
        
    }
    //MARK: - Selector
    @objc private func didClickBack(_ button: UIButton) {
        dismiss(animated: true)
        print("didClickBack")
    }
    @objc func didClickPlay(sender: UITapGestureRecognizer) {
        self.playindex = (self.playindex >= self.playButtonArray.count-1) ? 0 : self.playindex+1
        self.playButton.image = UIImage(named:playButtonArray[playindex])
        if playindex == 0{
            print("clickPause")
        }else{
            print("clickPlay")
        }
        
        }
    @objc func didClickheart(sender: UITapGestureRecognizer) {
        self.heartindex = (self.heartindex >= self.heartButtonArray.count-1) ? 0 : self.heartindex+1
        self.heartImage.image = UIImage(named:heartButtonArray[heartindex])
        if self.heartindex == 0{
            print("clickUnlike")
        }else{
            print("clickLike")
        }
        }
    
    //MARK: - addSubView
    func setupView(){
        view.addSubview(self.backButton)
        view.addSubview(self.reportButton)
        view.addSubview(self.mainScrollView)
        self.mainScrollView.addSubview(totalView)
        self.totalView.addSubview(self.sepView)
        //TOPVIEW
        self.totalView.addSubview(self.topView)
        self.topView.addSubview(self.profileImage)
        self.topView.addSubview(self.nameLabel)
        self.topView.addSubview(self.dateLabel)
        self.topView.addSubview(self.playlistTitle)
        self.topView.addSubview(self.lyricsScrollView)
        self.lyricsScrollView.addSubview(self.lyricsView)
        self.lyricsView.addSubview(self.lyricsLabel)
        self.topView.addSubview(self.playlistProgressbar)
        self.topView.addSubview(self.playtimeStart)
        self.topView.addSubview(self.playtimeEnd)
        self.topView.addSubview(self.commentImage)
        self.topView.addSubview(self.commentCount)
        self.topView.addSubview(self.playButton)
        self.topView.addSubview(self.heartImage)
        self.topView.addSubview(self.heartCount)
        //BOTTOMVIEW
        self.totalView.addSubview(self.bottomView)
        self.bottomView.addSubview(self.labelBottomview)
        self.bottomView.addSubview(self.commentCollectionView)
        //COMMENTSUBMIT
        view.addSubview(self.bottomFixedView)
        self.bottomFixedView.addSubview(self.commentSubmitView)
        self.commentSubmitView.addSubview(self.commentTextField)
        self.commentSubmitView.addSubview(self.submitButton)
        
        
    }
    
    //MARK: - Layout
    func setupLayout(){
        self.backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(62.58)
            $0.leading.equalToSuperview().offset(25.33)
        }
        self.reportButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(61)
            $0.trailing.equalToSuperview().offset(-26.5)
        }
        self.mainScrollView.snp.makeConstraints{
            $0.top.equalTo(self.backButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.bottomFixedView.snp.top)
        }
        self.totalView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
        }
        self.topView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.size.height.equalTo(500)
        }
        self.sepView.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview()
            $0.size.height.equalTo(10)
        }
        self.bottomView.snp.makeConstraints{
            $0.top.equalTo(self.sepView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.size.height.equalTo(500)
            $0.bottom.equalToSuperview()
        }

        //TOPVIEW
        self.profileImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(9)
            $0.leading.equalToSuperview().offset(35)
            $0.size.width.height.equalTo(35)
        }
        self.nameLabel.snp.makeConstraints{
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(13)
            $0.top.equalToSuperview().offset(9)
        }
        self.dateLabel.snp.makeConstraints{
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(13)
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(5)
        }
        self.playlistTitle.snp.makeConstraints{
            $0.top.equalTo(self.profileImage.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(35)
        }
        self.lyricsScrollView.snp.makeConstraints{
            $0.top.equalTo(self.playlistTitle.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(35)
            $0.trailing.equalToSuperview().offset(-35)
            $0.bottom.equalToSuperview().offset(-124)
        }
        self.lyricsView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
            $0.size.height.equalTo(352)
        }
        self.lyricsLabel.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        self.playlistProgressbar.snp.makeConstraints{
            $0.top.equalTo(self.lyricsScrollView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
        }
        self.playtimeStart.snp.makeConstraints{
            $0.top.equalTo(self.playlistProgressbar.snp.bottom).offset(11)
            $0.leading.equalToSuperview().offset(29)
        }
        self.playtimeEnd.snp.makeConstraints{
            $0.top.equalTo(self.playlistProgressbar.snp.bottom).offset(11)
            $0.trailing.equalToSuperview().offset(-29)
        }
        self.commentImage.snp.makeConstraints{
            $0.top.equalTo(self.playtimeStart.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(29)
        }
        self.commentCount.snp.makeConstraints{
            $0.top.equalTo(self.commentImage.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(40)
        }
        self.playButton.snp.makeConstraints{
            $0.top.equalTo(self.playlistProgressbar.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        self.heartImage.snp.makeConstraints{
            $0.top.equalTo(self.playtimeEnd.snp.bottom).offset(14)
            $0.trailing.equalToSuperview().offset(-29)
        }
        self.heartCount.snp.makeConstraints{
            $0.top.equalTo(self.heartImage.snp.bottom).offset(2)
            $0.trailing.equalToSuperview().offset(-35)
        }
        //BOTTOMVIEW
        self.labelBottomview.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(34)
        }
        self.commentCollectionView.snp.makeConstraints{
            $0.top.equalTo(self.labelBottomview.snp.bottom).offset(0)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        //COMMENTSUBMIT
        self.bottomFixedView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.size.height.equalTo(106)
        }
        self.commentSubmitView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(7)
            $0.leading.equalToSuperview().offset(7)
            $0.trailing.equalToSuperview().offset(-7)
            $0.size.height.equalTo(40)
        }
        self.commentTextField.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
        }
        self.submitButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        
    }
    //MARK: - ButtonArray
        let playButtonArray = ["play.blue","pause.blue"]
        var playindex = 0
        let heartButtonArray = ["heart","heart.fill"]
        var heartindex = 0
    
    //MARK: - AddTarget
    func addTarget(){
        let backBtn = UITapGestureRecognizer(target: self, action: #selector(didClickBack))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(backBtn)
        let playBtn = UITapGestureRecognizer(target: self, action: #selector(didClickPlay))
        playButton.isUserInteractionEnabled = true
        playButton.addGestureRecognizer(playBtn)
        
        let heartBtn = UITapGestureRecognizer(target: self, action: #selector(didClickheart))
        heartImage.isUserInteractionEnabled = true
        heartImage.addGestureRecognizer(heartBtn)
        
    }
    
    //MARK: - SetupCollectionView
    func setupCollectionView(){
        self.commentCollectionView.delegate = self
        self.commentCollectionView.dataSource = self
    }
    
}



//CollectionVIew
extension PlaylistViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommentCell.identifier, for: indexPath) as! CommentCell


        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommentCell.identifier, for: indexPath) as! CommentCell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width , height: 70)
    }
   
    
}
