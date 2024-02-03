//
//  CollectionViewCellType.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/2/24.
//

import UIKit

enum TVSeriesCellType: Int, CaseIterable {
    case details
    case casting
    case recommend
    
    static var count: Int {
        return TVSeriesCellType.allCases.count
    }
}
