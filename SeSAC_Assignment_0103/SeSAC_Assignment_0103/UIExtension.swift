//
//  UIExtension.swift
//  SeSAC_Assignment_0103
//
//  Created by 이중엽 on 1/4/24.
//

import UIKit

extension UITextField {
    func designTexField(placeholder: String, keyboardType: UIKeyboardType = .numberPad) {
        self.textColor = .black
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 15
        self.placeholder = placeholder
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftViewMode = .always
        self.keyboardType = keyboardType
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [.foregroundColor: UIColor.darkGray])
    }
}

extension UILabel {
    func designLabel(message: String, fontType: FontType, fontSize: CGFloat, line: Int = 1, alignment: NSTextAlignment = .left, textColor: UIColor = .black) {
        self.text = message
        self.textColor = textColor
        self.font = fontType == .BOLD ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
        self.numberOfLines = line
        self.textAlignment = alignment
    }
}
