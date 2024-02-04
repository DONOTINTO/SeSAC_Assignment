//
//  DetailsCollectionViewCell.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/5/24.
//

import UIKit
import SnapKit

class DetailsCollectionViewCell: UICollectionViewCell {
    
    let titleLabel = TitleLabel()
    let rateLabel = HeadLabel()
    let episodeLabel = HeadLabel()
    let overviewLabel = BasicLabel()
    
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
        
        titleLabel.text = ""
        rateLabel.text = ""
        episodeLabel.text = ""
        overviewLabel.text = ""
    }
    
    func setData(data: TVDetailsModel) {
        titleLabel.text = data.name
        rateLabel.text = "\(data.voteAverage)"
        episodeLabel.text = "에피소드 \(data.numberOfEpisodes)개"
        overviewLabel.text = data.overview
    }
}

extension DetailsCollectionViewCell: ViewProtocol {
    func configureHierarchy() {
        [titleLabel, rateLabel, episodeLabel, overviewLabel].forEach {
            self.contentView.addSubview($0)
        }
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.contentView)
            $0.horizontalEdges.equalTo(self.contentView)
        }
        
        rateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(self.contentView)
        }
        
        episodeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(rateLabel.snp.trailing).offset(10)
            $0.trailing.lessThanOrEqualTo(self.contentView).offset(-10)
        }
        
        overviewLabel.snp.makeConstraints {
            $0.top.equalTo(rateLabel.snp.bottom).offset(5)
            $0.horizontalEdges.equalTo(self.contentView)
            $0.bottom.equalTo(self.contentView)
        }
    }
    
    func configureView() {
        
    }
}
