//
//  TopRatedAPIModel.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/31/24.
//

import Foundation

struct TopRatedAPIModel: Codable {
    let results: [TopRated]
}

struct TopRated: Codable {
    let backdropPath: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case title
    }
}
