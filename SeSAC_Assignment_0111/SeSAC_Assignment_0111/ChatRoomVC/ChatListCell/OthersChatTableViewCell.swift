//
//  OthersChatTableViewCell.swift
//  SeSAC_Assignment_0111
//
//  Created by 이중엽 on 1/13/24.
//

import UIKit

class OthersChatTableViewCell: UITableViewCell {
    static var identifier: String = "OthersChatTableViewCell"
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLayoutView: UIView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var chatData: Chat?
    
    override func awakeFromNib() {
        
        self.configureUI()
    }
    
    func configureUI() {
        self.backgroundColor = .black
        
        DispatchQueue.main.async {
            self.userImageView.contentMode = .scaleAspectFill
            self.userImageView.layer.cornerRadius = self.userImageView.frame.width / 2
            self.userImageView.backgroundColor = .systemBlue
            self.userImageView.layer.borderColor = UIColor.white.cgColor
            self.userImageView.layer.borderWidth = 0.1
        }
        
        nameLabel.font = .boldSystemFont(ofSize: 15)
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 1
        nameLabel.textAlignment = .left
        
        messageLayoutView.backgroundColor = .clear
        messageLayoutView.layer.borderColor = UIColor.white.cgColor
        messageLayoutView.layer.borderWidth = 1
        messageLayoutView.layer.cornerRadius = 10
        
        messageLabel.font = .systemFont(ofSize: 15)
        messageLabel.backgroundColor = .clear
        messageLabel.textColor = UIColor(white: 1, alpha: 0.8)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .left
        messageLabel.setContentCompressionResistancePriority(UILayoutPriority(751), for: .vertical)
        
        dateLabel.font = .systemFont(ofSize: 11)
        dateLabel.textColor = UIColor(white: 1, alpha: 0.8)
        dateLabel.numberOfLines = 1
        dateLabel.textAlignment = .right
    }
    
    func setData(_ data: Chat) {
        let image = UIImage(named: data.user.profileImage)
        self.userImageView.image = image
        
        self.nameLabel.text = data.user.rawValue
        self.messageLabel.text = data.message
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let newDate = dateFormatter.date(from: data.date) else { return }
        dateFormatter.dateFormat = "HH.mm"
        let newDateString = dateFormatter.string(from: newDate)
        self.dateLabel.text = newDateString
    }
}
