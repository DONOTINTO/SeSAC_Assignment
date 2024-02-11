//
//  ProfileImageCollectionViewCell.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/11/24.
//

import UIKit
import SnapKit
import Kingfisher

class ProfileImageCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setImage(link: String) {
        let url = URL(string: link)
        imageView.kf.setImage(with: url)
    }
}

extension ProfileImageCollectionViewCell: ViewProtocol {
    func configureHierarchy() {
        self.contentView.addSubview(imageView)
    }
    
    func configureLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalTo(self.contentView)
        }
    }
    
    func configureView() {
        self.contentView.backgroundColor = .black
    }
}
