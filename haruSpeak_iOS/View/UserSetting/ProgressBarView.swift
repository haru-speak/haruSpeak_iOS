//
//  ProgressBarView.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/26.
//

import Foundation
import UIKit
import SnapKit

final class ProgressBarView: UIView {

    private let progressBarView: UIView = {
      let view = UIView()
      view.backgroundColor = .mainColor
      return view
    }()

    override init(frame: CGRect) {
      super.init(frame: frame)
      self.isUserInteractionEnabled = false
      self.backgroundColor = .systemGray6
      self.addSubview(self.progressBarView)
    }
    required init?(coder: NSCoder) {
      fatalError()
    }

    var ratio: CGFloat = 0.0 {
      didSet {
        self.isHidden = !self.ratio.isLess(than: 1.0)
        
        self.progressBarView.snp.remakeConstraints {
          $0.top.bottom.equalTo(self.safeAreaLayoutGuide)
          $0.width.equalToSuperview().multipliedBy(self.ratio)
        }
        
        UIView.animate(
          withDuration: 0.5,
          delay: 0,
          options: .curveEaseInOut, // In과 Out 부분을 천천히하라는 의미 (나머지인 중간 부분은 빠르게 진행)
          animations: self.layoutIfNeeded, // autolayout에 애니메이션을 적용시키고 싶은 경우 사용
          completion: nil
        )
      }
    }
    
}


