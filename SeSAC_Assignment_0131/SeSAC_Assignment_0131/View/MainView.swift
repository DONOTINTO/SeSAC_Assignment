//
//  TryView.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/4/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    let mainPosterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createPosterLayout())
    let mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: TVSeriesSections.create())
    
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

extension MainView: ViewProtocol {
    func configureHierarchy() {
        self.addSubview(mainPosterCollectionView)
        self.addSubview(mainCollectionView)
    }
    
    func configureLayout() {
        let ratio: Float = 4/7
        mainPosterCollectionView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(mainPosterCollectionView.snp.width).multipliedBy(ratio)
        }
        
        mainCollectionView.snp.makeConstraints {
            $0.top.equalTo(mainPosterCollectionView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    func configureView() {
        mainCollectionView.backgroundColor = .clear
    }
    
    static func createPosterLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
