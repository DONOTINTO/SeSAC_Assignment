//
//  OwnTableViewCell.swift
//  SeSAC_Assignment_0111
//
//  Created by 이중엽 on 1/13/24.
//

import UIKit

class OwnTableViewCell: UITableViewCell {
    static var identifier: String = "OwnTableViewCell"
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var messageLayoutView: UIView!
    @IBOutlet var messageLabel: UILabel!
    
    var chatData: Chat?
    
    override func awakeFromNib() {
        configureUI()
    }
    
    func configureUI() {
        self.backgroundColor = .black
        
        messageLayoutView.backgroundColor = .clear
        messageLayoutView.layer.borderColor = UIColor.white.cgColor
        messageLayoutView.layer.borderWidth = 1
        messageLayoutView.layer.cornerRadius = 10
        
        messageLabel.font = .systemFont(ofSize: 15)
        messageLabel.backgroundColor = .clear
        messageLabel.textColor = UIColor(white: 1, alpha: 0.8)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .left
        
        dateLabel.font = .systemFont(ofSize: 11)
        dateLabel.textColor = UIColor(white: 1, alpha: 0.8)
        dateLabel.numberOfLines = 1
        dateLabel.textAlignment = .right
        dateLabel.setContentCompressionResistancePriority(UILayoutPriority(751), for: .horizontal)
    }
    
    func setData(_ data: Chat) {
        self.messageLabel.text = data.message
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let newDate = dateFormatter.date(from: data.date) else { return }
        dateFormatter.dateFormat = "HH.mm"
        let newDateString = dateFormatter.string(from: newDate)
        self.dateLabel.text = newDateString
    }
}
