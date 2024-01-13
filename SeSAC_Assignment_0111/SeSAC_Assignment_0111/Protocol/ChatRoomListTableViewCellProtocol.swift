//
//  ChatRoomListTableViewCellProtocol.swift
//  SeSAC_Assignment_0111
//
//  Created by 이중엽 on 1/13/24.
//

import Foundation

protocol ChatCellProtocol {
    static var identifier: String { get }
    var chatData: ChatRoom? { get }
}
