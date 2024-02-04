//
//  ActorCollectionViewCell.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/1/24.
//

import UIKit
import SnapKit
import Kingfisher

class ActorCollectionViewCell: UICollectionViewCell {
    
    let posterImageView = UIImageView()
    let nameLabel = TitleLabel()
    
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
        nameLabel.text = ""
    }
    
    func setData(data: CastingList) {
        let urlStr = Consts.Image.baseImagURL + data.profilePath
        let url = URL(string: urlStr)
        posterImageView.kf.setImage(with: url)
        
        nameLabel.text = data.name
    }
}

extension ActorCollectionViewCell: ViewProtocol {
    func configureHierarchy() {
        self.contentView.addSubview(posterImageView)
        self.contentView.addSubview(nameLabel)
    }
    
    func configureLayout() {
        self.posterImageView.snp.makeConstraints {
            $0.horizontalEdges.top.equalTo(self.contentView)
        }
        
        self.nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.posterImageView.snp.bottom)
            $0.horizontalEdges.equalTo(self.contentView)
            $0.bottom.equalTo(self.contentView)
        }
    }
    
    func configureView() {
        posterImageView.contentMode = .scaleAspectFill
        nameLabel.adjustsFontSizeToFitWidth = true
    }
}
