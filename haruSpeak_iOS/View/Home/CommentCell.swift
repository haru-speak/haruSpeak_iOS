//
//  CommentCell.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/24.
//


import UIKit

final class CommentCell: UICollectionViewCell {
//MARK: - Properties
    static let identifier = "RecordCell"
    
    let profileImageBottomview = UIImageView().then{
        $0.backgroundColor = .lightGray
    }
    let commentBottomview = UILabel().then{
        $0.text = "Nothing beats About time"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 16)
    }
    let dateBottomview = UILabel().then{
        $0.text = "01/10 13:41"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 13)
    }
    
    
    
    
    
    
//MARK: - ButtonArray
    let playButtonArray = ["play.blue","pause.blue"]
    var playindex = 0
    let heartButtonArray = ["heart","heart.fill"]
    var heartindex = 0
    
    
    
//MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupLayout()
        self.addTarget()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selector

    //MARK: - addSubView
    private func setupView(){

    }
    
    //MARK: - layout
    private func setupLayout(){

    }
    
    //MARK: - AddTarget
    private func addTarget(){
   
        }
    }

