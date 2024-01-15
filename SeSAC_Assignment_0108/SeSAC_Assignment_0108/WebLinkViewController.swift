//
//  WebLinkViewController.swift
//  SeSAC_Assignment_0108
//
//  Created by 이중엽 on 1/15/24.
//

import UIKit
import WebKit

class WebLinkViewController: UIViewController {
    
    var data: Magazine?
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let data else { return }
        guard let url = URL(string: data.link) else { return }
        
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
}
