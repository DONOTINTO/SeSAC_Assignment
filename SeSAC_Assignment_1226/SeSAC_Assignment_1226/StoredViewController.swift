//
//  StoredViewController.swift
//  SeSAC12.26_SB_HW
//
//  Created by 이중엽 on 12/27/23.
//

import UIKit

class StoredViewController: UIViewController {
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var setButton: UIButton!
    @IBOutlet var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designLabel(mainLabel, text: "'나만의 자동 저장' 기능", fontSize: 27, textColor: .white)
        designLabel(descriptionLabel, text: "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요.", fontSize: 17, textColor: .lightGray)
        descriptionLabel.numberOfLines = 3
        
        designButton(setButton, title: "설정하기", fontSize: 17)
        designButton(searchButton, title: "저장 가능한 콘텐츠 찾아보기", fontSize: 14)
    }
    
    func designLabel(_ label: UILabel, text: String, fontSize: CGFloat, textColor: UIColor) {
        label.text = text
        label.textAlignment = .center
        label.textColor = textColor
        label.font = .systemFont(ofSize: fontSize)
    }
    
    func designButton(_ button: UIButton, title: String, fontSize: CGFloat) {
        setButton.setTitleColor(.black, for: .normal)
        setButton.titleLabel?.font = .boldSystemFont(ofSize: fontSize)
        setButton.setTitle(title, for: .normal)
        setButton.layer.cornerRadius = 10
        setButton.backgroundColor = .cyan
    }
}
