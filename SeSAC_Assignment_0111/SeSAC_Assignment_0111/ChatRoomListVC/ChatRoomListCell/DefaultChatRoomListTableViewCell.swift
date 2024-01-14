//
//  DefaultChatRoomListTableViewCell.swift
//  SeSAC_Assignment_0111
//
//  Created by 이중엽 on 1/13/24.
//

import UIKit

class DefaultChatRoomListTableViewCell: UITableViewCell {
    static var identifier: String = "DefaultChatRoomListTableViewCell"
    var chatData: ChatRoom?
    
    @IBOutlet var imageLayoutView: UIView!
    @IBOutlet var chatroomImageView: [UIImageView]!
    @IBOutlet var chatroomNameLabel: UILabel!
    @IBOutlet var chatroomMessageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        self.configureChatRoomListUI(layoutView: imageLayoutView, imageViews: chatroomImageView, roomName: chatroomNameLabel, roomMessage: chatroomMessageLabel, date: dateLabel)
        
        guard let data = chatData else { return }
        self.setChatRoomListData(chatroom: data, imageViews: chatroomImageView, roomName: chatroomNameLabel, roomMessage: chatroomMessageLabel, date: dateLabel)
    }
}
