//
//  Slider.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/02/02.
//

import Foundation
import UIKit
import SnapKit

// 1. touch 영역 정보 - begin/continue/end tracking
// 2. thumb뷰가 터치 되었는지 확인? 위 메소드에서 frame.contains로 확인
// 3. frame.contains로 특정 뷰가 터치 되었는지 확인할것이므로, 각 뷰들을 isUserInteractionEnabled = false 처리 (컨테이너로 있는 UIView만 터치 받도록 처리)
// 4. SnapKit에서 레이아웃 정의할때 .constraint로 Constraint 인스턴스를 가져와서 저장하고있고, continueTracking에서 실시간으로 Constraint의 inset을 변경

final class Slider: UIControl {
      // MARK: Constant
    private enum Constant {
    static let barRatio = 1.0/30.0
    }
      
      // MARK: UI
    private let lowerThumbButton: ThumbButton = {
        let button = ThumbButton()
        button.backgroundColor = .mainColor
        button.isUserInteractionEnabled = false
        return button
    }()
    private let upperThumbButton: ThumbButton = {
        let button = ThumbButton()
        button.backgroundColor = .mainColor
        button.isUserInteractionEnabled = false
        return button
    }()
    private let trackView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.isUserInteractionEnabled = false
        return view
      }()
    private let trackTintView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainColor
        view.isUserInteractionEnabled = false
        return view
    }()
      
      // MARK: Properties
    var minValue = 1.0 {
        didSet { self.lower = self.minValue }
    }
    var maxValue = 30.0 {
        didSet { self.upper = self.maxValue }
    }
    var lower = 1.0 {
        didSet { self.updateLayout(self.lower, true) }
    }
    var upper = 30.0 {
        didSet { self.updateLayout(self.upper, false) }
    }
    var lowerThumbColor = UIColor.white {
      didSet { self.lowerThumbButton.backgroundColor = self.lowerThumbColor }
    }
    var upperThumbColor = UIColor.white {
      didSet { self.upperThumbButton.backgroundColor = self.upperThumbColor }
    }
    var trackColor = UIColor.gray {
      didSet { self.trackView.backgroundColor = self.trackColor }
    }
    var trackTintColor = UIColor.gray {
      didSet { self.trackTintView.backgroundColor = self.trackTintColor }
    }
  
    private var previousTouchPoint = CGPoint.zero
    private var isLowerThumbViewTouched = false
    private var isUpperThumbViewTouched = false
    private var leftConstraint: Constraint?
    private var rightConstraint: Constraint?
    private var thumbViewLength: Double {
    Double(self.bounds.height)
    }
      
      // MARK: Init
    required init?(coder: NSCoder) {
        fatalError("xib is not implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.trackView)
        self.addSubview(self.trackTintView)
        self.addSubview(self.lowerThumbButton)
        self.addSubview(self.upperThumbButton)
            
        self.lowerThumbButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.lessThanOrEqualTo(self.upperThumbButton.snp.left)
            $0.left.greaterThanOrEqualToSuperview()
            $0.width.equalTo(self.snp.height)
            self.leftConstraint = $0.left.equalTo(self.snp.left).priority(999).constraint // .constraint로 값 가져오기 테크닉
        }
        self.upperThumbButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.greaterThanOrEqualTo(self.lowerThumbButton.snp.right)
            $0.right.lessThanOrEqualToSuperview()
            $0.width.equalTo(self.snp.height)
            self.rightConstraint = $0.left.equalTo(self.snp.left).priority(999).constraint
        }
        self.trackView.snp.makeConstraints {
            $0.left.right.centerY.equalToSuperview()
            $0.height.equalTo(self).multipliedBy(Constant.barRatio)
        }
        self.trackTintView.snp.makeConstraints {
            $0.left.equalTo(self.lowerThumbButton.snp.right)
            $0.right.equalTo(self.upperThumbButton.snp.left)
            $0.top.bottom.equalTo(self.trackView)
        }
    }
    
    // MARK: Touch
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        super.point(inside: point, with: event)
        return self.lowerThumbButton.frame.contains(point) || self.upperThumbButton.frame.contains(point)
      }
      
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        
        self.previousTouchPoint = touch.location(in: self)
        self.isLowerThumbViewTouched = self.lowerThumbButton.frame.contains(self.previousTouchPoint)
        self.isUpperThumbViewTouched = self.upperThumbButton.frame.contains(self.previousTouchPoint)
        
        if self.isLowerThumbViewTouched {
          self.lowerThumbButton.isSelected = true
        } else {
          self.upperThumbButton.isSelected = true
        }
        
        return self.isLowerThumbViewTouched || self.isUpperThumbViewTouched
      }
      
      override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
        
        let touchPoint = touch.location(in: self)
        defer {
          self.previousTouchPoint = touchPoint
          self.sendActions(for: .valueChanged)
        }
        
        let drag = Double(touchPoint.x - self.previousTouchPoint.x)
        let scale = self.maxValue - self.minValue
        let scaledDrag = scale * drag / Double(self.bounds.width - self.thumbViewLength)
        
        if self.isLowerThumbViewTouched {
          self.lower = (self.lower + scaledDrag)
            .clamped(to: (self.minValue...self.upper))
        } else {
          self.upper = (self.upper + scaledDrag)
            .clamped(to: (self.lower...self.maxValue))
        }
        return true
      }
      
      override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        self.sendActions(for: .valueChanged)
        
        self.lowerThumbButton.isSelected = false
        self.upperThumbButton.isSelected = false
      }
      
      // MARK: Method
      private func updateLayout(_ value: Double, _ isLowerThumb: Bool) {
        DispatchQueue.main.async {
          let startValue = value - self.minValue
            let length = 267.0 - self.thumbViewLength
          let offset = startValue * length / (self.maxValue - self.minValue)
          
          if isLowerThumb {
            self.leftConstraint?.update(offset: offset)
          } else {
            self.rightConstraint?.update(offset: offset)
          }
        }
      }
    }

    class RoundableButton: UIButton {
      override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
      }
    }

    class ThumbButton: RoundableButton {
      override var isSelected: Bool {
        didSet {
          self.backgroundColor = self.isSelected ? .systemGray3 : .mainColor
        }
      }
      
      override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .mainColor
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.systemGray3.withAlphaComponent(0.1).cgColor
      }
      required init?(coder: NSCoder) {
        fatalError()
      }
    }

    private extension Comparable {
      func clamped(to limits: ClosedRange<Self>) -> Self {
        min(max(self, limits.lowerBound), limits.upperBound)
      }
}
