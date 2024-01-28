//
//  HomeViewController.swift
//  SeSAC12.26_SB_HW
//
//  Created by 이중엽 on 12/26/23.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    let scrollView = UIScrollView()
    let scrollContentView = UIView()
    
    let mainImageView = UIImageView()
    let playButton = UIButton()
    let listButton = UIButton()
    let infoLable = UILabel()
    
    let imageStackView = UIStackView()
    let firstImageView = UIImageView()
    let secondImageView = UIImageView()
    let thirdImageView = UIImageView()
    
    let movieList = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]
    let topTenHiddenList = ["더퍼스트슬램덩크", "밀수", "범죄도시3"]
    let newEpiHiddenList = ["범죄도시3", "서울의봄", "스즈메의문단속"]
    let newSeriesHiddenLsit = ["스즈메의문단속", "아바타물의길", "오펜하이머"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        constraintsView()
        
        var temp = Set<String>()
        
        while Set(temp).count != 4 {
            temp.insert(movieList.randomElement()!)
        }
        
        let randomImagesName = Array(temp)
        
        mainImageView.image = UIImage(named: randomImagesName[0])
        firstImageView.image = UIImage(named: randomImagesName[1])
        secondImageView.image = UIImage(named: randomImagesName[2])
        thirdImageView.image = UIImage(named: randomImagesName[3])
    }
}

extension HomeViewController {
    func configureView() {
        self.view.backgroundColor = .black
        self.scrollView.backgroundColor = .clear
        self.scrollContentView.backgroundColor = .clear
        self.navigationItem.title = "고래밥님"
        
        scrollView.addSubview(scrollContentView)
        
        [scrollView, mainImageView, playButton, listButton, infoLable, imageStackView].forEach {
            self.view.addSubview($0)
        }
        
        [firstImageView, secondImageView, thirdImageView].forEach {
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
            imageStackView.addArrangedSubview($0)
        }
        
        mainImageView.backgroundColor = .white
        mainImageView.layer.cornerRadius = 15
        mainImageView.clipsToBounds = true
        
        let playImage = UIImage(systemName: "play.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        var playBtnConfig = UIButton.Configuration.plain()
        playBtnConfig.title = "재생"
        playBtnConfig.baseForegroundColor = .black
        playBtnConfig.image = playImage
        playBtnConfig.imagePlacement = .leading
        playBtnConfig.imagePadding = 10
        playBtnConfig.background.backgroundColor = .white
        playButton.configuration = playBtnConfig
        
        let listImage = UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        var listBtnConfig = UIButton.Configuration.filled()
        listBtnConfig.title = "내가 찜한 리스트"
        // listBtnConfig.title.adjec
        listBtnConfig.baseForegroundColor = .white
        listBtnConfig.image = listImage
        listBtnConfig.imagePlacement = .leading
        listBtnConfig.imagePadding = 10
        listBtnConfig.background.backgroundColor = .gray
        listBtnConfig.titleLineBreakMode = .byTruncatingTail
        listBtnConfig.attributedTitle?.font = UIFont.systemFont(ofSize: 14)
        listButton.configuration = listBtnConfig
        
        infoLable.text = "지금 뜨는 콘텐츠"
        infoLable.textColor = .white
        
        imageStackView.axis = .horizontal
        imageStackView.spacing = 5
        imageStackView.distribution = .fillEqually
    }
    
    func constraintsView() {
        self.scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        self.scrollContentView.snp.makeConstraints {
            $0.edges.equalTo(self.scrollView)
            $0.width.equalTo(self.scrollView)
        }
        
        self.mainImageView.snp.makeConstraints {
            $0.horizontalEdges.top.equalTo(self.scrollContentView).inset(10)
            $0.height.equalTo(self.mainImageView.snp.width).multipliedBy(1.5)
        }
        
        self.playButton.snp.makeConstraints {
            $0.leading.equalTo(self.mainImageView.snp.leading).inset(20)
            $0.bottom.equalTo(self.mainImageView.snp.bottom).inset(10)
            $0.height.equalTo(34)
        }
        
        self.listButton.snp.makeConstraints {
            $0.leading.equalTo(self.playButton.snp.trailing).offset(20)
            $0.trailing.equalTo(self.mainImageView.snp.trailing).inset(20)
            $0.bottom.equalTo(self.mainImageView.snp.bottom).inset(10)
            $0.width.equalTo(self.playButton.snp.width)
            $0.height.equalTo(34)
        }
        
        self.infoLable.snp.makeConstraints {
            $0.top.equalTo(self.mainImageView.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(self.scrollContentView).offset(10)
        }
        
        self.imageStackView.snp.makeConstraints {
            $0.top.equalTo(self.infoLable.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(self.scrollContentView).inset(10)
            $0.bottom.equalTo(self.scrollContentView)
        }
        
        self.firstImageView.snp.makeConstraints {
            $0.leading.equalTo(self.imageStackView.snp.leading)
            $0.height.equalTo(self.firstImageView.snp.width).multipliedBy(1.5)
        }
        
        self.secondImageView.snp.makeConstraints {
            $0.height.equalTo(self.secondImageView.snp.width).multipliedBy(1.5)
        }
        
        self.thirdImageView.snp.makeConstraints {
            $0.height.equalTo(self.thirdImageView.snp.width).multipliedBy(1.5)
        }
    }
}
