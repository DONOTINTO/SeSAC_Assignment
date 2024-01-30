//
//  CollectionCellViewStyle.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/30/24.
//

import UIKit

enum CollectionCellViewStyle: Int, CaseIterable {
    case trend
    case topRated
    case popular
    
    var height: CGFloat {
        switch self {
        case .trend:
            return 300
        case .topRated:
            return 500
        case .popular:
            return 300
        }
    }
    
    var width: CGFloat {
        switch self {
        case .trend:
            return UIScreen.main.bounds.width / 2
        case .topRated:
            return UIScreen.main.bounds.width
        case .popular:
            return UIScreen.main.bounds.width / 3
        }
    }
}
