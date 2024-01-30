//
//  CollectionCellViewStyle.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/30/24.
//

import UIKit

enum CollectionCellViewStyle: Int {
    case trend
    case topRated
    case popular
    
    var height: CGFloat {
        switch self {
        case .trend:
            return 200
        case .topRated:
            return 400
        case .popular:
            return 200
        }
    }
    
    var width: CGFloat {
        switch self {
        case .trend, .popular:
            return UIScreen.main.bounds.width / 2
        case .topRated:
            return UIScreen.main.bounds.width
        }
    }
}
