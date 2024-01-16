//
//  ChatRoomListViewController.swift
//  SeSAC_Assignment_0111
//
//  Created by 이중엽 on 1/13/24.
//

import UIKit

enum ChatCase: Int {
    case two = 1
    case three
    case four
    case five
}

class ChatRoomListViewController: UIViewController {

    @IBOutlet var mainSearchBar: UISearchBar!
    @IBOutlet var chatRoomListTableView: UITableView!
    var searchList: [ChatRoom]?
    let cellIdentifier: [String] = [DefaultChatRoomListTableViewCell.identifier,
                                    ThreeChatRoomListTableViewCell.identifier,
                                    FourChatRoomListTableViewCell.identifier,
                                    FiveChatRoomListTableViewCell.identifier]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setTableView()
        setDismissKeyboard()
        
        mainSearchBar.delegate = self
    }
    
    func setTableView() {
        chatRoomListTableView.dataSource = self
        chatRoomListTableView.delegate = self
        chatRoomListTableView.keyboardDismissMode = .interactive
        
        cellIdentifier.forEach {
            let xib = UINib(nibName: $0, bundle: nil)
            chatRoomListTableView.register(xib, forCellReuseIdentifier: $0)
        }
    }
}

extension ChatRoomListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = ChatRoomList.shared.getChatRoomListCount()
        
        if let searchList { count = searchList.count }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var chatData = ChatRoomList.shared.getChatDataByIndex(indexPath.row)
        
        if let searchList { chatData = searchList[indexPath.row] }
        
        let numberOfChatUsers = chatData.chatroomImage.count
        let cellCase = ChatCase.init(rawValue: numberOfChatUsers)
        
        if case .two = cellCase {
            let cellType = DefaultChatRoomListTableViewCell.self
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath) as? DefaultChatRoomListTableViewCell else { return UITableViewCell() }
            
            cell.setChatRoomListData(chatroom: chatData, imageViews: cell.chatroomImageView, roomName: cell.chatroomNameLabel, roomMessage: cell.chatroomMessageLabel, date: cell.dateLabel)
            
            // VC -> Cell 데이터 직접 전달 불가
            // cell.chatData = chatData
            
            return cell
        } else if case .three = cellCase {
            let cellType = ThreeChatRoomListTableViewCell.self
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath) as? ThreeChatRoomListTableViewCell else { return UITableViewCell() }
            
            cell.setChatRoomListData(chatroom: chatData, imageViews: cell.chatroomImageViews, roomName: cell.chatroomNameLabel, roomMessage: cell.chatroomMessageLabel, date: cell.dateLabel)
            
            cell.chatData = chatData
            
            return cell
        } else if case .four = cellCase {
            let cellType = FourChatRoomListTableViewCell.self
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath) as? FourChatRoomListTableViewCell else { return UITableViewCell() }
            
            cell.setChatRoomListData(chatroom: chatData, imageViews: cell.chatroomImageViews, roomName: cell.chatroomNameLabel, roomMessage: cell.chatroomMessageLabel, date: cell.dateLabel)
            
            cell.chatData = chatData
            
            return cell
        } else {
            let cellType = FiveChatRoomListTableViewCell.self
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath) as? FiveChatRoomListTableViewCell else { return UITableViewCell() }
            
            cell.setChatRoomListData(chatroom: chatData, imageViews: cell.chatroomImageViews, roomName: cell.chatroomNameLabel, roomMessage: cell.chatroomMessageLabel, date: cell.dateLabel)
            
            cell.chatData = chatData
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // 해당 채팅 방으로 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "ChatRoom", bundle: nil)
        guard let nextVC = storyBoard.instantiateViewController(withIdentifier: ChatRoomViewController.identifier) as? ChatRoomViewController else { return }
        
        let chatData = ChatRoomList.shared.getChatDataByIndex(indexPath.row)
        nextVC.chatData = chatData
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension ChatRoomListViewController: UISearchBarDelegate {
    // 검색 결과를 포함하는 채팅방만 노출
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchList = ChatRoomList.shared.searchData(searchText)
        
        chatRoomListTableView.reloadData()
    }
    
    // 채팅방 리스트 리셋
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let inputText = searchBar.text {
            self.searchList = inputText.isEmpty ? nil : ChatRoomList.shared.searchData(inputText)
            chatRoomListTableView.reloadData()
        }
    }
    
    // 키보드 검색 클릭 시 키보드 다운
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// UI 관리
extension ChatRoomListViewController {
    func configureUI() {
        self.view.backgroundColor = .black
        
        self.navigationController?.navigationBar.topItem?.title = "TRAVEL TALK"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.chatRoomListTableView.backgroundColor = .clear
        self.chatRoomListTableView.separatorStyle = .none
        
        self.mainSearchBar.barStyle = .default
        self.mainSearchBar.barTintColor = .black
        self.mainSearchBar.searchTextField.backgroundColor = .systemGray4
        self.mainSearchBar.searchTextField.placeholder = "친구 이름을 검색해보세요"
    }
}
