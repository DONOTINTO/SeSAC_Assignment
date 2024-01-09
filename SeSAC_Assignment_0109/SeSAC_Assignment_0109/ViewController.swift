//
//  ViewController.swift
//  SeSAC_Assignment_0109
//
//  Created by 이중엽 on 1/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerTitleLabel: UILabel!
    @IBOutlet var headerLineView: UIView!
    @IBOutlet var headerSegmentControl: UISegmentedControl!
    @IBOutlet var cityCollectionView: UICollectionView!
    let cityInfoList: [City] = [
        City(city_name: "방콕", city_english_name: "Bangkok", city_explain: "방콕, 파타야, 후아힌, 코사멧, 코사무이", city_image: "https://i.namu.wiki/i/OUKHuXT-QXe-wDgGE_9hMfEW9Sb3lyMWl0SSbpTQyfl0Lw3rs_A_DuVyXBNXTFG3FUkfmy7hBjL68dgLzssEQg.webp", domestic_travel: false),
        City(city_name: "오사카", city_english_name: "Osaka", city_explain: "오사카, 교토, 고베, 나라", city_image: "https://i.namu.wiki/i/IyejHd9WlEd118tJq1coTwS4RpkaqIY0JhPbbiVX6WWpkkoWbLK-R4DkPg8GN4cLvm0RmhWuBTrY7HymFxoUhFY48GKKxnmzsXNu7VZBO2x1y9wsOizxOxb0ngLmTqjQeZVd4pgySwBDqRvoc9LYsw.webp", domestic_travel: false),
        City(city_name: "다낭", city_english_name: "Danang", city_explain: "다낭, 호이안, 후에", city_image: "https://i.namu.wiki/i/skBWgWUvf6QsFa_GV-falaAW6bO-g1FDlSTTL8AHZ-WfRdDVwpll5AR29N4oPl1H0SMqIAP87clppdEpmGdrwVEFAAT47BUVNCk02OrN9S7a1m3o4AKoEFO1UUTUvtO02mFV2tCOAz9l32hWwKDESA.webp", domestic_travel: false),
        City(city_name: "제주", city_english_name: "Jeju", city_explain: "제주, 섭지코지, 성산일출봉", city_image: "https://i.namu.wiki/i/nqsYz3MRqmLeTyfn2eYJ6mqriV9QzpeiibJH-TeoTVtdBlmQNHq_NaN1W0TSSpQGzdOgELdlutXXior-k7MOstBNO2uQ-JI1pjLFecNfBU5is8P4FTaRDGe95uGw1SEY-5x7SDXuLIcL_ZkXXg5n5Q.webp", domestic_travel: true),
        City(city_name: "부산", city_english_name: "Busan", city_explain: "부산, 해운대, 마린시티", city_image: "https://i.namu.wiki/i/ChOLr6xQTP_GEX3bn3aADywR6uqitf3qcrIn6gb_Xrd6oXEofXHSS9kezFOvdPQfsDrXSZG9rv3wPcmzAdg5aWsKFF9CKmzPadMSLeY8TtR-XOLkGIxA0gaoFG3tDyQobEEfdOwXtjoMuTpx1NGrbA.webp", domestic_travel: true),
        City(city_name: "파리", city_english_name: "Paris", city_explain: "파리, 베르사유, 몽생미셀, 스트라스부르", city_image: "https://i.namu.wiki/i/wc6IdjDNOFVBMcUOM5ZHLXEf8GXJ8Il1ODw2OMwaj4rrwetPT6bKzQ4fSM0PJgOHy-OBzfeAY3QEKpgTUY3vYQWW3QqG3X67SURJaFF9ejRnM5c-5DP8c_sIoQapUiCOdf0NnSzzbBpk5GYgNFy_qg.webp", domestic_travel: false),
        City(city_name: "시드니", city_english_name: "Sydney", city_explain: "시드니, 블루마운틴, 울릉공, 뉴캐슬", city_image: "https://i.namu.wiki/i/wUpNMYJ19X-xa_RO--yl9f17Mn1YTXGaE_dgBCYEdRaWSBQFgKngoEH29t2B__YR_B_YGpTOagI51X0XPIp9UWPtDE7gT-pPekRlQx6TWjBOxgmgjx2vDo0U6-mrXVoKVJOVEr99RLASIo1yVV4nMg.webp", domestic_travel: false),
        City(city_name: "전주", city_english_name: "Jeonju", city_explain: "전주, 한옥 마을, 오목대, 경기전", city_image: "https://i.namu.wiki/i/kTgE66pI-V9jxhv1LtYHrV7D8pxl235sTSTQT_V196jpDzNoQiFZ_TDx-TM7ZEuk4agrxMPHxVPdSAQykKb15HSM3w45zayebVV5ad0XRgqnU8I79-tCml1aNWUp5rlwKDrqHERUk1GhRfKQ9HZQqQ.webp", domestic_travel: true),
        City(city_name: "밀라노", city_english_name: "Milano", city_explain: "밀라노, 꼬모, 베로나, 베르가모, 시르미오네", city_image: "https://i.namu.wiki/i/MuwqS_NUm9LN3RVXoy3tJ3E4mNgLEig_RYlv2A6Cmj2-3yfIGz1uLFWyp5ui3IQSHk-jB3NZzmHkD2hKG_Efpz3ffA0-_Qk8Yfr-QtY8j1oQFQqyGvkQwyvVr8lLSj75CoJDqVYIsI8D0iSOG2Khnw.webp", domestic_travel: false),
        City(city_name: "리스본", city_english_name: "Lisbon", city_explain: "리스본, 신트라, 카스카이스, 오비두스", city_image: "https://i.namu.wiki/i/ofDtId7rfgbvVHFjIlteit-5guTlOAHZRt_KoRQWihjaPlQAJyiyPpHeo8PrbcucsKOJGHF4Bkgw9arMc73emoEcN-4BQtS-SMmB4F6YRTHHMlFZkYcNY4QLK6rf7keZBKxLjcLG9KxPnewNgWWeXQ.webp", domestic_travel: false),
        City(city_name: "서울", city_english_name: "Seoul", city_explain: "서울, 남산타워, 롯데타워, 경복궁", city_image: "https://i.namu.wiki/i/OqH4Z-L3mVvFW_LywHFnzml3B_VaaAYH9l96FYvND7IHGkIWnpPSTrKZVAOCpJ1-FqBkimHoJJGxyw-BCIfAc2S4DyNeNYGTE2g_cVFOAeu075px_eLHUD9aD9cQaS_SUtBy8H6eH-3gzFaoWbM0sw.webp", domestic_travel: true),
        City(city_name: "두바이", city_english_name: "Dubai", city_explain: "두바이, 아부다비, 알 아인", city_image: "https://i.namu.wiki/i/va-qL9TI8xsD41Z8NGdUPbyn0iE31CLC6kyo3zlKBS7oOEIQP-sbaTgt0AvidSB0qKEzjIimELccA7-P5uGO0cNvrA58GSGFCUDGrEeRN6DV-XOvWH6cx-PeGtaUHZNQGNenD6tjKaECf6T-0RyrnQ.webp", domestic_travel: false),
        City(city_name: "홍콩", city_english_name: "Hongkong", city_explain: "홍콩, 마카오", city_image: "https://i.namu.wiki/i/KZHwVRPLz9qWyNsltipcSqdZ1OIQ3hiM7C1GHp2jg1iiLxhgovAeXIY_DJEtZ8mUA3PJR-U0T3fbzcnmtqDFj-Tg9NIrdJe1rbi7ICAjVF9y4D1Km3XFLpQ7V4K7U2ANFH8CjF1yeh1XUmGT4IPJWQ.webp", domestic_travel: false),
        City(city_name: "토론토", city_english_name: "Toronto", city_explain: "토론토, 나이아가라, 킹스턴, 블루마운틴", city_image: "https://i.namu.wiki/i/I7os9ysTEyBl4sVe-9AN-dHFmJ95e0j3P03DIQiVwIrLOi_RAbo311TdKiRFb0LMyUkbhAPzASfH6JR25cVXj3vYNR2S9koQBZsWrEitWWRe855pPYigkUFUvXGDn1xTF2jxneC4NRl7zcRY5_iBRA.webp", domestic_travel: false),
        City(city_name: "대전", city_english_name: "Daejeon", city_explain: "대전, 성심당", city_image: "https://i.namu.wiki/i/fFklvoNy6HqB2XtGHad8aZ9zItaH-ow-H97JlYV5OvgYHWgOfjiL4OPB_7UWLbKdQhJXlIrxs1Q25WomVNz1McMgUZmlME4OpNOI1KUMrOkR05LWsoU7PfXLI_EOKZdy6PCx9Bu7JBNTLbDn8RvdQA.webp", domestic_travel: true),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
        
        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        
    }
    
    @objc func segmentControlClicked(_ sender: UISegmentedControl) {
        self.cityCollectionView.reloadData()
    }

    func designUI() {
        self.view.backgroundColor = .white
        
        // 헤더 뷰
        headerView.backgroundColor = .white
        
        headerTitleLabel.text = "인기 도시"
        headerTitleLabel.textColor = .black
        headerTitleLabel.textAlignment = .center
        headerTitleLabel.font = .boldSystemFont(ofSize: 17)
        
        headerLineView.backgroundColor = .init(white: 0, alpha: 0.3)
        
        let segmentNameList = ["모두", "국내", "해외"]
        for idx in 0 ..< headerSegmentControl.numberOfSegments {
            headerSegmentControl.setTitle(segmentNameList[idx], forSegmentAt: idx)
            headerSegmentControl.backgroundColor = .black
            headerSegmentControl.addTarget(self, action: #selector(segmentControlClicked(_:)), for: .valueChanged)
        }
        
        // 콜렉션 뷰
        cityCollectionView.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        let insetSpacing: CGFloat = Spacing.insetSpacing
        let interSpacing: CGFloat = Spacing.interSpacing
        let lineSpacing: CGFloat = Spacing.lineSpacing
        let row: CGFloat = Spacing.row
        let itemWidth = width - (2 * insetSpacing) - ((row - 1) * interSpacing)
        
        layout.itemSize = CGSize(width: itemWidth / row, height: 250)
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = interSpacing
        layout.sectionInset = UIEdgeInsets(top: insetSpacing, left: insetSpacing, bottom: insetSpacing, right: insetSpacing)
        
        cityCollectionView.collectionViewLayout = layout
    }
    
    func getDomesticCityList() -> [City] {
        return cityInfoList.filter { $0.domestic_travel == true }
    }
    
    func getOverseasCityList() -> [City] {
        return cityInfoList.filter { $0.domestic_travel == false }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var list: [City] = cityInfoList
        
        if case 1 = self.headerSegmentControl.selectedSegmentIndex {
            list = getDomesticCityList()
        } else if case 2 = self.headerSegmentControl.selectedSegmentIndex {
            list = getOverseasCityList()
        }
        
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as? CityCollectionViewCell else { return UICollectionViewCell() }
        
        var list: [City] = cityInfoList
        
        if case 1 = self.headerSegmentControl.selectedSegmentIndex {
            list = getDomesticCityList()
        } else if case 2 = self.headerSegmentControl.selectedSegmentIndex {
            list = getOverseasCityList()
        }
        
        let cityInfo = list[indexPath.item]
        cell.setData(cityInfo)
        
        return cell
    }
}
