//
//  ThirdADViewController.swift
//  SeSAC_Assignment_0109
//
//  Created by 이중엽 on 1/11/24.
//

import UIKit

class ThirdADViewController: UIViewController {
    
    static let identifier: String = "ThirdADViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
}

extension ThirdADViewController: ViewProtocol {
    func configureUI() { 
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
    }
}
