//
//  ProfileEditView.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/11/24.
//

import UIKit
import SnapKit

class ProfileEditView: UIView {
    
    let profileImageView = UIImageView()
    let profileCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    static func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNum, _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / 3.0),
                                                  heightDimension: .fractionalWidth(1.0 / 3.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        }
    }
}

extension ProfileEditView: ViewProtocol {
    func configureHierarchy() {
        [profileImageView, profileCollectionView].forEach {
            self.addSubview($0)
        }
    }
    
    func configureLayout() {
        profileImageView.snp.makeConstraints {
            $0.top.centerX.equalTo(self.safeAreaLayoutGuide)
            $0.width.equalTo(self).dividedBy(4)
            $0.height.equalTo(self.snp.width).dividedBy(4)
        }
        
        profileCollectionView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.horizontalEdges.bottom.equalTo(self)
        }
    }
    
    func configureView() {
        self.backgroundColor = .black
        self.profileCollectionView.backgroundColor = .black
        profileImageView.backgroundColor = .white
        
        DispatchQueue.main.async{
            self.profileImageView.backgroundColor = .lightGray
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
            self.profileImageView.clipsToBounds = true
            self.profileImageView.layer.masksToBounds = true
        }
        
        if UserDefaultsManager.shared.image.isEmpty {
            let profileImage = UIImage(systemName: "person.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            self.profileImageView.image = profileImage
            self.profileImageView.contentMode = .scaleAspectFill
        } else {
            let profileImage = UserDefaultsManager.shared.image
            let imageURL = URL(string: profileImage)
            profileImageView.kf.setImage(with: imageURL)
        }
    }
}
