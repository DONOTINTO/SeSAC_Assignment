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
    var idList: [TVID] = [] {
        didSet {
            configureHierarchy()
            configureLayout()
            configureView()
        }
    }
    
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
        APIManager.shared.callAPI(type: IDListModel.self, api: TMDBAPI.idList) { data, _ in
            guard let data else { return }
            self.idList = data.results
            
            if let firstID = self.idList.first {
                TMDBAPI.id = "\(firstID.id)"
            }
            
            self.fetchTVInfo()
        }
    }
    
    func fetchTVInfo() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        APIManager.shared.callAPI(type: TVDetailsModel.self, api: TMDBAPI.details) { data, _ in
            guard let data else {
                dispatchGroup.leave()
                return
            }
            self.details = data
            
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        APIManager.shared.callAPI(type: TVCastingModel.self, api: TMDBAPI.casting) { data, _ in
            guard let data else {
                dispatchGroup.leave()
                return
            }
            
            var max = 0
            
            data.cast.forEach {
                if $0.totalEpisodeCount > max { max = $0.totalEpisodeCount }
            }
            
            let mainCastingList = data.cast.filter { $0.totalEpisodeCount == max }
            
            self.casting = mainCastingList
            
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        APIManager.shared.callAPI(type: TVRecommendModel.self, api: TMDBAPI.recommend) { data, _ in
            guard let data else {
                dispatchGroup.leave()
                return
            }
            self.recommend = data.results
            
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.view().mainCollectionView.reloadData()
        }
    }
    
    func startVC() -> PageContentViewController {
        let vc = PageContentViewController()
        if let firstInfo = self.idList.first {
            let urlStr = Consts.Image.baseImagURL + firstInfo.backdropPath!
            let url = URL(string: urlStr)
            vc.mainPosterImageView.kf.setImage(with: url)
        }
        return vc
    }
}

extension MainViewController: ViewProtocol {
    func configureHierarchy() {
        let startVC = startVC()
        let viewControllers = NSArray(object: startVC)
        view().mainPosterPageViewController.delegate = self
        view().mainPosterPageViewController.dataSource = self
        view().mainPosterPageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true)
        self.addChild(view().mainPosterPageViewController)
        
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

extension MainViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return UIViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return UIViewController()
    }
    
    
}
