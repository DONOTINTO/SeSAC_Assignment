//
//  PosterCollectionViewCell.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/6/24.
//

import UIKit
import SnapKit
import Kingfisher

class PosterCollectionViewCell: UICollectionViewCell {
    
    let posterImageView = UIImageView()
    let playButton = UIButton()
    var data: TVID?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(data: TVID) {
        self.data = data
        
        guard let path = data.backdropPath else {
            posterImageView.image = UIImage(systemName: "person.fill")
            return
        }
        
        let urlStr = Consts.Image.baseImagURL + path
        if let url = URL(string: urlStr) {
            posterImageView.kf.setImage(with: url)
        }
    }
}

extension PosterCollectionViewCell: ViewProtocol {
    func configureHierarchy() {
        self.contentView.addSubview(posterImageView)
        self.contentView.addSubview(playButton)
    }
    
    func configureLayout() {
        posterImageView.snp.makeConstraints {
            $0.edges.equalTo(self.contentView)
        }
        
        playButton.snp.makeConstraints {
            $0.horizontalEdges.equalTo(posterImageView).inset(10)
            $0.bottom.equalTo(posterImageView).inset(5)
            $0.height.equalTo(44)
        }
    }
    
    func configureView() {
        playButton.backgroundColor = .systemYellow
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.titleLabel?.font = .boldSystemFont(ofSize: 22)
        playButton.layer.cornerRadius = 10
    }
    
    
}
