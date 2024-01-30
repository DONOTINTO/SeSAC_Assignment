//
//  ViewController.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/30/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .horizontal
        
        if let style = CollectionCellViewStyle(rawValue: indexPath.row) {
            
            flowLayout.itemSize = CGSize(width: style.width, height: style.height)
            
            switch style {
            case .trend, .popular: break
            case .topRated:
                flowLayout.minimumLineSpacing = 30
            }
            
            cell.collectionView.collectionViewLayout = flowLayout
            cell.setViewStyle(style: style)
        }
        
        cell.collectionView.dataSource = self
        cell.collectionView.delegate = self
        cell.collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "MainCollectionViewCell")
        cell.collectionView.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        
        let index = collectionView.tag
        if let style = CollectionCellViewStyle(rawValue: index) {
            cell.setViewStyle(style: style)
        }
        
        return cell
    }
}

extension ViewController: ViewProtocol {
    func configureHierarchy() {
        self.view.addSubview(mainView)
    }
    
    func configureLayout() {
        mainView.snp.makeConstraints {
            $0.edges.equalTo(self.view.snp.edges)
        }
    }
    
    func configureView() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
    }
}
