//
//  ProfileEditViewController.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/11/24.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    var imageList: [NaverItem] = [] {
        didSet {
            view().profileCollectionView.reloadData()
        }
    }
    
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
    
    func view() -> ProfileEditView {
        guard let view = self.view as? ProfileEditView else { return ProfileEditView() }
        return view
    }

}

extension ProfileEditViewController: ViewProtocol {
    func configureHierarchy() {
        
    }
    
    func configureLayout() {
        
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
    
    
}
