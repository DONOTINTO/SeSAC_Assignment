//
//  DetailTableViewCell.swift
//  SeSAC_Assignment_0109
//
//  Created by 이중엽 on 1/11/24.
//

import UIKit
import Kingfisher


class DetailTableViewCell: UITableViewCell {
    
    static let identifier = "DetailTableViewCell"
    
    @IBOutlet var cityImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var gradeStackView: UIStackView!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var gradeImages: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
}

extension DetailTableViewCell: ViewProtocol {
    func configureUI() {
        gradeStackView.spacing = 0
        gradeStackView.distribution = .fillEqually
        
        cityImage.contentMode = .scaleAspectFill
        cityImage.layer.cornerRadius = 3
        
        titleLabel.setLabel(text: "", font: .Bold, fontSize: 17, alignment: .left)
        descriptionLabel.setLabel(text: "", font: .System, fontSize: 15, line: 0, alignment: .left)
        saveLabel.setLabel(text: "", textColor: .lightGray, font: .System, fontSize: 13, alignment: .left)
        
        likeButton.tintColor = .black
        likeButton.setTitle("", for: .normal)
    }
    
    func setInfo(_ travel: Travel) {
        guard let travel_image = travel.travel_image else { return }
        guard let title = travel.title else { return }
        guard let description = travel.description else { return }
        guard let grade = travel.grade else { return }
        guard let save = travel.save else { return }
        guard let like = travel.like else { return }
        
        let numberFomatter = NumberFormatter()
        numberFomatter.numberStyle = .decimal
        
        guard let result = numberFomatter.string(from: NSNumber(value: save)) else { return }
        
        let url = URL(string: travel_image)
        self.cityImage.kf.setImage(with: url)
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        self.saveLabel.text = "저장 \(result)"
        
        let image = UIImage(systemName: (like ? "heart.fill" : "heart"))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        likeButton.setImage(image, for: .normal)
        
        for idx in 0 ..< gradeImages.count {
            let imageConfig = UIImage.SymbolConfiguration(scale: .medium)
            gradeImages[idx].tintColor = .systemYellow
            
            let image = UIImage(systemName: (Float(idx + 1) <= grade ? "star.fill" : "star") , withConfiguration: imageConfig)
            gradeImages[idx].image = image
        }
    }
}
