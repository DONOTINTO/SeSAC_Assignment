//
//  ThirdDetailViewController.swift
//  SeSAC_Assignment_0109
//
//  Created by 이중엽 on 1/11/24.
//

import UIKit

class ThirdDetailViewController: UIViewController {
    
    static let identifier: String = "ThirdDetailViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
}

extension ThirdDetailViewController: ViewProtocol {
    func configureUI() { 
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
    }
}
