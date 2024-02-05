//
//  TryViewController.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/4/24.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    
    var details: TVDetailsModel = TVDetailsModel(backdropPath: "", name: "", numberOfEpisodes: 0, overview: "", voteAverage: 0)
    var casting: [CastingList] = []
    var recommend: [Recommend] = []

    override func loadView() {
        super.loadView()
        
        self.view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureView()
        
        fetch()
    }
    
    func view() -> MainView {
        guard let view = self.view as? MainView else { return MainView() }
        return view
    }
    
    func fetch() {
        let dispatchGroup = DispatchGroup()
        
        for idx in 0 ..< TMDBAPI.count {
            guard let api = TMDBAPI(rawValue: idx) else { return }
            
            switch api {
            case .details:
                dispatchGroup.enter()
                APIManager.shared.callAPI(type: TVDetailsModel.self, api: api) { data in
                    self.details = data
                    
                    dispatchGroup.leave()
                }
            case .casting:
                dispatchGroup.enter()
                APIManager.shared.callAPI(type: TVCastingModel.self, api: api) { data in
                    var max = 0
                    
                    data.cast.forEach {
                        if $0.totalEpisodeCount > max { max = $0.totalEpisodeCount }
                    }
                    
                    let mainCastingList = data.cast.filter { $0.totalEpisodeCount == max }
                    
                    self.casting = mainCastingList
                    
                    dispatchGroup.leave()
                }
            case .recommend:
                dispatchGroup.enter()
                APIManager.shared.callAPI(type: TVRecommendModel.self, api: api) { data in
                    self.recommend = data.results
                    
                    dispatchGroup.leave()
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            let urlStr = Consts.Image.baseImagURL + self.details.backdropPath
            let url = URL(string: urlStr)
            self.view().mainPosterImageView.kf.setImage(with: url)
            self.view().mainCollectionView.reloadData()
        }
    }
}

extension MainViewController: ViewProtocol {
    func configureHierarchy() {
        view().mainCollectionView.dataSource = self
        view().mainCollectionView.delegate = self
        view().mainCollectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: DetailsCollectionViewCell.identifier)
        view().mainCollectionView.register(ActorCollectionViewCell.self, forCellWithReuseIdentifier: ActorCollectionViewCell.identifier)
        view().mainCollectionView.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
        view().mainCollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }
    
    func configureLayout() {
        
    }
    
    func configureView() {
        self.view.backgroundColor = .clear
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return TVSeriesSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = TVSeriesSections(rawValue: section) else { return 0 }
        switch sectionType {
        case .details:
            return 1
        case .actors:
            return casting.count
        case .recommend:
            return recommend.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = TVSeriesSections(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionType {
        case .details:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionViewCell.identifier, for: indexPath) as? DetailsCollectionViewCell else { return UICollectionViewCell() }
            
            cell.setData(data: details)
            
            return cell
            
        case .actors:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCollectionViewCell.identifier, for: indexPath) as? ActorCollectionViewCell else { return UICollectionViewCell() }
            
            cell.setData(data: casting[indexPath.item])
            
            return cell
            
        case .recommend:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell else { return UICollectionViewCell() }
            
            cell.setData(data: recommend[indexPath.item])
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else { return UICollectionReusableView() }
            
            if let type = TVSeriesSections(rawValue: indexPath.section) {
                switch type {
                case .details: break
                case .actors:
                    header.titleLabel.text = "출연진"
                case .recommend:
                    header.titleLabel.text = "연관 추천 시리즈"
                }
            }
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
