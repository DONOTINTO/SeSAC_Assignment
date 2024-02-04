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
    
    func callAPI<T: Decodable>(type: T.Type, api: TMDBAPI , completion: @escaping (T) -> Void) {
        
        AF.request(api.endpoint, method: api.method, parameters: api.parameters, encoding: URLEncoding(destination: .queryString), headers: api.header).responseDecodable(of: type) { response in
            switch response.result {
            case .success(let success):
                completion(success)
            case .failure(let failure):
                print(type, failure.errorDescription)
            }
        }
    }
}
