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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView = MainView()
        
        configureHierarchy()
        configureLayout()
        configureView()
        
        fetch()
    }
    
    override func configureHierarchy() {
        super.configureHierarchy()
    }
    
    override func configureLayout() {
        super.configureLayout()
        
    }
    
    override func configureView() {
        super.configureView()
        
    }
    
    func fetch() {
        guard let view = self.mainView as? MainView else { return }
        
        let dispatchGroup = DispatchGroup()
        
        let queryItem = URLQueryItem(name: "language", value: "ko-KR")
        let header: HTTPHeaders = [APIKey.shared.auth: APIKey.shared.key]
        
        dispatchGroup.enter()
        APIManager.shared.callAPI(scheme: "https", host: "api.themoviedb.org", path: "/3/tv/96102", query: [queryItem], headers: header, type: TVDetailsModel.self) { data in
            
            let urlStr = Consts.Image.baseImagURL + data.backdropPath
            let url = URL(string: urlStr)
            
            view.contentImageView.kf.setImage(with: url)
            view.titleLabel.text = data.name
            view.rateLabel.text = "\(data.voteAverage)점"
            view.episodeLabel.text = "에피소드 \(data.numberOfEpisodes)개"
            view.overviewLabel.text = data.overview
            
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        APIManager.shared.callAPI(scheme: "https", host: "api.themoviedb.org", path: "/3/tv/96102/aggregate_credits", query: [], headers: header, type: TVCastingModel.self) { data in
            
            var max = 0
            
            data.cast.forEach {
                if $0.totalEpisodeCount > max { max = $0.totalEpisodeCount }
            }
            
            let mainCastingList = data.cast.filter { $0.totalEpisodeCount == max }
            
            
            
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        APIManager.shared.callAPI(scheme: "https", host: "api.themoviedb.org", path: "/3/tv/96102/recommendations", query: [queryItem], headers: header, type: TVRecommendModel.self) { data in
            
            dump(data.results)
            
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            print("끝")
        }
    }
}
