//
//  ViewController.swift
//  SeSAC_Assignment_0105
//
//  Created by 이중엽 on 1/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nextVCButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
    }

    func designUI() {
        for idx in 0 ..< nextVCButtons.count {
            var title = ""
            
            if case 0 = idx {
               title = "집중 모드"
            } else if case 1 = idx {
                title = "설정"
            } else if case 2 = idx {
                title = "쇼핑"
            }
            
            view.backgroundColor = .black
            nextVCButtons[idx].setTitle(title, for: .normal)
            nextVCButtons[idx].layer.cornerRadius = 10
            nextVCButtons[idx].backgroundColor = .systemGreen
            nextVCButtons[idx].setTitleColor(.black, for: .normal)
            nextVCButtons[idx].titleLabel?.font = .boldSystemFont(ofSize: 14)
        }
    }

}

