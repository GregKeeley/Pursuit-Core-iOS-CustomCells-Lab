//
//  UserDetailView.swift
//  ProgrammaticUserCells
//
//  Created by Gregory Keeley on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class UserDetailView: UIView {
    
    public lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    public lazy var locationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    public lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    public lazy var ageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        setupUserImageConstraints()
    }
    private func setupUserImageConstraints() {
        addSubview(userImageView)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            userImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            userImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            userImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: 0.40)
            
        ])
    }
}
