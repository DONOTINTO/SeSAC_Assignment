//
//  MainCollectionViewCell.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/30/24.
//

import UIKit
import SnapKit

class MainCollectionViewCell: UICollectionViewCell {
    
    var mainView: UIView = UIView()
    
    var result: Results = Results(backdropPath: "", title: "")
    var topRated: TopRated = TopRated(backdropPath: "", title: "")
    var popular: Popular = Popular(backdropPath: "", title: "")
    
    var viewStyle: CollectionCellViewStyle = .trend {
        didSet {
            configureHierarchy()
            configureLayout()
            configureView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        switch viewStyle {
        case .trend:
            (self.mainView as? TrendCollectionCellView)?.titleLabel.text = ""
            
        case .topRated:
            (self.mainView as? TopRatedCollectionCellView)?.titleLabel.text = ""
            
        case .popular:
            (self.mainView as? PopularCollectionCellView)?.titleLabel.text = ""
        }
    }
    
    func setViewStyle(style: CollectionCellViewStyle) {
        self.viewStyle = style
    }
}

extension MainCollectionViewCell: ViewProtocol {
    func configureHierarchy() {
        switch viewStyle {
        case .trend:
            mainView = TrendCollectionCellView()
        case .topRated:
            mainView = TopRatedCollectionCellView()
        case .popular:
            mainView = PopularCollectionCellView()
        }
        
        self.contentView.addSubview(mainView)
    }
    
    func configureLayout() {
        mainView.snp.makeConstraints {
            $0.edges.equalTo(self.contentView.snp.edges)
            $0.height.width.equalTo(self.contentView)
        }
    }
    
    func configureView() {
        self.contentView.backgroundColor = .black
    }
}
