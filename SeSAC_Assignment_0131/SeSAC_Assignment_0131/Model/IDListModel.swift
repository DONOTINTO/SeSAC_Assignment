//
//  IDListModel.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/5/24.
//

import UIKit

struct IDListModel: Decodable {
    let results: [TVID]
}

struct TVID: Decodable {
    let id: Int
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
    }
}
