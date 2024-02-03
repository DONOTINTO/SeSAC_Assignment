//
//  TMDBAPI.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/2/24.
//

import UIKit
import Alamofire

enum TMDBAPI: Int, CaseIterable {
    case details
    case casting
    case recommend
    
    static var id = "96102"
    
    static var count: Int {
        return TMDBAPI.allCases.count
    }
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .details:
            return "/3/tv/\(TMDBAPI.id)"
        case .casting:
            return "/3/tv/\(TMDBAPI.id)/aggregate_credits"
        case .recommend:
            return "/3/tv/\(TMDBAPI.id)/recommendations"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .details, .recommend:
            return [URLQueryItem(name: "language", value: "ko-KR")]
        case .casting:
            return []
        }
    }
    
    var header: HTTPHeaders {
        return [APIKey.shared.key: APIKey.shared.auth]
    }
}
