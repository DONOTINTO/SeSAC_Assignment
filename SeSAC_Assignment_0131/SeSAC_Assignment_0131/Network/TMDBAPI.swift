//
//  TMDBAPI.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/2/24.
//

import UIKit
import Alamofire

enum TMDBAPI: Int {
    case youtube
    case idList
    case details
    case casting
    case recommend
    
    static var id = "96102"
    
    var baseURL: String {
        return "https://api.themoviedb.org/3"
    }
    
    var endpoint: URL {
        switch self {
        case .youtube:
            return URL(string: baseURL + "/tv/\(TMDBAPI.id)/videos")!
        case .idList:
            return URL(string: baseURL + "/tv/airing_today")!
        case .details:
            return URL(string: baseURL + "/tv/\(TMDBAPI.id)")!
        case .casting:
            return URL(string: baseURL + "/tv/\(TMDBAPI.id)/aggregate_credits")!
        case .recommend:
            return URL(string: baseURL + "/tv/\(TMDBAPI.id)/recommendations")!
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    // Alamofire 전용
    var parameters: Parameters {
        switch self {
        case .idList:
            return ["language": "ko-KR", "page": "1"]
        case .youtube, .details, .recommend, .casting:
            return ["": ""]
        }
    }
    
    var params: [URLQueryItem] {
        switch self {
        case.idList:
            return [URLQueryItem(name: "language", value: "ko-KR"), URLQueryItem(name: "page", value: "1")]
        // case .details, .recommend:
        //     return [URLQueryItem(name: "language", value: "ko-KR")]
        case .youtube, .details, .recommend, .casting:
            return [URLQueryItem(name: "", value: "")]
        }
    }
    
    var header: HTTPHeaders {
        return [APIKey.shared.auth: APIKey.shared.key]
    }
}
