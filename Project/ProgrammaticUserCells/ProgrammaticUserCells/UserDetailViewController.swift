//
//  UserDetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Gregory Keeley on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit
import ImageKit

class UserDetailViewController: UIViewController {
    private let detailView = UserDetailView()
    override func loadView() {
        view = detailView
    }
    public var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.backgroundColor = .darkGray
        loadUserData()
    }

    private func loadUserData() {
        
        let originalDOB = user?.dob.date
        
        
        detailView.nameLabel.text = ("\(user?.name.title ?? "")\(user?.name.first ?? "First name")\(user?.name.last ?? "Last name")")
        detailView.ageLabel.text = ("DOB: \(user?.dob.date ?? "N/A")Age: \(user?.dob.age ?? 666)")
        detailView.emailLabel.text = ("Email Address:\(user?.email ?? "N/A")")
        detailView.locationLabel.text = ("""
            \(user?.location.street.number ?? 123) \(user?.location.street.name ?? "Sesame Street")
            \(user?.location.city ?? "N/A"), \(user?.location.state ?? "N/A")
            \(user?.location.postcode ?? "N/A")
            """)
        detailView.phoneNumberLabel.text = ("Phone: \(user?.phone ?? "N/A")")
        detailView.userNameLabel.text = ("Username: \(user?.login.username ?? "N/A")")
        detailView.userImageView.getImage(with: (user?.picture.large)!) { (results) in
            switch results {
            case .failure(let appError):
                DispatchQueue.main.async {
                    print(appError)
                    self.detailView.userImageView.image = UIImage(named: "person.fill")
                }
            case .success(let imageData):
                DispatchQueue.main.async {
                    self.detailView.userImageView.image = imageData
                }
            }
        }
    }
    
}
