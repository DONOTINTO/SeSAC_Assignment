//
//  ProfileEditViewController.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/11/24.
//

import UIKit
import SnapKit

class ProfileEditViewController: UIViewController {
    
    var imageList: [NaverItem] = [] {
        didSet {
            view().profileCollectionView.reloadData()
        }
    }
    var link: String?
    var complete: ((String) -> Void)?
    
    override func loadView() {
        self.view = ProfileEditView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureView()
        
        APIManager.shared.callNaverAPI(type: NaverImage.self, queryItem: "puppy", api: NaverAPI.image) { data, error in
            if error != nil { return }
            guard let data = data?.items else { return }
            
            self.imageList = data
        }
    }
    
    @objc func saveButtonClicked(_ sender: UIBarButtonItem) {
        
        if let link {
            if let complete {
                complete(link)
            }
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func view() -> ProfileEditView {
        guard let view = self.view as? ProfileEditView else { return ProfileEditView() }
        return view
    }

}

extension ProfileEditViewController: ViewProtocol {
    func configureHierarchy() {
        
    }
    
    func configureLayout() {
        let saveBarButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(saveButtonClicked(_:)))
        
        self.navigationItem.rightBarButtonItem = saveBarButton
    }
    
    func configureView() {
        view().profileCollectionView.dataSource = self
        view().profileCollectionView.delegate = self
        view().profileCollectionView.register(ProfileImageCollectionViewCell.self, forCellWithReuseIdentifier: ProfileImageCollectionViewCell.identifier)
    }
}

extension ProfileEditViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCollectionViewCell.identifier, for: indexPath) as? ProfileImageCollectionViewCell else { return UICollectionViewCell() }
        
        if let link = imageList[indexPath.row].link {
            cell.setImage(link: link)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let myIndexPath = IndexPath(row: indexPath.row, section: indexPath.section)
        guard let item = collectionView.cellForItem(at: myIndexPath) as? ProfileImageCollectionViewCell else { return }
        
        guard let link = item.link else { return }
        self.link = link
        let url = URL(string: link)
        view().profileImageView.kf.setImage(with: url)
    }
}
