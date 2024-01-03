//
//  ViewController.swift
//  newlyCoinedWord_SB_HW
//
//  Created by 이중엽 on 12/28/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var mainLabel: UILabel!
    
    // let newlyCoinedWord: Dictionary<String, String> = ["700": "'귀여워'의 초성을 숫자로 표현한 것", "제곧내": "제목이 곧 내용", "점메추": "점심 메뉴 추천", "빠태": "빠른 태세 전환", "갈비": "갈수록 비호감"]
    let key: [String] = ["700", "제곧내", "점메추", "빠태", "갈비","abc"]
    let value: [String] = ["'귀여워'의 초성을 숫자로 표현한 것", "제목이 곧 내용", "점심 메뉴 추천", "빠른 태세 전환", "갈수록 비호감","abc테스트"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
        setRecommandButton()
    }

    @IBAction func searchButtonClicked(_ sender: UIButton) {
        let keyword = inputTextField.text!.uppercased()
        let keywords = key.map { $0.uppercased() }
        // if newlyCoinedWord.contains(where: { key, _ in  key == keyword}) {
        //     mainLabel.text = newlyCoinedWord[keyword]
        // } else {
        //     mainLabel.text = "검색한 자료가 없습니다."
        // }
        
        let index = keywords.firstIndex(of: keyword)
        if let idx = index {
            mainLabel.text = value[idx]
        } else {
            mainLabel.text = "검색한 자료가 없습니다."
        }
    }
    
    @IBAction func recommandButtonClicked(_ sender: UIButton) {
        inputTextField.text = sender.currentTitle
        searchButtonClicked(searchButton)
    }
    
    @IBAction func tapGestureRecognizerClicked(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func setRecommandButton() {
        var list = Set<String>()
        
        while list.count != 3 {
            let randomData = key.randomElement()!
            list.insert(randomData)
        }
        let keywordList = Array(list)
        
        firstButton.setTitle(keywordList[0], for: .normal)
        secondButton.setTitle(keywordList[1], for: .normal)
        thirdButton.setTitle(keywordList[2], for: .normal)
    }
    
    @IBAction func returnKeyClicked(_ sender: UITextField) { }
    
    func designUI() {
        mainLabel.text = ""
        
        inputTextField.layer.borderColor = UIColor.black.cgColor
        inputTextField.layer.borderWidth = 2
        inputTextField.returnKeyType = .done
        
        designButton(button: firstButton)
        designButton(button: secondButton)
        designButton(button: thirdButton)
    }
    
    func designButton(button: UIButton) {
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
    }

}

