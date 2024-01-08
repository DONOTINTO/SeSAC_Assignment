//
//  ThirsdTableViewController.swift
//  SeSAC_Assignment_0105
//
//  Created by 이중엽 on 1/6/24.
//

import UIKit

struct MyItem {
    var item: String
    var check: Bool = false
    var star: Bool = false
}

class ThirsdTableViewController: UITableViewController {
    @IBOutlet var mainTextField: UITextField!
    @IBOutlet var appendButton: UIButton!
    var shoppingList = [MyItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designUI()
    }
    
    @IBAction func appendButtonClicked(_ sender: UIButton) {
        guard let text = mainTextField.text else { return }
        let myItem = MyItem(item: text)
        shoppingList.append(myItem)
        self.tableView.reloadData()
    }
    
    @objc func checkButtonClicked(_ sender: UIButton) {
        let idx = sender.tag
        
        shoppingList[idx].check.toggle()
        self.tableView.reloadData()
    }
    
    @objc func starButtonClicked(_ sender: UIButton) {
        let idx = sender.tag
        
        shoppingList[idx].star.toggle()
        self.tableView.reloadData()
    }
    
    func designUI() {
        self.tableView.backgroundColor = .white
        self.navigationItem.title = "쇼핑"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        self.tableView.separatorColor = .lightGray
        
        mainTextField.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        mainTextField.placeholder = "무엇을 구매하실 건가요?"
        mainTextField.borderStyle = .none
        mainTextField.layer.cornerRadius = 10
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: mainTextField.frame.height))
        mainTextField.leftView = padding
        mainTextField.leftViewMode = .always
        
        appendButton.setTitle("추가", for: .normal)
        appendButton.setTitleColor(.black, for: .normal)
        appendButton.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 233/255, alpha: 1)
        appendButton.layer.cornerRadius = 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as? ThirdCaseTableViewCell else { return UITableViewCell() }
        
        //이 부분 복습...필수..-------------------------------------------------
        //https://gyuios.tistory.com/126
        let imageConfiguration = UIImage.SymbolConfiguration(scale: .large)
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.background.backgroundColor = .clear
        //------------------------------------------------------------------
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        cell.mainView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        cell.mainView.layer.cornerRadius = 10
        
        cell.mainLabel.text = shoppingList[indexPath.row].item
        cell.mainLabel.textColor = .black
        cell.mainLabel.textAlignment = .left
        
        cell.checkButton.configuration = buttonConfiguration
        cell.checkButton.tag = indexPath.row
        cell.checkButton.tintColor = .black
        cell.checkButton.setImage(UIImage(systemName: shoppingList[indexPath.row].check ? "checkmark.square.fill" : "checkmark.square", withConfiguration: imageConfiguration), for: .normal)
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked(_:)), for: .touchUpInside)
        
        cell.starButton.configuration = buttonConfiguration
        cell.starButton.tag = indexPath.row
        cell.starButton.tintColor = .black
        cell.starButton.setImage(UIImage(systemName: shoppingList[indexPath.row].star ? "star.fill" : "star", withConfiguration: imageConfiguration), for: .normal)
        cell.starButton.addTarget(self, action: #selector(starButtonClicked(_:)), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
        }
        tableView.reloadData()
    }
}
