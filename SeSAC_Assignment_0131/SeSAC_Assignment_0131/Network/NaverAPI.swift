//
//  NaverAPI.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/10/24.
//

import UIKit
import Alamofire

enum NaverAPI: Int {
    case image
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "openapi.naver.com"
    }
    
    var path: String {
        return "/v1/search/image"
    }
    
    var headerIDKey: String {
        return "kDC3BQHOOJCK_ppUILYT"
    }
    
    var headerSecretKey: String {
        return "QTWp7njZxC"
    }
}
