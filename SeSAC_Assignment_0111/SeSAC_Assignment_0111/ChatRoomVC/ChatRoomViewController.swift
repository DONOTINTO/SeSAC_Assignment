//
//  ChatRoomViewController.swift
//  SeSAC_Assignment_0111
//
//  Created by 이중엽 on 1/13/24.
//

import UIKit

enum UserCase: Int {
    case Others
    case Own
}

class ChatRoomViewController: UIViewController {
    
    static let identifier: String = "ChatRoomViewController"
    
    @IBOutlet var chatRoomTableView: UITableView!
    @IBOutlet var textFieldLayoutView: UIView!
    @IBOutlet var mainTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    let cellIdentifier = [OthersChatTableViewCell.identifier, OwnTableViewCell.identifier]
    var chatData: ChatRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        chatRoomTableView.dataSource = self
        chatRoomTableView.delegate = self
        cellIdentifier.forEach {
            let xib = UINib(nibName: $0, bundle: nil)
            chatRoomTableView.register(xib, forCellReuseIdentifier: $0)
        }
        
        DispatchQueue.main.async {
            guard let chatData = self.chatData else { return }
            let chatList = chatData.chatList
            let last = IndexPath(row: chatList.count - 1, section: 0)
            self.chatRoomTableView.scrollToRow(at: last, at: .top, animated: false)
            self.navigationController?.navigationBar.topItem?.title = chatData.chatroomName
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.chatRoomTableView.endEditing(true)
    }
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        
    }
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let chatData else { return 0 }
        
        return chatData.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chatData else { return UITableViewCell() }
        let chatList = chatData.chatList
        
        if case .user = chatList[indexPath.row].user {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OwnTableViewCell.identifier, for: indexPath) as? OwnTableViewCell else { return UITableViewCell() }
            
            cell.setData(chatList[indexPath.row])
            cell.chatData = chatList[indexPath.row]
            cell.selectionStyle = .none
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OthersChatTableViewCell.identifier, for: indexPath) as? OthersChatTableViewCell else { return UITableViewCell() }
            
            cell.setData(chatList[indexPath.row])
            cell.chatData = chatList[indexPath.row]
            cell.selectionStyle = .none
            
            return cell
        }
    }
}

extension ChatRoomViewController {
    func configureUI() {
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        chatRoomTableView.backgroundColor = .black
        
        textFieldLayoutView.backgroundColor = .black
        
        mainTextField.backgroundColor = .lightGray
        mainTextField.placeholder = "메시지를 입력하세요"
        mainTextField.attributedPlaceholder = NSAttributedString(string: mainTextField.placeholder!, attributes: [.foregroundColor: UIColor.darkGray])
        
        sendButton.backgroundColor = .clear
        
        sendButton.setImage(UIImage(systemName: "arrowtriangle.forward"), for: .normal)
        sendButton.setTitle("", for: .normal)
        sendButton.tintColor = .darkGray
    }
    
    
}
