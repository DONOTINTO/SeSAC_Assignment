//
//  APIManager.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/30/24.
//

import UIKit
import Alamofire

class APIManager {
    static let shared = APIManager()
    
    private init() { }
    
    enum TimeWindow: String {
        case day
        case week
    }
    
    func callTrendAPI(timeWindow: TimeWindow, completionHandler: @escaping ([Results]) -> Void) {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "api.themoviedb.org"
        urlComponent.path = "/3/trending/movie/\(timeWindow.rawValue)"
        
        let queryItem: URLQueryItem = URLQueryItem(name: "language", value: "ko-KR")
        urlComponent.queryItems = [queryItem]
        
        let header: HTTPHeaders = ["Authorization": APIKey.APIAuth]
        
        guard let url = urlComponent.url else { return }
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: TrendAPIModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success.results)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func callTopRatedAPI(completionHandler: @escaping ([TopRated]) -> Void) {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "api.themoviedb.org"
        urlComponent.path = "/3/movie/top_rated"
        
        let header: HTTPHeaders = ["Authorization": APIKey.APIAuth]
        
        let queryItem: URLQueryItem = URLQueryItem(name: "language", value: "ko-KR")
        urlComponent.queryItems = [queryItem]
        
        guard let url = urlComponent.url else { return }
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: TopRatedAPIModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success.results)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func callPopularAPI(completionHandler: @escaping ([Popular]) -> Void) {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "api.themoviedb.org"
        urlComponent.path = "/3/movie/popular"
        
        let header: HTTPHeaders = ["Authorization": APIKey.APIAuth]
        
        let queryItem: URLQueryItem = URLQueryItem(name: "language", value: "ko-KR")
        urlComponent.queryItems = [queryItem]
        
        guard let url = urlComponent.url else { return }
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: PopularAPIModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success.results)
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
}
