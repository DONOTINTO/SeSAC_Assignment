//
//  TrendCollectionCellView.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/30/24.
//

import UIKit
import SnapKit

class TrendCollectionCellView: UIView {
    
    let imageView = UIImageView()
    let titleLabel = BoldLabel()
    
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

extension TrendCollectionCellView: ViewProtocol {
    func configureHierarchy() {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
    }
    
    func configureLayout() {
        let multiple: Double = 3/4
        
        self.imageView.snp.makeConstraints {
            $0.horizontalEdges.top.equalTo(self)
            $0.width.equalTo(self)
            $0.height.equalTo(self.imageView.snp.width).multipliedBy(multiple)
        }
        
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.imageView.snp.bottom).offset(5)
            $0.horizontalEdges.bottom.equalTo(self)
        }
    }
    
    func configureView() {
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
    }
}
