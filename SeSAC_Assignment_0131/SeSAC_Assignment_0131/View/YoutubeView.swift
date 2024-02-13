//
//  YoutubeView.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/13/24.
//

import UIKit
import SnapKit
import WebKit

class YoutubeView: BaseView {
    
    let webView = WKWebView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func configureHierarchy() {
        self.addSubview(webView)
    }
    
    override func configureLayout() {
        webView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
