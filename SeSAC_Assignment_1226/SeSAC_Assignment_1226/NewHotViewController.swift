//
//  NewHotViewController.swift
//  SeSAC12.26_SB_HW
//
//  Created by 이중엽 on 12/27/23.
//

import UIKit
import SnapKit

class NewHotViewController: UIViewController {
    
    let searchBar = UISearchBar()
    let publicButton = UIButton()
    let popularButton = UIButton()
    let topTenButton = UIButton()
    let buttonStackView = UIStackView()
    
    let infoLabel = UILabel()
    let subInfoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        constraintsView()
    }
    
    func configureView() {
        self.view.backgroundColor = .black
        
        [searchBar, buttonStackView, infoLabel, subInfoLabel].forEach {
            self.view.addSubview($0)
        }
        
        [publicButton, popularButton, topTenButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 3
        buttonStackView.distribution = .fill
        
        searchBar.barTintColor = .black
        searchBar.barStyle = .default
        searchBar.placeholder = "게임, 시리즈, 영화를 검색하세요..."
        
        publicButton.setImage(UIImage(named: "blue"), for: .normal)
        publicButton.setTitle("공개 예정", for: .normal)
        
        
        popularButton.setImage(UIImage(named: "turquoise"), for: .normal)
        popularButton.setTitle("모두의 인기 콘텐츠", for: .normal)
        
        topTenButton.setImage(UIImage(named: "pink"), for: .normal)
        topTenButton.setTitle("TOP 10 시리즈", for: .normal)
        
        infoLabel.text = "이런! 찾으시는 작품이 없습니다."
        infoLabel.textColor = .white
        infoLabel.font = .boldSystemFont(ofSize: 22)
        
        subInfoLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        subInfoLabel.textColor = .lightGray
        subInfoLabel.numberOfLines = 1
        subInfoLabel.adjustsFontSizeToFitWidth = true
    }
    
    func constraintsView() {
        searchBar.snp.makeConstraints {
            $0.horizontalEdges.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide)
            $0.top.equalTo(self.searchBar.snp.bottom)
            $0.height.equalTo(50)
        }
        
        infoLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        subInfoLabel.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(5)
            $0.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
