//
//  NaverWebtoonViewController.swift
//  newlyCoinedWord_SB_HW
//
//  Created by 이중엽 on 12/31/23.
//

import UIKit

enum FontType {
    case BOLD, LIGHT
}

class NaverWebtoonViewController: UIViewController {
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var thumbnailImageViews: [UIImageView]!
    @IBOutlet var titleLabels: [UILabel]!
    @IBOutlet var nameLabels: [UILabel]!
    @IBOutlet var rateLabels: [UILabel]!
    @IBOutlet var infoLabels: [UILabel]!
    @IBOutlet var infoStackView: UIStackView!
    @IBOutlet var upImageViews: [UIImageView]!
    @IBOutlet var recommandView: UIView!
    @IBOutlet var recommandTitleLabel: UILabel! 
    @IBOutlet var recommandNameLabel: UILabel!
    var data: [(thumbnail: String, title: String, name: String, rate: String)] = [
        (thumbnail: "thumbnail1", title: "화산귀환", name: "Luci / 비기", rate: "★9.93"),
        (thumbnail: "thumbnail2", title: "전지적 독자 시점", name: "UMI / 슬리피-C / 싱숑", rate: "★9.94"),
        (thumbnail: "thumbnail3", title: "백XX", name: "박태준 만화회사 / 병장 / 펀치킥", rate: "★9.85"),
        // (thumbnail: "thumbnail4", title: "12시네점심", name: "조석", rate: "★9.87"),
        (thumbnail: "thumbnail5", title: "일렉시드", name: "손제호 / 제나", rate: "★9.84"),
        (thumbnail: "thumbnail6", title: "나쁜사람", name: "둠스", rate: "★9.68"),
        (thumbnail: "thumbnail7", title: "무직백수 계백순", name: "지발", rate: "★9.87"),
        (thumbnail: "thumbnail8", title: "헬퍼", name: "삭", rate: "★8.62"),
        (thumbnail: "thumbnail9", title: "별을 품은 소드마스터", name: "홍대의 / 주노 / Q10", rate: "★9.96")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
        setData()
        
        infoLabels.forEach {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(infoLabelTapped(_:)))
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    @objc func infoLabelTapped(_ sender: UITapGestureRecognizer) {
        guard let label = sender.view as? UILabel else { return }
        
        setData()
        
        infoLabels.forEach {
            label == $0 ? designLabel($0, fontType: .BOLD, fontSize: 14, textColor: .systemGreen) : designLabel($0, fontType: .LIGHT, fontSize: 14, textColor: .white)
        }
        
        label.text == getWeek() ? upImageViews.forEach { $0.isHidden = false } : upImageViews.forEach { $0.isHidden = true }
    }
    
    func designUI() {
        thumbnailImageViews.forEach {
            $0.layer.cornerRadius = 5
            $0.contentMode = .scaleAspectFit
        }
        upImageViews.forEach {
            $0.isHidden = false
        }
        recommandView.backgroundColor = .systemIndigo
        recommandView.layer.cornerRadius = 10
        
        infoStackView.spacing = 6
        
        recommandTitleLabel.text = data[2].title
        recommandNameLabel.text = data[2].name
        designLabel(recommandTitleLabel, fontType: .BOLD, fontSize: 20, textColor: .white)
        designLabel(recommandNameLabel, fontType: .LIGHT, fontSize: 12, textColor: .lightGray)
        designLabel(titleLabels, fontType: .BOLD, fontSize: 12, textColor: .white)
        designLabel(nameLabels, fontType: .LIGHT, fontSize: 10, textColor: .lightGray)
        designLabel(rateLabels, fontType: .LIGHT, fontSize: 10, textColor: .lightGray)
        designLabel(infoLabels, fontType: .LIGHT, fontSize: 14, textColor: .white, alignment: .center)
        infoLabels.forEach {
            $0.text == getWeek() ? designLabel($0, fontType: .BOLD, fontSize: 14, textColor: .systemGreen) : designLabel($0, fontType: .LIGHT, fontSize: 14, textColor: .white)
        }
        //setContentCompressionResistancePriority 더 알아보기
        rateLabels.forEach {
            $0.setContentCompressionResistancePriority(UILayoutPriority(751), for: .horizontal)
        }
        
        mainScrollView.bouncesZoom = false
        mainScrollView.bounces = false
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.showsHorizontalScrollIndicator = false
    }
    
    func designLabel(_ labels: [UILabel], fontType: FontType, fontSize: CGFloat, textColor: UIColor, alignment: NSTextAlignment = .left) {
        labels.forEach {
            $0.font = fontType == .BOLD ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
            $0.textColor = textColor
            $0.textAlignment = alignment
        }
    }
    
    func designLabel(_ label: UILabel, fontType: FontType, fontSize: CGFloat, textColor: UIColor) {
        label.font = fontType == .BOLD ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
        label.textColor = textColor
    }
    
    func setData() {
        data.shuffle()
        
        for idx in 0 ..< thumbnailImageViews.count {
            thumbnailImageViews[idx].image = UIImage(named: data[idx].thumbnail)
            titleLabels[idx].text = data[idx].title
            nameLabels[idx].text = data[idx].name
            rateLabels[idx].text = data[idx].rate
        }
    }
    
    func getWeek() -> String {
        var date: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ko_KR")
            dateFormatter.dateFormat = "EEEEEE"
            return dateFormatter
        }
        
        return date.string(from: Date())
    }
}
