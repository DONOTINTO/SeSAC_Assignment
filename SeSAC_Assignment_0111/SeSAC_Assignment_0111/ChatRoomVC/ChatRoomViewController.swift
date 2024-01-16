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
    
    @IBOutlet var chatRoomTableView: UITableView!
    @IBOutlet var textFieldLayoutView: UIView!
    @IBOutlet var mainTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    let cellIdentifier = [OthersChatTableViewCell.identifier, OwnTableViewCell.identifier]
    var chatData: ChatRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setTableView()
        setScrollToRow()
        setNavigationUI()
        setDismissKeyboard()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setTableView() {
        chatRoomTableView.separatorStyle = .none
        chatRoomTableView.dataSource = self
        chatRoomTableView.delegate = self
        cellIdentifier.forEach {
            let xib = UINib(nibName: $0, bundle: nil)
            chatRoomTableView.register(xib, forCellReuseIdentifier: $0)
        }
    }
    
    func setScrollToRow() {
        guard let chatData else { return }
        
        let chatList = chatData.chatList
        let last = IndexPath(row: chatList.count - 1, section: 0)
        self.chatRoomTableView.scrollToRow(at: last, at: .top, animated: false)
    }
    
    func getChatData() -> ChatRoom {
        guard let chatData else { return ChatRoom(chatroomId: 0, chatroomImage: [], chatroomName: "")}
        return chatData
    }
    
    // 새로운 메시지 띄우기
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        guard let newMessage = mainTextField.text else { return }
        if newMessage == "" { return }
        let chatData = getChatData()
        
        mainTextField.text = ""
        ChatRoomList.shared.updateChatData(chatData.chatroomId, message: newMessage)
        chatRoomTableView.reloadData()
        setScrollToRow()
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        if view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardHeight
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y += keyboardHeight
        }
    }
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let chatData = getChatData()
        
        return chatData.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatData = getChatData()
        let chatList = chatData.chatList
        
        if case .user = chatList[indexPath.row].user {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OwnTableViewCell.identifier, for: indexPath) as? OwnTableViewCell else { return UITableViewCell() }
            
            cell.setData(chatList[indexPath.row])
            cell.selectionStyle = .none
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OthersChatTableViewCell.identifier, for: indexPath) as? OthersChatTableViewCell else { return UITableViewCell() }
            
            cell.setData(chatList[indexPath.row])
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
        let chatData = self.getChatData()
        //분명 데이터가 있는데 왜 안되는지 모르겠다...
        // print(#function, chatData.chatroomName)
        //ChatRoomListViewController의 title이 변경됨(????)
        // self.navigationController?.navigationBar.topItem?.title = chatData.chatroomName
        
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
    
    func setNavigationUI() {
        let chatData = self.getChatData()
        self.navigationItem.title = chatData.chatroomName
        //얘는 동작이 이상함
        // self.navigationController?.navigationBar.topItem?.title = chatData.chatroomName
    }
}
