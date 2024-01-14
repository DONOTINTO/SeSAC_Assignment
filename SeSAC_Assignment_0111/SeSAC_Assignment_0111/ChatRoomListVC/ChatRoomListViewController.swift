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
        
        mainSearchBar.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
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
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
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
            
            cell.chatData = chatData
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "ChatRoom", bundle: nil)
        guard let nextVC = storyBoard.instantiateViewController(withIdentifier: ChatRoomViewController.identifier) as? ChatRoomViewController else { return }
        
        nextVC.chatData = ChatRoomList.shared.getChatDataByIndex(indexPath.row)
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension ChatRoomListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchList = ChatRoomList.shared.searchData(searchText)
        
        chatRoomListTableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let inputText = searchBar.text {
            self.searchList = inputText.isEmpty ? nil : ChatRoomList.shared.searchData(inputText)
            chatRoomListTableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

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
