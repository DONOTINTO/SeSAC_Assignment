//
//  TVDetailsModel.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/1/24.
//

import UIKit

struct TVDetailsModel: Decodable {
    let backdropPath: String
    let name: String
    let numberOfEpisodes: Int
    let overview: String
    let voteAverage: Float
    
    enum CodingKeys: String, CodingKey {
        case name, overview
        case backdropPath = "backdrop_path"
        case numberOfEpisodes = "number_of_episodes"
        case voteAverage = "vote_average"
    }
}
