//
//  ViewController.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/30/24.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    let mainView = MainView()
    var trendData: [Results] = []
    var topRatedData: [TopRated] = []
    var popularData: [Popular] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
        
        APIManager.shared.callTrendAPI(timeWindow: .day) { data in
            self.trendData = data
            self.mainView.tableView.reloadData()
        }
        
        APIManager.shared.callTopRatedAPI() { data in
            self.topRatedData = data
            self.mainView.tableView.reloadData()
        }
        
        APIManager.shared.callPopularAPI() { data in
            self.popularData = data
            self.mainView.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CollectionCellViewStyle.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
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
        cell.collectionView.reloadData()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var cellItemCount = 0
        let index = collectionView.tag
        guard let viewStyle = CollectionCellViewStyle(rawValue: index) else { return 0}
        
        switch viewStyle {
        case .trend:
            cellItemCount = trendData.count
        case .topRated:
            cellItemCount = topRatedData.count
        case .popular:
            cellItemCount = popularData.count
        }
        
        return cellItemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        
        let index = collectionView.tag
        
        if let style = CollectionCellViewStyle(rawValue: index) {
            cell.setViewStyle(style: style)
            var urlStr = "https://image.tmdb.org/t/p/w500"
            
            switch style {
            case .trend:
                urlStr += self.trendData[indexPath.item].backdropPath
                let url = URL(string: urlStr)
                
                (cell.mainView as? TrendCollectionCellView)?.imageView.kf.setImage(with: url)
                (cell.mainView as? TrendCollectionCellView)?.titleLabel.text = self.trendData[indexPath.item].title
                
            case .topRated:
                urlStr += self.topRatedData[indexPath.item].backdropPath
                let url = URL(string: urlStr)
                
                (cell.mainView as? TopRatedCollectionCellView)?.imageView.kf.setImage(with: url)
                (cell.mainView as? TopRatedCollectionCellView)?.titleLabel.text = self.topRatedData[indexPath.item].title
                
            case .popular:
                urlStr += self.popularData[indexPath.item].backdropPath
                let url = URL(string: urlStr)
                
                (cell.mainView as? PopularCollectionCellView)?.imageView.kf.setImage(with: url)
                (cell.mainView as? PopularCollectionCellView)?.titleLabel.text = self.popularData[indexPath.item].title
            }
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
