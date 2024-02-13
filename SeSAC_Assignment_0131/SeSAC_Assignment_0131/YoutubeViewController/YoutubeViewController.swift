//
//  YoutubeViewController.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/13/24.
//

import UIKit

class YoutubeViewController: UIViewController {

    override func loadView() {
        self.view = YoutubeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func configure(_ key: String) {
        
        let view = self.view as! YoutubeView
        
        let urlStr = "https://www.youtube.com/watch?v=\(key)"
        if let url = URL(string: urlStr) {
            let urlrequest = URLRequest(url: url)
            view.webView.load(urlrequest)
        }
    }
}
