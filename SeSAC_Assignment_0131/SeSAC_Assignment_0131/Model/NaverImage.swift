//
//  NaverImage.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/10/24.
//

import UIKit

struct NaverImage: Decodable {
    let items: [NaverItem]?
}

struct NaverItem: Decodable {
    let link: String?
}
