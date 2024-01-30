//
//  BoldLabel.swift
//  SeSAC_Assignment_0130
//
//  Created by 이중엽 on 1/30/24.
//

import UIKit

class BoldLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.text = "test"
        self.textAlignment = .center
        self.textColor = .white
        self.font = .boldSystemFont(ofSize: 17)
        self.backgroundColor = .black.withAlphaComponent(0.3)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
