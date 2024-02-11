//
//  ProfileView.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 2/9/24.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    let profileImageView = UIImageView()
    let profileEditLabel = UILabel()
    let profileTableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ProfileView: ViewProtocol {
    func configureHierarchy() {
        
        [profileImageView, profileEditLabel, profileTableView].forEach {
            self.addSubview($0)
        }
    }
    
    func configureLayout() {
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalTo(self)
            $0.width.equalTo(self).dividedBy(4)
            $0.height.equalTo(self.snp.width).dividedBy(4)
        }
        
        profileEditLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(15)
            $0.horizontalEdges.equalTo(self).inset(10)
            $0.height.equalTo(22)
        }
        
        profileTableView.snp.makeConstraints {
            $0.top.equalTo(profileEditLabel.snp.bottom).offset(20)
            $0.horizontalEdges.bottom.equalTo(self)
        }
    }
    
    func configureView() {
        
        DispatchQueue.main.async{
            self.profileImageView.backgroundColor = .lightGray
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
            self.profileImageView.clipsToBounds = true
        }
        
        if UserDefaultsManager.shared.image.isEmpty {
            let profileImage = UIImage(systemName: "person.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            self.profileImageView.image = profileImage
        } else {
            let profileImage = UserDefaultsManager.shared.image
            let imageURL = URL(string: profileImage)
            profileImageView.kf.setImage(with: imageURL)
        }
        
        profileEditLabel.text = "사진 수정"
        profileEditLabel.textColor = .systemBlue
        profileEditLabel.textAlignment = .center
        profileEditLabel.font = .systemFont(ofSize: 13, weight: .regular)
    }
}
