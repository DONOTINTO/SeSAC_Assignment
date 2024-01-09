//
//  CityCollectionViewCell.swift
//  SeSAC_Assignment_0109
//
//  Created by 이중엽 on 1/9/24.
//

import UIKit
import Kingfisher

class CityCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        let width = UIScreen.main.bounds.width
        let imageRadius: CGFloat = (width - (2 * Spacing.insetSpacing) - ((Spacing.row - 1) * Spacing.interSpacing)) / 4
        cityImageView.layer.cornerRadius = imageRadius
        cityImageView.contentMode = .scaleAspectFill
        
        cityLabel.font = .boldSystemFont(ofSize: 14)
        cityLabel.textAlignment = .center
        cityLabel.textColor = .black
        
        placeLabel.font = .systemFont(ofSize: 12)
        placeLabel.numberOfLines = 0
        placeLabel.textAlignment = .center
        placeLabel.textColor = .lightGray
    }

    func setData(_ data: City) {
        let url = URL(string: data.city_image)
        cityImageView.kf.setImage(with: url)
        
        cityLabel.text = "\(data.city_name) | \(data.city_english_name)"
        placeLabel.text = data.city_explain
    }
}
