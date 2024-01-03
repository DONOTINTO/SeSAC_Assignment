//
//  HomeViewController.swift
//  SeSAC12.26_SB_HW
//
//  Created by 이중엽 on 12/26/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    @IBOutlet var thirdImageView: UIImageView!
    
    @IBOutlet var topTenImageView: UIImageView!
    @IBOutlet var newEpisodeLabel: UILabel!
    @IBOutlet var newSeriesLabel: UILabel!
    
    let movieList = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]
    let topTenHiddenList = ["더퍼스트슬램덩크", "밀수", "범죄도시3"]
    let newEpiHiddenList = ["범죄도시3", "서울의봄", "스즈메의문단속"]
    let newSeriesHiddenLsit = ["스즈메의문단속", "아바타물의길", "오펜하이머"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [mainImageView, firstImageView, secondImageView, thirdImageView].forEach {
            $0?.layer.cornerRadius = 10
        }
    }

    @IBAction func playButtonClicked(_ sender: UIButton) {
        var temp = Set<String>()
        
        while Set(temp).count != 4 {
            temp.insert(movieList.randomElement()!)
        }
        
        let randomImagesName = Array(temp)
        
        mainImageView.image = UIImage(named: randomImagesName[0])
        firstImageView.image = UIImage(named: randomImagesName[1])
        secondImageView.image = UIImage(named: randomImagesName[2])
        thirdImageView.image = UIImage(named: randomImagesName[3])
        
        flagOnOff(imageName: randomImagesName[2])
        flagOnOff(imageName: randomImagesName[3])
    }
    
    func flagOnOff(imageName: String) {
        topTenImageView.isHidden = (topTenHiddenList.contains(imageName)) ? true : false
        newEpisodeLabel.isHidden = (newEpiHiddenList.contains(imageName)) ? true : false
        newSeriesLabel.isHidden = (newSeriesHiddenLsit.contains(imageName)) ? true : false
    }
    
}

