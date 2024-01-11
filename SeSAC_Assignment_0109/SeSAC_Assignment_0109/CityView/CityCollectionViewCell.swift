//
//  CityCollectionViewCell.swift
//  SeSAC_Assignment_0109
//
//  Created by 이중엽 on 1/9/24.
//

import UIKit
import Kingfisher

class CityCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CityCollectionViewCell"

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
}

extension CityCollectionViewCell: ViewProtocol {
    func configureUI() {
        cityImageView.contentMode = .scaleAspectFill
        cityLabel.setLabel(text: "", font: .Bold, fontSize: 14)
        placeLabel.setLabel(text: "", textColor: .lightGray, font: .System, fontSize: 12, line: 0)
    }
    
    func setData(_ data: City) {
        let url = URL(string: data.city_image)
        cityImageView.kf.setImage(with: url)
        
        cityLabel.text = "\(data.city_name) | \(data.city_english_name)"
        placeLabel.text = data.city_explain
    }
}
