//
//  MainView.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 1/31/24.
//

import UIKit
import SnapKit

class MainView: BaseView {
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    let contentImageView = UIImageView()
    let titleLabel = TitleLabel()
    let rateLabel = HeadLabel()
    let episodeLabel = HeadLabel()
    let overviewLabel = BasicLabel()
    let actorListLabel = TitleLabel()
    let actorCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let recommendLabel = TitleLabel()
    let recommendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func configureHierarchy() {
        self.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        [contentImageView, titleLabel, rateLabel, episodeLabel, overviewLabel, actorListLabel, actorCollectionView, recommendLabel, recommendCollectionView].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureLayout() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width)
        }
        
        let ratio: Float = 4/7
        
        contentImageView.snp.makeConstraints {
            $0.horizontalEdges.top.equalTo(contentView)
            $0.height.equalTo(contentView.snp.width).multipliedBy(ratio)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentImageView.snp.bottom).offset(5)
            $0.leading.equalTo(contentView.snp.leading).inset(10)
            $0.trailing.lessThanOrEqualTo(contentView.snp.trailing).inset(10)
        }
        
        rateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
        }
        
        episodeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(rateLabel.snp.trailing).offset(10)
            $0.trailing.lessThanOrEqualTo(contentView.snp.trailing).inset(10)
        }
        
        overviewLabel.snp.makeConstraints {
            $0.top.equalTo(rateLabel.snp.bottom).offset(5)
            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(10)
        }
        
        actorListLabel.snp.makeConstraints {
            $0.top.equalTo(overviewLabel.snp.bottom).offset(10)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
        }
        
        actorCollectionView.snp.makeConstraints {
            $0.top.equalTo(actorListLabel.snp.bottom).offset(5)
            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges)
            $0.height.equalTo(self.contentView.snp.height).dividedBy(4)
        }
        
        recommendLabel.snp.makeConstraints {
            $0.top.equalTo(actorCollectionView.snp.bottom).offset(10)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
        }
        
        recommendCollectionView.snp.makeConstraints {
            $0.top.equalTo(recommendLabel.snp.bottom).offset(5)
            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges)
            $0.height.equalTo(self.contentView.snp.height).dividedBy(4)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    override func configureView() {
        actorCollectionView.backgroundColor = .clear
        recommendCollectionView.backgroundColor = .clear
        
        contentView.contentMode = .scaleAspectFill
        
        rateLabel.textColor = .systemGreen
        
        actorListLabel.text = "출연진"
        
        recommendLabel.text = "비슷한 출연진"
        
        setActorCollecionCellLayout()
        
        setRecommendCollecionCellLayout()
    }
    
    func setActorCollecionCellLayout() {
        DispatchQueue.main.async {
            let line: CGFloat = 15
            let inter: CGFloat = 0
            let leftRight: CGFloat = 10
            let topBottom: CGFloat = 0
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = line
            flowLayout.minimumInteritemSpacing = inter
            flowLayout.sectionInset = UIEdgeInsets(top: topBottom, left: leftRight, bottom: topBottom, right: leftRight)
            let width: CGFloat = (self.actorCollectionView.frame.height / 5) * 3
            flowLayout.itemSize = CGSize(width: width, height: self.actorCollectionView.frame.height)
            self.actorCollectionView.collectionViewLayout = flowLayout
        }
    }
    
    func setRecommendCollecionCellLayout() {
        DispatchQueue.main.async {
            let line: CGFloat = 10
            let inter: CGFloat = 10
            let leftRight: CGFloat = 10
            let column: CGFloat = 3
            let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = line
            flowLayout.minimumInteritemSpacing = inter
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: leftRight, bottom: 0, right: leftRight)
            
            let width: CGFloat = (self.recommendCollectionView.frame.width - (2 * leftRight) - ((column - 1) * inter)) / column
            
            flowLayout.itemSize = CGSize(width: width, height: width / 7 * 10)
            self.recommendCollectionView.collectionViewLayout = flowLayout
        }
    }

}
