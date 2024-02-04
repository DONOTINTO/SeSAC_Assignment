//
//  CollectionViewCellType.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/2/24.
//

import UIKit

enum TVSeriesSections: Int, CaseIterable {
    case details
    case actors
    case recommend
    
    static var count: Int {
        return TVSeriesSections.allCases.count
    }
    
    static func create() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, _ in
            let sectionType = TVSeriesSections(rawValue: section) ?? TVSeriesSections.details
            
            switch sectionType {
            case .details:
                return createDetailsSection()
            case .actors:
                return createActorSection()
            case .recommend:
                return createRecommendSection()
            }
        }
    }
    
    static func createDetailsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(300))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(300))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10)
        
        return section
    }
    
    static func createActorSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0 / 4.0),
            heightDimension: .fractionalWidth(1.0 / 4.0 / 3.0 * 5.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0 / 4.0 / 3.0 * 5.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        // section.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0)
        
        return section
    }
    
    static func createRecommendSection() -> NSCollectionLayoutSection {
        print(#function)
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0 / 3.0),
            heightDimension: .fractionalWidth(1.0 / 3.0 / 7.0 * 10.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),  
            heightDimension: .fractionalWidth(1.0 / 3.0 / 7.0 * 10.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        return section
    }
}
