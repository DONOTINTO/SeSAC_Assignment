//
//  RecommendCollectionViewCell.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/1/24.
//

import UIKit
import SnapKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    let posterImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        posterImageView.image = nil
    }
    
}

extension RecommendCollectionViewCell: ViewProtocol {
    func configureHierarchy() {
        self.contentView.addSubview(posterImageView)
    }
    
    func configureLayout() {
        posterImageView.snp.makeConstraints {
            $0.edges.equalTo(self.contentView.snp.edges)
        }
    }
    
    func configureView() {
    }
}
