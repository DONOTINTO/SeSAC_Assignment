//
//  DetailViewController.swift
//  SeSAC_Assignment_0109
//
//  Created by 이중엽 on 1/11/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    static let identifier = "DetailViewController"
    
    @IBOutlet var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setTableViewInfo()
    }
    
    @objc func leftBarButtonClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        let idx = sender.tag
        Storage.shared.setTravelLike(idx)
        detailTableView.reloadData()
    }
    
    func setTableViewInfo() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        let detailCellXib = UINib(nibName: DetailTableViewCell.identifier, bundle: nil)
        detailTableView.register(detailCellXib, forCellReuseIdentifier: DetailTableViewCell.identifier)
        
        let adCellXib = UINib(nibName: ADTableViewCell.identifier, bundle: nil)
        detailTableView.register(adCellXib, forCellReuseIdentifier: ADTableViewCell.identifier)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.shared.getTravelList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let travelList = Storage.shared.getTravelList()
        let travelInfo = travelList[indexPath.row]
        
        if travelInfo.ad {
            guard let adCell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as? ADTableViewCell else { return UITableViewCell() }
            adCell.setInfo(travelInfo)
            
            return adCell
        } else {
            guard let detailCell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
            detailCell.setInfo(travelInfo)
            detailCell.likeButton.tag = indexPath.row
            detailCell.likeButton.addTarget(self, action: #selector(likeButtonClicked(_:)), for: .touchUpInside)
            
            return detailCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let travelList = Storage.shared.getTravelList()
        
        return travelList[indexPath.row].ad ? 100 : UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let travelList = Storage.shared.getTravelList()
        let travelInfo = travelList[indexPath.row]
        
        if travelInfo.ad {
            let detailSB = UIStoryboard(name: ThirdADViewController.identifier, bundle: nil)
            guard let nextVC = detailSB.instantiateViewController(withIdentifier: ThirdADViewController.identifier) as? ThirdADViewController else { return }
            
            self.navigationController?.pushViewController(nextVC, animated: true)
            
        } else {
            let detailSB = UIStoryboard(name: ThirdDetailViewController.identifier, bundle: nil)
            guard let nextVC = detailSB.instantiateViewController(withIdentifier: ThirdDetailViewController.identifier) as? ThirdDetailViewController else { return }
            nextVC.navigationItem.backBarButtonItem?.tintColor = .black
            
            self.navigationController?.pushViewController(nextVC, animated: true)
            
        }
    }
}

extension DetailViewController: ViewProtocol {
    func configureUI() {
        view.backgroundColor = .white
        detailTableView.backgroundColor = .white
        
        self.navigationItem.title = "도시 상세 정보"
        
        let button = UIButton(type: .system)
        let imageConfig = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "chevron.backward", withConfiguration: imageConfig)
        button.setTitle("인기 도시", for: .normal)
        button.setImage(image, for: .normal)
        button.sizeToFit()
        button.tintColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.addTarget(self, action: #selector(leftBarButtonClicked(_:)), for: .touchUpInside)
        let leftBarItem = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = leftBarItem
    }
}
