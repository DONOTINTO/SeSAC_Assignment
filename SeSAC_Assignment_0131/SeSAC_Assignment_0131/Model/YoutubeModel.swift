//
//  YoutubeModel.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/13/24.
//

import Foundation

struct YoutubeModel: Decodable {
    let results: [YoutubeData]
}

struct YoutubeData: Decodable {
    let key: String
}
