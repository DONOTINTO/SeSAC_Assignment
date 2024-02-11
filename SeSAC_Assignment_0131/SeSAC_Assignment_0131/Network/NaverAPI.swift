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
    
    //https://openapi.naver.com/v1/search/image?query=naver
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "openapi.naver.com"
    }
    
    var path: String {
        return "/v1/search/image"
    }
}
