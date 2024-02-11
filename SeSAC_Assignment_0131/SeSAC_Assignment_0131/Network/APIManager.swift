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
    
    func callAPI<T: Decodable>(type: T.Type, api: TMDBAPI , completion: @escaping (T?, Error?) -> Void) {
        
        var urlComponent = URLComponents(string: "\(api.endpoint)")
        urlComponent?.queryItems = api.params
        
        guard let url = urlComponent?.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(APIKey.shared.key, forHTTPHeaderField: APIKey.shared.auth)
        print(urlRequest.url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else { return }
                guard let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    print("통신 성공")
                }
                
                guard let data else { return }
                
                do {
                    let result = try JSONDecoder().decode(type.self, from: data)
                    completion(result, nil)
                } catch let error {
                    completion(nil, error)
                    print(type, error.localizedDescription)
                }
            }
        }.resume()
        
        // AF.request(api.endpoint, method: api.method, parameters: api.parameters, encoding: URLEncoding(destination: .queryString), headers: api.header).responseDecodable(of: type) { response in
        //     switch response.result {
        //     case .success(let success):
        //         completion(success)
        //     case .failure(let failure):
        //         print(type, failure.errorDescription)
        //     }
        // }
    }
    
    func callNaverAPI<T: Decodable>(type: T.Type, queryItem: String , api: NaverAPI , completion: @escaping (T?, Error?) -> Void) {
        
        var urlComponent = URLComponents()
        urlComponent.scheme = api.scheme
        urlComponent.host = api.host
        urlComponent.path = api.path
        
        urlComponent.queryItems = [URLQueryItem(name: "query", value: queryItem)]
        
        guard let url = urlComponent.url else { return }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.addValue(APIKey.shared.naverID, forHTTPHeaderField: "X-Naver-Client-Id")
        urlRequest.addValue(APIKey.shared.secret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else { return }
                guard let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    print("Naver 통신 성공")
                }
                
                guard let data else { return }
                
                do {
                    let result = try JSONDecoder().decode(type.self, from: data)
                    completion(result, nil)
                } catch let error {
                    completion(nil, error)
                    print(type, error.localizedDescription)
                }
            }
        }.resume()
    }
}
