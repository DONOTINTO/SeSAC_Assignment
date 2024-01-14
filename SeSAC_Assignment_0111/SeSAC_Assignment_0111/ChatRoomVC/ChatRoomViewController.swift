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
    var roomID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setTableView()
        setDismissKeyboard()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
    
    func setRoomID(_ id: Int) {
        self.roomID = id
        
        setScrollToRow()
        setNavigationUI()
    }
    
    // 스크롤 맨 아래로 이동, 네비게이션 타이틀 설정
    // chatData가 넘어오는 시점이 viewDidLoad보다는 뒤임
    // 다른 처리 방법은?
    func setScrollToRow() {
        DispatchQueue.main.async {
            let chatData = self.getChatData()
            
            let chatList = chatData.chatList
            let last = IndexPath(row: chatList.count - 1, section: 0)
            self.chatRoomTableView.scrollToRow(at: last, at: .top, animated: false)
        }
    }
    
    func getChatData() -> ChatRoom {
        return ChatRoomList.shared.getChatRoomDataByRoomID(roomID)
    }
    
    // 새로운 메시지 띄우기
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        guard let newMessage = mainTextField.text else { return }
        if newMessage == "" { return }
        
        mainTextField.text = ""
        ChatRoomList.shared.updateChatData(roomID, message: newMessage)
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
    
    func setNavigationUI() {
        DispatchQueue.main.async {
            let chatData = self.getChatData()
            
            self.navigationController?.navigationBar.topItem?.title = chatData.chatroomName
        }
    }
}
