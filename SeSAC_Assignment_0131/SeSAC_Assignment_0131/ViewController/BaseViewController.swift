//
//  BaseViewController.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 1/31/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    var mainView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureHierarchy() {
        guard let mainView else { return }
        
        self.view.addSubview(mainView)
    }
    
    func configureLayout() {
        guard let mainView else { return }
        
        mainView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func configureView() {
        self.view.backgroundColor = .black
        self.mainView?.backgroundColor = .clear
    }

}
