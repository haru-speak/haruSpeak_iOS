//
//  MyStudyBottomView.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/15.
//

import UIKit
import Then
import SnapKit

final class MyStudyBottomView: UIView{
    //MARK: - Properties
    

    
    let titleLabel = UILabel().then{
        $0.text = "승연님, 해야할 과제가 있어요!"
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 20)
        $0.numberOfLines = 2
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.layout()
        self.addTarget()
        
        
        let attributedStr = NSMutableAttributedString(string: titleLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.mainColor, range: (titleLabel.text! as NSString).range(of: "해야할 과제가"))
        titleLabel.attributedText = attributedStr
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Selector
    
    
    //MARK: - addSubView
    private func addSubView() {
        self.addSubview(self.titleLabel)
    }
    
    //MARK: - Layout
    private func layout() {
        self.titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalToSuperview().offset(30)
        }
    }
    
    
    //MARK: - AddTarget
    private func addTarget() {
        
    }
    
}
