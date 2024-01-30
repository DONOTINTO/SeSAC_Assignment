//
//  TopRatedCollectionCellView.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/30/24.
//

import UIKit
import SnapKit

class TopRatedCollectionCellView: UIView {

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

extension TopRatedCollectionCellView: ViewProtocol {
    func configureHierarchy() {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
    }
    
    func configureLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        
        titleLabel.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalTo(imageView)
            $0.height.equalTo(22)
        }
    }
    
    func configureView() {
        self.imageView.backgroundColor = .gray
        self.titleLabel.backgroundColor = .black.withAlphaComponent(0.3)
    }
}
