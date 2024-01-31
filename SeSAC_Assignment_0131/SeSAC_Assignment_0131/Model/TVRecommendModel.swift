//
//  TVRecommendModel.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/1/24.
//

import Foundation

struct TVRecommendModel: Decodable {
    let results: [Recommend]
}

struct Recommend: Decodable {
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
    }
}
