//
//  ProfileViewController.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/9/24.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {

    override func loadView() {
        super.loadView()
        
        self.view = ProfileView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureView()
        setNavigationView()
    }
    
    @objc private func backButtonClicked(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func completeButtonClicked(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setNavigationView() {
        // 왼쪽 백 버튼 커스텀으로 제작
        // 기존 back 버튼 숨기기
        self.navigationItem.setHidesBackButton(true, animated: true)
        let leftButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(backButtonClicked(_:)))
        leftButtonItem.tintColor = .white
        self.navigationItem.leftBarButtonItem = leftButtonItem
        
        // 타이틀 뷰 설정
        let titleView = UILabel()
        titleView.text = "프로필 편집"
        titleView.textColor = .white
        titleView.font = .systemFont(ofSize: 15, weight: .bold)
        titleView.textAlignment = .center
        self.navigationItem.titleView = titleView
        
        // 완료 버튼
        let customCompleteView = UIButton()
        customCompleteView.setTitle("완료", for: .normal)
        customCompleteView.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        customCompleteView.addTarget(self, action: #selector(completeButtonClicked(_:)), for: .touchUpInside)
        let completeBarButton = UIBarButtonItem(customView: customCompleteView)
        
        self.navigationItem.rightBarButtonItem = completeBarButton
    }
    
    private func view() -> ProfileView {
        guard let view = view as? ProfileView else { return ProfileView() }
        
        return view
    }
}

extension ProfileViewController: ViewProtocol {
    func configureHierarchy() {
        view().profileTableView.dataSource = self
        view().profileTableView.delegate = self
        view().profileTableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.identifier)
        view().profileTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
    }
    
    func configureLayout() {
        
    }
    
    func configureView() {        
        view().profileTableView.backgroundColor = .black
        view().backgroundColor = .black
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = ProfileSections(rawValue: section) else { return 0 }
        
        switch sectionType {
        case .info:
            return ProfileSections.Info.count
        case .setting:
            return ProfileSections.Setting.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = ProfileSections(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch sectionType {
        case .info:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as? InfoTableViewCell else { return UITableViewCell() }
            
            if let info = ProfileSections.Info(rawValue: indexPath.row) {
                cell.configure(title: info.title, placeHolder: info.placeHolder)
            }
            cell.selectionStyle = .none
            
            return cell
            
        case .setting:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
            
            if let info = ProfileSections.Setting(rawValue: indexPath.row) {
                cell.configure(title: info.title)
            }
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = ProfileSettingViewController()
        
        guard let sectionType = ProfileSections(rawValue: indexPath.section) else { return }
        
        if sectionType == .info {
            guard let type = ProfileSections.Info(rawValue: indexPath.row) else { return }
            
            let title = type.title
            
            nextVC.navigationTitle(title: title)
            nextVC.configure(placeHolder: title)
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
