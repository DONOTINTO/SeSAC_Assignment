//
//  ProfileSettingViewController.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/9/24.
//

import UIKit
import SnapKit

class ProfileSettingViewController: UIViewController {
    
    private let titleTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    @objc private func doneButtonClicked(_ sender: UIBarButtonItem) {
        
    }
    
    func configure(placeHolder: String) {
        titleTextField.placeholder = placeHolder
        titleTextField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [.foregroundColor: UIColor.lightGray])
    }
    
    func navigationTitle(title: String) {
        let titleView = UILabel()
        titleView.text = title
        titleView.font = .systemFont(ofSize: 17, weight: .bold)
        titleView.textColor = .white
        
        self.navigationItem.titleView = titleView
    }
}

extension ProfileSettingViewController: ViewProtocol {
    func configureHierarchy() {
        self.view.addSubview(titleTextField)
    }
    
    func configureLayout() {
        titleTextField.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide).inset(5)
            $0.height.equalTo(22)
        }
    }
    
    func configureView() {
        self.view.backgroundColor = .black
        
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .white
        
        let rightBarButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(doneButtonClicked(_:)))
        rightBarButton.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 15, weight: .regular)], for: .normal)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        titleTextField.borderStyle = .none
        titleTextField.font = .systemFont(ofSize: 15, weight: .bold)
        titleTextField.textColor = .white
        titleTextField.textAlignment = .left
    }
}
