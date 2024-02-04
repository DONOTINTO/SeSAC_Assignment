//
//  ViewController.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 1/31/24.
//

import UIKit
import SnapKit
import Alamofire
import Kingfisher

class MainViewController: BaseViewController {

    var castingList: [CastingList] = []
    var recommendList: [Recommend] = []
    
    override func loadView() {
        super.loadView()
        
        self.view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
        
        // fetch()
    }
    
    override func configureHierarchy() {
        super.configureHierarchy()
    }
    
    override func configureLayout() {
        super.configureLayout()
        
    }
    
    override func configureView() {
        super.configureView()
        
        let view = getMainView()
        
        view.actorCollectionView.delegate = self
        view.actorCollectionView.dataSource = self
        view.actorCollectionView.register(ActorCollectionViewCell.self, forCellWithReuseIdentifier: "ActorCollectionViewCell")
        
        view.recommendCollectionView.delegate = self
        view.recommendCollectionView.dataSource = self
        view.recommendCollectionView.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: "RecommendCollectionViewCell")
    }
    
    func getMainView() -> MainView {
        guard let view = self.view as? MainView else { return MainView() }
        
        return view
    }
    
    // func fetch() {
    //     let view = getMainView()
    //     
    //     let dispatchGroup = DispatchGroup()
    //     
    //     for idx in 0 ..< TMDBAPI.count {
    //         guard let api = TMDBAPI(rawValue: idx) else { return }
    //         
    //         switch api {
    //         case .details:
    //             dispatchGroup.enter()
    //             APIManager.shared.callAPI(scheme: api.scheme, host: api.host, path: api.path, query: api.parameters, headers: api.header, type: TVDetailsModel.self) { data in
    //                 
    //                 let urlStr = Consts.Image.baseImagURL + data.backdropPath
    //                 let url = URL(string: urlStr)
    //                 
    //                 view.contentImageView.kf.setImage(with: url)
    //                 view.titleLabel.text = data.name
    //                 view.rateLabel.text = "\(data.voteAverage)점"
    //                 view.episodeLabel.text = "에피소드 \(data.numberOfEpisodes)개"
    //                 view.overviewLabel.text = data.overview
    //                 
    //                 dispatchGroup.leave()
    //             }
    //         case .casting:
    //             dispatchGroup.enter()
    //             APIManager.shared.callAPI(scheme: api.scheme, host: api.host, path: api.path, query: api.parameters, headers: api.header, type: TVCastingModel.self) { data in
    //                 
    //                 var max = 0
    //                 
    //                 data.cast.forEach {
    //                     if $0.totalEpisodeCount > max { max = $0.totalEpisodeCount }
    //                 }
    //                 
    //                 let mainCastingList = data.cast.filter { $0.totalEpisodeCount == max }
    //                 
    //                 self.castingList = mainCastingList
    //                 
    //                 dispatchGroup.leave()
    //             }
    //         case .recommend:
    //             dispatchGroup.enter()
    //             APIManager.shared.callAPI(scheme: api.scheme, host: api.host, path: api.path, query: api.parameters, headers: api.header, type: TVRecommendModel.self) { data in
    //                 
    //                 self.recommendList = data.results
    //                 
    //                 dispatchGroup.leave()
    //             }
    //         }
    //     }
    //     
    //     dispatchGroup.notify(queue: .main) {
    //         self.getMainView().actorCollectionView.reloadData()
    //         self.getMainView().recommendCollectionView.reloadData()
    //     }
    // }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == getMainView().actorCollectionView {
            return castingList.count
        } else {
            return recommendList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == getMainView().actorCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActorCollectionViewCell", for: indexPath) as? ActorCollectionViewCell else { return UICollectionViewCell() }
            
            let urlStr = Consts.Image.baseImagURL + castingList[indexPath.item].profilePath
            if let url = URL(string: urlStr) {
                cell.posterImageView.kf.setImage(with: url)
                cell.nameLabel.text = castingList[indexPath.item].name
            }
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath) as? RecommendCollectionViewCell else { return UICollectionViewCell() }
            
            let urlStr = Consts.Image.baseImagURL + recommendList[indexPath.item].posterPath
            if let url = URL(string: urlStr) {
                cell.posterImageView.kf.setImage(with: url)
            }
            
            return cell
        }
    }
}
