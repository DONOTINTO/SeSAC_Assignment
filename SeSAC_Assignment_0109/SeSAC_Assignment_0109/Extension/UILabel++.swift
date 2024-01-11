//
//  UILabel++.swift
//  SeSAC_Assignment_0109
//
//  Created by 이중엽 on 1/11/24.
//

import UIKit

enum FontStyle {
    case Bold
    case System
}

extension UILabel {
    func setLabel(text: String, textColor: UIColor = .black, font: FontStyle, fontSize: CGFloat, line: Int = 1, alignment: NSTextAlignment = .center) {
        self.text = text
        self.textColor = textColor
        self.textAlignment = alignment
        self.font = (font == .Bold ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize))
        self.numberOfLines = line
    }
}
