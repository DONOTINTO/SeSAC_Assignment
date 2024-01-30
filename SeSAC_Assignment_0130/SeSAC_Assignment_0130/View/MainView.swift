//
//  MainView.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/30/24.
//

import UIKit
import SnapKit

class MainView: UIView, ViewProtocol {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        self.addSubview(tableView)
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.snp.edges)
        }
    }
    
    func configureView() {
        
    }
}
