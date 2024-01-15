//
//  ViewController.swift
//  SeSAC_Assignment_0109
//
//  Created by 이중엽 on 1/9/24.
//

import UIKit

enum CityType: Int {
    case all
    case domestic
    case overseas
    
    var segment: String {
        switch self {
        case .all:
            return "모두"
        case .domestic:
            return "국내"
        case .overseas:
            return "해외"
        }
    }
}

class ViewController: UIViewController {
    
    static var identifier: String = "ViewController"
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerTitleLabel: UILabel!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var headerSegmentControl: UISegmentedControl!
    @IBOutlet var cityCollectionView: UICollectionView!
    var filteredData: [City] = [] {
        didSet { cityCollectionView.reloadData() }
    }
    var keyword: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        searchBar.delegate = self
    }
    
    @objc func segmentControlClicked(_ sender: UISegmentedControl) {
        self.cityCollectionView.reloadData()
    }
    
    func getCityListBySegmentState() -> [City] {
        var list: [City] = Storage.shared.getCityAllList()
        
        let currentPick = CityType(rawValue: headerSegmentControl.selectedSegmentIndex)
        
        switch currentPick {
        case .domestic:
            list = Storage.shared.getDomesticCityList()
        case .overseas:
            list = Storage.shared.getOverseasCityList()
        default: break
        }
        
        return list
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var list = getCityListBySegmentState()
        
        if !filteredData.isEmpty {
            list = filteredData
        }
        
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as? CityCollectionViewCell else { return UICollectionViewCell() }
        
        var list = getCityListBySegmentState()
        
        if !filteredData.isEmpty {
            list = filteredData
            
            
        }
        
        let cityInfo = list[indexPath.item]
        cell.setData(cityInfo)
        
        DispatchQueue.main.async {
            cell.cityImageView.layer.cornerRadius = cell.cityImageView.frame.width / 2
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailStoryboard = UIStoryboard(name: DetailViewController.identifier, bundle: nil)
        guard let nextVC = detailStoryboard.instantiateViewController(identifier: DetailViewController.identifier) as? DetailViewController else { return }
        
        let navigationVC = UINavigationController(rootViewController: nextVC)
        navigationVC.modalPresentationStyle = .fullScreen
        
        present(navigationVC, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var cityList = getCityListBySegmentState()
        var filter: [City] = []
        let text = searchText.uppercased()
        
        for city in cityList {
            if city.city_english_name.uppercased().contains(text) || city.city_explain.uppercased().contains(text) || city.city_name.uppercased().contains(text) {
                filter.append(city)
            }
        }
        
        self.filteredData = filter
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var cityList = getCityListBySegmentState()
        var filter: [City] = []
        let text = searchBar.text!.uppercased()
        
        for city in cityList {
            if city.city_english_name.uppercased().contains(text) || city.city_explain.uppercased().contains(text) || city.city_name.uppercased().contains(text) {
                filter.append(city)
            }
        }
        
        self.filteredData = filter
    }
}

extension ViewController: ViewProtocol {
    func configureUI() {
        self.view.backgroundColor = .white
        
        // 헤더 뷰
        headerView.backgroundColor = .white
        
        headerTitleLabel.setLabel(text: "인기도시", font: .Bold, fontSize: 17)
        
        let segmentNameList = ["모두", "국내", "해외"]
        for idx in 0 ..< headerSegmentControl.numberOfSegments {
            headerSegmentControl.setTitle(segmentNameList[idx], forSegmentAt: idx)
            headerSegmentControl.backgroundColor = .black
            headerSegmentControl.addTarget(self, action: #selector(segmentControlClicked(_:)), for: .valueChanged)
        }
        
        // 콜렉션 뷰
        DispatchQueue.main.async {
            self.cityCollectionView.backgroundColor = .white
            
            let layout = UICollectionViewFlowLayout()
            
            let width = self.cityCollectionView.frame.width
            let insetSpacing: CGFloat = Const.Spacing.insetSpacing
            let interSpacing: CGFloat = Const.Spacing.interSpacing
            let lineSpacing: CGFloat = Const.Spacing.lineSpacing
            let row: CGFloat = Const.Spacing.row
            let itemWidth = width - (2 * insetSpacing) - ((row - 1) * interSpacing)
            
            layout.itemSize = CGSize(width: itemWidth / row, height: 250)
            layout.minimumLineSpacing = lineSpacing
            layout.minimumInteritemSpacing = interSpacing
            layout.sectionInset = UIEdgeInsets(top: insetSpacing, left: insetSpacing, bottom: insetSpacing, right: insetSpacing)
            
            self.cityCollectionView.collectionViewLayout = layout
            
            let xib = UINib(nibName: CityCollectionViewCell.identifier, bundle: nil)
            self.cityCollectionView.register(xib, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
            self.cityCollectionView.delegate = self
            self.cityCollectionView.dataSource = self
        }
    }
}
