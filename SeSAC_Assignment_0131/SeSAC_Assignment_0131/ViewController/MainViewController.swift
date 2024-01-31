//
//  ViewController.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 1/31/24.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView = MainView()
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    override func configureHierarchy() {
        super.configureHierarchy()
        print("MainViewController", #function)
    }
    
    override func configureLayout() {
        super.configureLayout()
        print("MainViewController", #function)
    }
    
    override func configureView() {
        super.configureView()
        print("MainViewController", #function)
    }
}
