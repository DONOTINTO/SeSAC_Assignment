//
//  ViewController.swift
//  SeSAC01.02_SB_HW
//
//  Created by 이중엽 on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageStackView: [UIStackView]!
    @IBOutlet var labelStackView: [UIStackView]!
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var labels: [UILabel]!
    var labelTitle = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "행복해", "눈물나"]
    var count = [Int].init(repeating: 0, count: 9)
    let COUNTKEY = ["COUNT1", "COUNT2", "COUNT3", "COUNT4", "COUNT5", "COUNT6", "COUNT7", "COUNT8", "COUNT9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for idx in 0 ..< COUNTKEY.count { count[idx] = UserDefaults.standard.integer(forKey: COUNTKEY[idx]) }
        
        setUI()
        setTapGesture()
    }
    
    @objc func imageViewClicked(_ sender: UITapGestureRecognizer) {
        guard let image = sender.view as? UIImageView else { return }
        let idx = image.tag
        
        count[idx] = UserDefaults.standard.integer(forKey: COUNTKEY[idx]) + 1
        UserDefaults.standard.setValue(count[idx], forKey: COUNTKEY[idx])
        
        labels[idx].text = "\(labelTitle[idx]) \(count[idx])"
        
        UIView.animate(withDuration: 0.03, delay: 0, options: .autoreverse , animations: {
            image.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }, completion: { _ in
            image.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        
        if labels[idx].tag == 10 {
            let alert = UIAlertController(title: "히든미션", message: "\(labelTitle[idx]) 10회 클릭하기", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "달성", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
    
    func setTapGesture() {
        imageViews.forEach {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewClicked(_:)))
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(tapGesture)
        }
    }

    func setUI() {
        imageStackView.forEach {
            $0.distribution = .fillEqually
            $0.spacing = 10
        }
        
        labelStackView.forEach {
            $0.distribution = .fillEqually
            $0.spacing = 10
        }
        
        for idx in 0 ..< imageViews.count {
            imageViews[idx].image = UIImage(named: "slime\(idx + 1)")
            //image View Tag에 인덱스 넘버 저장하여 사용
            imageViews[idx].tag = idx
        }
        
        for idx in 0 ..< labels.count {
            let count = UserDefaults.standard.integer(forKey: COUNTKEY[idx])
            labels[idx].text = "\(labelTitle[idx]) \(count)"
            labels[idx].textAlignment = .center
            labels[idx].font = .boldSystemFont(ofSize: 12)
            labels[idx].textColor = .black
        }
    }
}

