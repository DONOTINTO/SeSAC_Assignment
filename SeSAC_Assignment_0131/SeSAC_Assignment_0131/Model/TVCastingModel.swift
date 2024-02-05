//
//  TVCastingModel.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/1/24.
//

import Foundation

struct TVCastingModel: Decodable {
    let cast: [CastingList]
}

struct CastingList: Decodable {
    let name: String
    let profilePath: String?
    let totalEpisodeCount: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case profilePath = "profile_path"
        case totalEpisodeCount = "total_episode_count"
    }
}
