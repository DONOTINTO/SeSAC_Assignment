//
//  PageContentViewController.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/5/24.
//

import UIKit
import SnapKit

class PageContentViewController: UIViewController {

    let mainPosterImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureView()
    }
}

extension PageContentViewController: ViewProtocol {
    func configureHierarchy() {
        view.addSubview(mainPosterImageView)
    }
    
    func configureLayout() {
        mainPosterImageView.snp.makeConstraints {
            $0.edges.equalTo(self.view)
        }
    }
    
    func configureView() {
        self.view.backgroundColor = .clear
    }
}
