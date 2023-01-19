//
//  RecordingButton.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/17.
//

import Foundation
import UIKit
import Then
import SnapKit

final class RecordingButton: UIImageView {
    
    
    //MARK: - Properties

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.layout()
        self.addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Selector

    
    
    //MARK: - addSubView
    private func setupView() {
        
    }

    //MARK: - Layout
    private func layout() {

    }
    
    //MARK: - AddTarget
    private func addTarget() {

    }
}
