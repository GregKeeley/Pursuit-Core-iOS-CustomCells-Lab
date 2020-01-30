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
        setupNameLabelConstraints()
        setupUserNameLabelConstraints()
//        setupEmailConstraints()
//        setupAgeLabelConstraints()
//        setupLocationLabelConstraints()
//        setupPhoneNumberLabelConstraints()
    }
    private func setupUserImageConstraints() {
        addSubview(userImageView)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            userImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            userImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            userImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
            
        ])
    }
    //nameLabel
    private func setupNameLabelConstraints() {
        addSubview(nameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            nameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
        
        ])
    }
    //userNameLabel
    private func setupUserNameLabelConstraints() {
        addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

            userNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)

        ])
    }
//    //locationLabel
//    private func setupLocationLabelConstraints() {
//        addSubview(locationLabel)
//        locationLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//
//            locationLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
//            locationLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
//
//        ])
//    }
//    //phoneNumberLabel
//    private func setupPhoneNumberLabelConstraints() {
//        addSubview(phoneNumberLabel)
//        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//
//            phoneNumberLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
//            phoneNumberLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
//
//        ])
//    }
//    //emailLabel
//    private func setupEmailConstraints() {
//        addSubview(emailLabel)
//        emailLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//
//            emailLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10),
//            emailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
//
//        ])
//    }
//    //ageLabel
//    private func setupAgeLabelConstraints() {
//        addSubview(ageLabel)
//        ageLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//
//            ageLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
//            ageLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
//
//        ])
//    }
}
