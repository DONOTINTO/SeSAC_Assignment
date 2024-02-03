//
//  TestView.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/2/24.
//

import UIKit
import SnapKit

class TestView: UIView {
    
    let homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension TestView: ViewProtocol {
    func configureHierarchy() {
        self.addSubview(homeCollectionView)
    }
    
    func configureLayout() {
        homeCollectionView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
    }
    
    func configureView() {
        self.backgroundColor = .clear
    }
}
