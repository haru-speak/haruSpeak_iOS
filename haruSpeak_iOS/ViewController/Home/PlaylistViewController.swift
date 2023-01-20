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
        
    }
    
    //MARK: - Layout
    func setupLayout(){
        
    }
    
    //MARK: - AddTarget
    func addTarget(){
        
    }
    
    
}
