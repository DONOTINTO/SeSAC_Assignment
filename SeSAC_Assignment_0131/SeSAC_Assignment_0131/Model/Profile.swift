//
//  Profile.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/9/24.
//

import UIKit

enum ProfileSections: Int, CaseIterable {
    case info
    case setting
    
    static var count: Int {
        return self.allCases.count
    }
    
    enum Info: Int, CaseIterable {
        case name
        case userName
        case introduction
        case link
        case gender
        
        static var count: Int {
            return self.allCases.count
        }
        
        var title: String {
            switch self {
            case .name:
                return "이름"
            case .userName:
                return "사용자 이름"
            case .introduction:
                return "소개"
            case .link:
                return "링크"
            case .gender:
                return "성별"
            }
        }
        
        var placeHolder: String {
            switch self {
            case .name:
                if UserDefaultsManager.shared.name != "" {
                    return UserDefaultsManager.shared.name
                }
                return "이름"
            case .userName:
                if UserDefaultsManager.shared.userName != "" {
                    return UserDefaultsManager.shared.userName
                }
                return "사용자 이름"
            case .introduction:
                if UserDefaultsManager.shared.introduction != "" {
                    return UserDefaultsManager.shared.introduction
                }
                return "소개"
            case .link:
                if UserDefaultsManager.shared.link != "" {
                    return UserDefaultsManager.shared.link
                }
                return "링크"
            case .gender:
                if UserDefaultsManager.shared.gender != "" {
                    return UserDefaultsManager.shared.gender
                }
                return "성별"
            }
        }
    }
    
    enum Setting: Int, CaseIterable {
        case professional
        case privacy
        
        static var count: Int {
            return self.allCases.count
        }
        
        var title: String {
            switch self {
            case .professional:
                return "프로페셔널 계정으로 전환"
            case .privacy:
                return "개인정보 설정"
            }
        }
    }
}
