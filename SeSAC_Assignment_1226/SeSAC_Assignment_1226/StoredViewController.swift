//
//  StoredViewController.swift
//  SeSAC12.26_SB_HW
//
//  Created by 이중엽 on 12/27/23.
//

import UIKit

class StoredViewController: UIViewController {
    
    let mainLabel = UILabel()
    let descriptionLabel = UILabel()
    let mainImage = UIImageView()
    let setButton = UIButton()
    let searchButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        constraintsView()
    }
    
    func configureView() {
        [mainLabel, descriptionLabel, mainImage, setButton, searchButton].forEach {
            self.view.addSubview($0)
        }
        
        self.navigationItem.title = "저장한 콘텐츠 목록"
        
        designLabel(mainLabel, text: "'나만의 자동 저장' 기능", fontSize: 27, textColor: .white)
        designLabel(descriptionLabel, text: "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요.", fontSize: 17, textColor: .lightGray)
        descriptionLabel.numberOfLines = 3
        descriptionLabel.adjustsFontSizeToFitWidth = true
        
        mainImage.image = UIImage(named: "dummy")
        mainImage.contentMode = .scaleAspectFit
        
        designButton(setButton, title: "설정하기", fontSize: 17, color: .cyan)
        designButton(searchButton, title: "저장 가능한 콘텐츠 찾아보기", fontSize: 14, color: .white)
    }
    
    func constraintsView() {
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            $0.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(200)
        }
        
        setButton.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide).inset(30)
            $0.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(setButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide).inset(50)
            $0.height.equalTo(40)
        }
    }
    
    func designLabel(_ label: UILabel, text: String, fontSize: CGFloat, textColor: UIColor) {
        label.text = text
        label.textAlignment = .center
        label.textColor = textColor
        label.font = .systemFont(ofSize: fontSize)
    }
    
    func designButton(_ button: UIButton, title: String, fontSize: CGFloat, color: UIColor) {
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: fontSize)
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = color
    }
}
