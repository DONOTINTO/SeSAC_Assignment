//
//  TableViewCell++.swift
//  SeSAC_Assignment_0111
//
//  Created by 이중엽 on 1/13/24.
//

import UIKit

extension UITableViewCell {
    func configureChatRoomListUI(layoutView: UIView, imageViews: [UIImageView], roomName: UILabel, roomMessage: UILabel, date: UILabel) {
        
        self.backgroundColor = .clear
        layoutView.backgroundColor = .clear
        
        DispatchQueue.main.async {
            for idx in 0 ..< imageViews.count {
                let view = imageViews[idx]
                view.contentMode = .scaleAspectFill
                view.layer.cornerRadius = view.frame.width / 2
                view.backgroundColor = .systemBlue
                view.layer.borderColor = UIColor.white.cgColor
                view.layer.borderWidth = 0.1
            }
        }
        
        roomName.font = .boldSystemFont(ofSize: 15)
        roomName.textColor = .white
        roomName.numberOfLines = 1
        roomName.textAlignment = .left
        
        roomMessage.font = .systemFont(ofSize: 13)
        roomMessage.textColor = UIColor(white: 1, alpha: 0.8)
        roomMessage.numberOfLines = 1
        roomMessage.textAlignment = .left
        roomMessage.adjustsFontSizeToFitWidth = true
        
        date.font = .systemFont(ofSize: 11)
        date.textColor = UIColor(white: 1, alpha: 0.8)
        date.numberOfLines = 1
        date.textAlignment = .right
        date.setContentCompressionResistancePriority(UILayoutPriority(751), for: .horizontal)
    }
    
    func setChatRoomListData(chatroom: ChatRoom, imageViews: [UIImageView], roomName: UILabel, roomMessage: UILabel, date: UILabel) {
        let imageName = chatroom.chatroomImage
        let name = chatroom.chatroomName
        let message = chatroom.chatList.last?.message ?? ""
        let lastDate = chatroom.chatList.last?.date ?? ""
        
        for idx in 0 ..< imageViews.count {
            let image = UIImage(named: imageName[idx])
            imageViews[idx].image = image
        }
        
        roomName.text = name
        roomMessage.text = message
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let newDate = dateFormatter.date(from: lastDate) else { return }
        dateFormatter.dateFormat = "yy.MM.dd"
        let newDateString = dateFormatter.string(from: newDate)
        date.text = newDateString
    }
}
