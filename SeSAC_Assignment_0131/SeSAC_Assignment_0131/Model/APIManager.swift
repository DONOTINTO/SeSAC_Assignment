//
//  APIManager.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 1/31/24.
//

import UIKit
import Alamofire

class APIManager {
    static let shared = APIManager()
    
    private init() { }
    
    func callAPI<T: Decodable>(scheme: String, host: String, path: String, query: [URLQueryItem]?, headers: HTTPHeaders?, type: T.Type, completion: @escaping (T) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        
        urlComponents.queryItems = query
        
        guard let url = urlComponents.url else { return }
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: type.self) { response in
            switch response.result {
            case .success(let success):
                completion(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
