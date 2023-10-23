//
//  DetailViewController.swift
//  MVVM-iOS
//
//  Created by Bandit Silachai on 23/10/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModel?
    var titleLabel = UILabel()
    var nameLabel = UILabel()
    var emailLable = UILabel()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    func setupUI(){
        guard let name = viewModel?.name  else {return }
        guard let email = viewModel?.email  else {return }
        
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        view.addSubview(emailLable)
        view.addSubview(avatarImageView)
        
        nameLabel.text = "Name: \(name)"
        nameLabel.font = .systemFont(ofSize: 24, weight: .regular)
        
        
        emailLable.text = "Email: \(email)"
        emailLable.font = .systemFont(ofSize: 20, weight: .regular)
        
        titleLabel.text = "Detail"
        titleLabel.font = .systemFont(ofSize: 36, weight: .bold)
        
        if let avatarURL = viewModel?.avatar {
            // Load and display the avatar image from the provided URL
            loadAvatarImage(from: avatarURL)
        }

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLable.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let avatarWidthConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: 150)
        let avatarHeightConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: 150)
        
        // Add a constraint to center the avatarImageView horizontally
        let avatarCenterXConstraint = avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        // Add a constraint to place the avatarImageView at the bottom of the titleLabel
        let avatarBottomConstraint = avatarImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30)
        
        // Set the content mode to scaleAspectFill
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true // Ensure that the image is clipped to fit the frame.
        
        // Make the image view rounded
        avatarImageView.layer.cornerRadius = 75 // Half of the width/height to create a circle
        avatarImageView.layer.masksToBounds = true
        
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            avatarImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            avatarWidthConstraint,
            avatarHeightConstraint,
            avatarCenterXConstraint,
            avatarBottomConstraint,
            
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 30),
            emailLable.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            emailLable.leftAnchor.constraint(equalTo: nameLabel.leftAnchor)
        ])
    }
    
    func loadAvatarImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.avatarImageView.image = image
                }
            } else {
                // Handle the error or set a default image if the request fails.
            }
        }
        task.resume()
    }
}
