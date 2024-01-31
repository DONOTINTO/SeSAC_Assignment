//
//  BaseView.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 1/31/24.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configureHierarchy() { }
    
    func configureLayout() { }
    
    func configureView() { }
}
