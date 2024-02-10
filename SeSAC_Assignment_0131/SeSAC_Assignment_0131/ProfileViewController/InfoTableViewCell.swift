//
//  InfoTableViewCell.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/9/24.
//

import UIKit
import SnapKit

final class InfoTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    let mainLabel = UILabel()
    
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
    
    func configure(title: String, placeHolder: String) {
        titleLabel.text = title
        mainLabel.text = placeHolder
    }
    
    func setTitle(title: String) {
        mainLabel.text = title
        mainLabel.textColor = .white
    }
}

extension InfoTableViewCell: ViewProtocol {
    
    func configureHierarchy() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(mainLabel)
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(self.contentView).offset(5)
            $0.verticalEdges.greaterThanOrEqualTo(self.contentView).inset(15)
            $0.width.equalTo(self.contentView).dividedBy(4)
            $0.height.greaterThanOrEqualTo(22)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.bottom.equalTo(titleLabel)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(3)
            $0.trailing.equalTo(self.contentView).inset(5)
        }
    }
    
    func configureView() {
        self.backgroundColor = .clear
        
        titleLabel.font = .systemFont(ofSize: 15, weight: .regular)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .white
        
        mainLabel.font = .systemFont(ofSize: 13, weight: .regular)
        mainLabel.textColor = .white
        mainLabel.textAlignment = .left
    }
}
