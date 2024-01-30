//
//  MainTableViewCell.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/30/24.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var viewStyle: CollectionCellViewStyle = .trend {
        didSet {
            configureHierarchy()
            configureLayout()
            configureView()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setViewStyle(style: CollectionCellViewStyle) {
        self.viewStyle = style
    }
}

extension MainTableViewCell: ViewProtocol {
    func configureHierarchy() {
        self.contentView.addSubview(collectionView)
    }
    
    func configureLayout() {
        let height: CGFloat = viewStyle.height
        
        self.collectionView.snp.makeConstraints {
            $0.edges.equalTo(self.contentView.snp.edges)
            $0.height.greaterThanOrEqualTo(height)
        }
    }
    
    func configureView() {
        self.contentView.backgroundColor = .clear
    }
}
