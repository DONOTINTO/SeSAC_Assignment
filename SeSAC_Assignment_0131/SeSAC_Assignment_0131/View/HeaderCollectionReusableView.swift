//
//  HeaderCollectionReusableView.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/5/24.
//

import UIKit
import SnapKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    let titleLabel = TitleLabel()
    
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

extension HeaderCollectionReusableView: ViewProtocol {
    func configureHierarchy() {
        self.addSubview(titleLabel)
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints {
            $0.edges.equalTo(self).inset(10)
        }
    }
    
    func configureView() {
        titleLabel.text = "123"
    }
    
    
}
