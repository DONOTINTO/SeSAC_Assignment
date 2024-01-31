//
//  BasicLabel.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 1/31/24.
//

import UIKit

class BasicLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.text = "temp"
        self.font = Consts.Font.small
        self.textColor = .white
        self.textAlignment = .left
        self.numberOfLines = 0
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
