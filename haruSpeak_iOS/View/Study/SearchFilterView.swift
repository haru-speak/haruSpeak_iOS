//
//  SearchFilterView.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/19.
//

import Foundation
import SnapKit
import UIKit
import Then

class SearchFilterView : UIView{
    //MARK: - Properties
    let filterLabel = UILabel().then{
        $0.text = "필터"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 12)
    }
    let arrowImg = UIImageView().then{
        $0.image = UIImage(named: "filterarrow")?.withRenderingMode(.alwaysOriginal)
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        roundCorners(cornerRadius: 13, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        backgroundColor = .systemGray6
        
        
        self.addSubView()
        self.layout()
        self.addTarget()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubView(){
        self.addSubview(self.filterLabel)
        self.addSubview(self.arrowImg)
        
        
    }
    private func layout(){
        self.filterLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalTo(self.arrowImg.snp.leading).offset(-5)
        }
        self.arrowImg.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10)
            $0.size.width.equalTo(10)
            $0.size.height.equalTo(6)
            
        }
        
    }
    private func addTarget(){
        
    }
    
}
