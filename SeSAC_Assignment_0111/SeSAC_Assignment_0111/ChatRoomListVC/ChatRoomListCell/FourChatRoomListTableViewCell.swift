//
//  FourChatRoomListTableViewCell.swift
//  SeSAC_Assignment_0111
//
//  Created by 이중엽 on 1/13/24.
//

import UIKit

class FourChatRoomListTableViewCell: UITableViewCell {
    static var identifier: String = "FourChatRoomListTableViewCell"
    var chatData: ChatRoom?
    
    @IBOutlet var imageLayoutView: UIView!
    @IBOutlet var chatroomImageViews: [UIImageView]!
    @IBOutlet var chatroomNameLabel: UILabel!
    @IBOutlet var chatroomMessageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        self.configureChatRoomListUI(layoutView: imageLayoutView, imageViews: chatroomImageViews, roomName: chatroomNameLabel, roomMessage: chatroomMessageLabel, date: dateLabel)
        
        guard let data = chatData else { return }
        
        self.setChatRoomListData(chatroom: data, imageViews: chatroomImageViews, roomName: chatroomNameLabel, roomMessage: chatroomMessageLabel, date: dateLabel)
    }
}
