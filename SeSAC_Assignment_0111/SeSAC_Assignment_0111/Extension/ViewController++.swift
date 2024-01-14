//
//  ViewController++.swift
//  SeSAC_Assignment_0111
//
//  Created by 이중엽 on 1/14/24.
//

import UIKit

extension UIViewController {
    func setDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
