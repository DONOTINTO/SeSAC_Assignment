//
//  ADTableViewCell.swift
//  SeSAC_Assignment_0109
//
//  Created by 이중엽 on 1/11/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    static let identifier = "ADTableViewCell"
    
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
    
    func setInfo(_ travel: Travel) {
        guard let title = travel.title else { return }
        
        messageLabel.text = title
    }
}

extension ADTableViewCell: ViewProtocol {
    func configureUI() {
        let red = CGFloat.random(in: 0 ... 1)
        let green = CGFloat.random(in: 0 ... 1)
        let blue = CGFloat.random(in: 0 ... 1)
        
        adLabel.setLabel(text: "AD", font: .Bold, fontSize: 15)
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 3
        adLabel.clipsToBounds = true
        
        messageLabel.setLabel(text: "", font: .Bold, fontSize: 20, line: 0)
        messageLabel.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 0.5)
        messageLabel.layer.cornerRadius = 10
        messageLabel.clipsToBounds = true
    }
}
