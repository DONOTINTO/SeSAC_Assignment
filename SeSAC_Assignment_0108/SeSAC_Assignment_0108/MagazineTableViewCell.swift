//
//  MagazineTableViewCell.swift
//  SeSAC_Assignment_0108
//
//  Created by 이중엽 on 1/8/24.
//

import UIKit
import Kingfisher

class MagazineTableViewCell: UITableViewCell {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var mainTitleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func designUI() {
        mainImageView.layer.cornerRadius = 10
        mainImageView.contentMode = .scaleAspectFill
        
        mainTitleLabel.font = .boldSystemFont(ofSize: 24)
        mainTitleLabel.numberOfLines = 0
        mainTitleLabel.textColor = .black
        mainTitleLabel.textAlignment = .left
        
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.textColor = .lightGray
        subTitleLabel.textAlignment = .left
        
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .right
    }
    
    func setData(link: String, title: String, subTitle: String, date: String) {
        let url = URL(string: link)
        mainImageView.kf.setImage(with: url)
        
        mainTitleLabel.text = title
        
        subTitleLabel.text = subTitle
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        guard let myDate = dateFormatter.date(from: date) else { return }
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        
        dateLabel.text = dateFormatter.string(from: myDate)
    }
}
