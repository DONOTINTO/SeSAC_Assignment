//
//  TestViewController.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/2/24.
//

import UIKit

class TestViewController: BaseViewController {

    override func loadView() {
        self.view = TestView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    override func configureHierarchy() {
        
    }
    
    override func configureLayout() {
        
    }
    
    override func configureView() {
        let view = getMainView()
        
        view.homeCollectionView.dataSource = self
        view.homeCollectionView.delegate = self
    }
    
    func getMainView() -> TestView {
        if let view = self.view as? TestView {
            return view
        }
        return TestView()
    }
}

extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return TVSeriesCellType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
