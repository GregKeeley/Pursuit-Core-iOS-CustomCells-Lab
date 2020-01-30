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
        detailView.nameLabel.text = ("\(user?.name.title)\(user?.name.first)\(user?.name.last)")
        detailView.ageLabel.text = ("DOB: \(user?.dob.date)Age: \(user?.dob.age)")
        detailView.emailLabel.text = ("Email Address:\(user?.email)")
        detailView.locationLabel.text = ("PLACEHOLDER")
        detailView.phoneNumberLabel.text = ("\(user?.phone)")
        detailView.userNameLabel.text = ("Username: \(user?.login.username)")
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
