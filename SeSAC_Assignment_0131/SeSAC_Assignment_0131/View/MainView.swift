//
//  TryView.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/4/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    let mainPosterPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
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
        self.addSubview(mainPosterPageViewController.view)
        self.addSubview(mainCollectionView)
    }
    
    func configureLayout() {
        let ratio: Float = 4/7
        mainPosterPageViewController.view.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(mainPosterPageViewController.view.snp.width).multipliedBy(ratio)
        }
        
        mainCollectionView.snp.makeConstraints {
            $0.top.equalTo(mainPosterPageViewController.view.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    func configureView() {
        mainCollectionView.backgroundColor = .clear
    }
}
