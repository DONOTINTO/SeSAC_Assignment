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
        
        let red = CGFloat.random(in: 0 ... 1)
        let green = CGFloat.random(in: 0 ... 1)
        let blue = CGFloat.random(in: 0 ... 1)
        
        adLabel.text = "AD"
        adLabel.font = .boldSystemFont(ofSize: 15)
        adLabel.textColor = .black
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 3
        adLabel.clipsToBounds = true
        
        messageLabel.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 0.5)
        messageLabel.font = .boldSystemFont(ofSize: 20)
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.layer.cornerRadius = 10
        messageLabel.clipsToBounds = true
        
    }
    
    func setInfo(_ travel: Travel) {
        guard let title = travel.title else { return }
        
        messageLabel.text = title
    }
}
