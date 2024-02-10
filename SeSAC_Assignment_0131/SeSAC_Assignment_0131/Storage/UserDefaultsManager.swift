//
//  UserDefaults.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/9/24.
//

import UIKit

class UserDefaultsManager {
    static var shared = UserDefaultsManager()
    
    private init() { }
    
    let ud = UserDefaults.standard
    
    var image: String {
        get {
            return ud.string(forKey: "image") ?? ""
        }
        set {
            ud.setValue(newValue, forKey: "image")
        }
    }
    
    var name: String {
        get {
            return ud.string(forKey: "name") ?? ""
        }
        set {
            ud.setValue(newValue, forKey: "name")
        }
    }
    
    var userName: String {
        get {
            return ud.string(forKey: "userName") ?? ""
        }
        set {
            ud.setValue(newValue, forKey: "userName")
        }
    }
    
    var introduction: String {
        get {
            return ud.string(forKey: "introduction") ?? ""
        }
        set {
            ud.setValue(newValue, forKey: "introduction")
        }
    }
    
    var link: String {
        get {
            return ud.string(forKey: "link") ?? ""
        }
        set {
            ud.setValue(newValue, forKey: "link")
        }
    }
    
    var gender: String {
        get {
            return ud.string(forKey: "gender") ?? ""
        }
        set {
            ud.setValue(newValue, forKey: "gender")
        }
    }
}
