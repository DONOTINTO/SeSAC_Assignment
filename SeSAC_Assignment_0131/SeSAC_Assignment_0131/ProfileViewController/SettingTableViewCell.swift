//
//  SettingTableViewCell.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/9/24.
//

import UIKit
import SnapKit

final class SettingTableViewCell: UITableViewCell {

    private let button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func configure(title: String) {
        button.setTitle(title, for: .normal)
    }
}

extension SettingTableViewCell: ViewProtocol {
    
    func configureHierarchy() {
        self.contentView.addSubview(button)
    }
    
    func configureLayout() {
        button.snp.makeConstraints {
            $0.edges.equalTo(self.contentView).inset(5)
            $0.height.equalTo(22)
        }
    }
    
    func configureView() {
        self.backgroundColor = .black
        
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        button.contentHorizontalAlignment = .left
    }
}
