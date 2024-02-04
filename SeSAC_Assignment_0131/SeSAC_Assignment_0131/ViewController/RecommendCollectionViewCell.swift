//
//  RecommendCollectionViewCell.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/1/24.
//

import UIKit
import SnapKit
import Kingfisher

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
        super.prepareForReuse()
        
        posterImageView.image = nil
    }
    
    func setData(data: Recommend) {
        let urlStr = Consts.Image.baseImagURL + data.posterPath
        let url = URL(string: urlStr)
        posterImageView.kf.setImage(with: url)
    }
}

extension RecommendCollectionViewCell: ViewProtocol {
    func configureHierarchy() {
        self.contentView.addSubview(posterImageView)
    }
    
    func configureLayout() {
        self.posterImageView.snp.makeConstraints {
            $0.edges.equalTo(self.contentView)
        }
    }
    
    func configureView() {
        posterImageView.contentMode = .scaleAspectFill
    }
}
