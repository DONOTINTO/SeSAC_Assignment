//
//  SecondCaseTableViewController.swift
//  SeSAC_Assignment_0105
//
//  Created by 이중엽 on 1/6/24.
//

import UIKit

class SecondCaseTableViewController: UITableViewController {
    
    var sectionList: [[String]] = []
    let firstSection = ["공지사항", "실험실", "버전 정보"]
    let secondSection = ["개인/보안", "알림", "채팅", "멀티 프로필"]
    let thirdSection = ["고객센터/도움말"]
    let header = ["전체 설정", "개인 설정", "기타"]
    @IBOutlet var cellLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designUI()
        sectionList.append(firstSection)
        sectionList.append(secondSection)
        sectionList.append(thirdSection)
    }
    
    func designUI() {
        self.tableView.backgroundColor = .black
        self.navigationItem.title = "설정"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        self.tableView.separatorColor = .gray
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.header[section]
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let view = view as? UITableViewHeaderFooterView else { return }
        view.textLabel?.textColor = .gray
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sectionList[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SecondCaseTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = UIColor(displayP3Red: 22/255, green: 22/255, blue: 24/255, alpha: 1)
        cell.cellLabel.text = self.sectionList[indexPath.section][indexPath.row]
        cell.cellLabel.textColor = .white
        cell.cellLabel.font = .systemFont(ofSize: 14)
        
        return cell
    }
}
