//
//  MyMateFriendCell.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/27.
//

import UIKit

final class MyMateFriendCell: UICollectionViewCell {
//MARK: - Properties
    static let identifier = "MyMateFriendCell"
    let borderView = UIView().then{
        $0.backgroundColor = .clear
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let profileImage = UIImageView().then{
        $0.backgroundColor = .systemGray6
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
    let profileName = UILabel().then{
        $0.text = "데이"
        $0.font = UIFont(name:"appleSDGothicNeo-Regular", size: 12)
        $0.textColor = .gray
        $0.textAlignment = .center
    }

    var clickProfile : Bool = false

    
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
//    @objc func didClickProfile(sender: UITapGestureRecognizer) {
//            print("didClickProfile")
//        }
    //MARK: - addSubView
    private func setupView(){
        self.addSubview(self.borderView)
        borderView.addSubview(self.profileImage)
        self.addSubview(self.profileName)
    }
    
    //MARK: - layout
    private func setupLayout(){
        self.borderView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(5)
            $0.height.width.equalTo(40)
        }
        self.profileImage.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(38)
        }
        self.profileName.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.profileImage.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
            
        }

    }
    
    //MARK: - AddTarget
    private func addTarget(){
//        let profileBtn = UITapGestureRecognizer(target: self, action: #selector(didClickProfile))
//        profileImage.isUserInteractionEnabled = true
//        profileImage.addGestureRecognizer(profileBtn)
        }
    }


