//
//  TrendAPIModel.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/30/24.
//

import Foundation

struct TrendAPIModel: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let backdropPath: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case backdropPath = "backdrop_path"
    }
}
