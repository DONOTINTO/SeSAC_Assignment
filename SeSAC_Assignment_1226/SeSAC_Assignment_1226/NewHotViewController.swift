//
//  NewHotViewController.swift
//  SeSAC12.26_SB_HW
//
//  Created by 이중엽 on 12/27/23.
//

import UIKit

class NewHotViewController: UIViewController {
    @IBOutlet var infoLabel: UILabel!
    
    @IBOutlet var publicButton: UIButton!
    @IBOutlet var popularButton: UIButton!
    @IBOutlet var topTenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        publicButton.setImage(UIImage(named: "blue"), for: .normal)
        popularButton.setImage(UIImage(named: "turquoise"), for: .normal)
        topTenButton.setImage(UIImage(named: "pink"), for: .normal)
        changeColor(button: publicButton, isFocus: false)
        changeColor(button: popularButton, isFocus: false)
        changeColor(button: topTenButton, isFocus: false)
    }
    
    @IBAction func tapGestureRecognizerClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func tagButtonClicked(_ sender: UIButton) {
        infoLabel.text = "이런! \(sender.titleLabel!.text!) 작품이 없습니다."
        
        tagButtonFocused(button: sender)
    }
    
    func tagButtonFocused(button: UIButton) {
        switch button.titleLabel?.text {
        case "공개 예정":
            changeColor(button: publicButton, isFocus: true)
            changeColor(button: popularButton, isFocus: false)
            changeColor(button: topTenButton, isFocus: false)
            break
        case "모두의 인기 콘텐츠":
            changeColor(button: publicButton, isFocus: false)
            changeColor(button: popularButton, isFocus: true)
            changeColor(button: topTenButton, isFocus: false)
            break
        case "TOP 10 시리즈":
            changeColor(button: publicButton, isFocus: false)
            changeColor(button: popularButton, isFocus: false)
            changeColor(button: topTenButton, isFocus: true)
            break
        default:
            break
        }
    }
    
    func changeColor(button: UIButton, isFocus: Bool) {
        let backgroundColor: UIColor = (isFocus == true) ? .white : .black
        let titleColor: UIColor = (isFocus == true) ? .black : .white
        
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        
        button.layer.cornerRadius = 5
    }
}
