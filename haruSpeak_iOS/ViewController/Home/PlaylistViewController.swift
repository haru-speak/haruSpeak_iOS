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
        $0.image = UIImage(named: "backbutton")?.withRenderingMode(.alwaysOriginal)
    }
    let reportButton = UIImageView().then{
        $0.image = UIImage(named: "reportbutton")?.withRenderingMode(.alwaysOriginal)
    }
    let mainScrollView = UIScrollView()
// TOPVIEW
    let topView = UIView().then{
        $0.backgroundColor = .black
    }
    let profileImage = UIImageView().then{
        $0.backgroundColor = .lightGray
    }
    let nameLabel = UILabel().then{
        $0.text = "무유"
    }
    let dateLabel = UILabel().then{
        $0.text = "01/10 22:00"
    }
    let playlistTitle = UILabel().then{
        $0.text = "Nothing beats \"About time\""
    }
    let lyricsScrollView = UIScrollView()
    let lyricsView = UIView().then{
        $0.backgroundColor = .white
    }
    let lyricsLabel = UILabel().then{
        $0.text = "My room is tiny. \n When I say tiny… I mean, really tiny. \nMy room is tiny.\nWhen I say tiny… I mean, really tiny.\nMy room is tiny.\n When I say tiny… I mean, really tiny. \nMy room is tiny.\nWhen I say tiny… I mean, really tiny.\nMy room is tiny.\n When I say tiny… I mean, really tiny. \nMy room is tiny.\nWhen I say tiny… I mean, really tiny.\nMy room is tiny.\n When I say tiny… I mean, really tiny. \nMy room is tiny.\nWhen I say tiny… I mean, really tiny.\nMy room is tiny."
    }
    let playlistProgressbar = UIProgressView()
    let playtimeStart = UILabel().then{
        $0.text = "00:00"
    }
    let playtimeEnd = UILabel().then{
        $0.text = "00:19"
    }
    let commentImage = UIImageView().then{
        $0.image = UIImage(named: "chatblue")?.withRenderingMode(.alwaysOriginal)
    }
    let commentCount = UILabel().then{
        $0.text = "3"
    }
    let playButton = UIImageView().then{
        $0.image = UIImage(named: "playbutton")?.withRenderingMode(.alwaysOriginal)
    }
    let heartImage = UIImageView().then{
        $0.image = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
    }
    let heartCount = UILabel().then{
        $0.text = "3"
    }
    
//BOTTOMVIEW
    let bottomVIew = UIView().then{
        $0.backgroundColor = .yellow
    }

//COMMENTSUMBMIT
    let bottomFixedView = UIView().then{
        $0.backgroundColor = .white
    }
    let commentSubmitView = UIView().then{
        $0.backgroundColor = .lightGray
    }
    let commentTextField = UITextField().then{
        $0.placeholder = "피드백을 남겨보세요!"
    }
    let submitButton = UIImageView().then{
        $0.image = UIImage(named: "commentupload")?.withRenderingMode(.alwaysOriginal)
    }
    
    
    
    //MARK: - LifeCycle
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .systemGray6
            self.navigationController?.navigationBar.isHidden = true;
            
            setupView()
            setupLayout()
            addTarget()
            
        }
    //MARK: - Selector
    
    
    //MARK: - addSubView
    func setupView(){
        view.addSubview(self.backButton)
        view.addSubview(self.reportButton)
        view.addSubview(self.mainScrollView)
        self.mainScrollView.addSubview(self.topView)
        //TOPVIEW
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
        self.mainScrollView.addSubview(self.bottomVIew)
        //COMMENTSUBMIT
        view.addSubview(self.bottomFixedView)
        self.bottomFixedView.addSubview(self.commentSubmitView)
        self.commentSubmitView.addSubview(self.commentTextField)
        self.commentSubmitView.addSubview(self.commentSubmitView)
        
        
    }
    
    //MARK: - Layout
    func setupLayout(){
        
    }
    
    //MARK: - AddTarget
    func addTarget(){
        
    }
    
    
}
