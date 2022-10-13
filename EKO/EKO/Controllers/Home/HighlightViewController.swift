//
//  HighlightViewController.swift
//  EKO
//
//  Created by Anderson Bezerra on 06/07/22.
//

import UIKit

final class HighlightViewController: UIViewController {
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "foto7")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var acessoryView: UIView = {
        let acessoryView = UIView()
        acessoryView.layer.cornerRadius = 20
        acessoryView.backgroundColor = .black.withAlphaComponent(0.5)
        acessoryView.translatesAutoresizingMaskIntoConstraints = false
        return acessoryView
    }()
    
    private lazy var artistImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.brownEKO.cgColor
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 45
        image.image = UIImage(named: "foto7")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var artistName: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-Bold", size: 20)
        title.text = "Cymeima Aráuna"
        title.textColor = .magenta2EKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var artistDescription: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-Light", size: 14)
        title.text = "Cymeima Aráuna"
        title.textColor = .magenta2EKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.font = UIFont(name: "ArchivoItalic-Bold", size: 16)
        categoryLabel.text = "Pintura Corporal"
        categoryLabel.layer.cornerRadius = 15
        categoryLabel.clipsToBounds = true
        categoryLabel.backgroundColor = .brownEKO
        categoryLabel.textAlignment = .center
        categoryLabel.textColor = .magenta2EKO
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        return categoryLabel
    }()
    
    private lazy var followButton: UIButton = {
        let followButton = UIButton()
        followButton.backgroundColor = .magenta2EKO
        followButton.layer.cornerRadius = 15
        followButton.clipsToBounds = true
        followButton.titleLabel?.font = UIFont(name: "ArchivoItalic-Bold", size: 18)
        followButton.setTitle("+ siga", for: .normal)
        followButton.setTitleColor(.redEKO, for: .normal)
        followButton.translatesAutoresizingMaskIntoConstraints = false
        return followButton
    }()
    
    private lazy var seeMoreButton: UIButton = {
        let followButton = UIButton()
        followButton.backgroundColor = .magenta2EKO
        followButton.layer.cornerRadius = 10
        followButton.clipsToBounds = true
        followButton.titleLabel?.font = UIFont(name: "ArchivoItalic-Bold", size: 16)
        followButton.setTitle("Ver mais", for: .normal)
        followButton.setTitleColor(.redEKO, for: .normal)
        followButton.addTarget(self, action: #selector(tapSeeMore), for: .touchUpInside)
        followButton.translatesAutoresizingMaskIntoConstraints = false
        return followButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }

    override func viewWillLayoutSubviews() {
        //acessoryView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }
    
    func setup(category: String, artistName: String, artistDescription: String, image: String, artistImage: String) {
        self.backgroundImage.image = UIImage(named: image)
        self.categoryLabel.text = category
        self.artistName.text = artistName
        self.artistDescription.text = artistDescription
        self.artistImage.image = UIImage(named: artistImage)
    }
    
    @objc
    func tapSeeMore() {
        let seeMoreController = SeeMoreViewController()
        present(seeMoreController, animated: true)
    }
}

extension HighlightViewController: ViewCode {
    func configureViews() {
        view.backgroundColor = .magentaEKO
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func buildViewHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(acessoryView)
        view.addSubview(artistImage)
        view.addSubview(artistName)
        view.addSubview(artistDescription)
        view.addSubview(categoryLabel)
        view.addSubview(followButton)
        view.addSubview(seeMoreButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            acessoryView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 15),
            acessoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            acessoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            acessoryView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        
        NSLayoutConstraint.activate([
            artistImage.centerYAnchor.constraint(equalTo: acessoryView.centerYAnchor),
            artistImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            artistImage.widthAnchor.constraint(equalToConstant: 90),
            artistImage.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            artistName.leadingAnchor.constraint(equalTo: artistImage.trailingAnchor, constant: 5),
            artistName.widthAnchor.constraint(equalToConstant: 190),
            artistName.centerYAnchor.constraint(equalTo: artistImage.centerYAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            artistDescription.topAnchor.constraint(equalTo: artistName.bottomAnchor, constant: 3),
            artistDescription.widthAnchor.constraint(equalToConstant: 190),
            artistDescription.leadingAnchor.constraint(equalTo: artistName.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: acessoryView.topAnchor),
            categoryLabel.centerXAnchor.constraint(equalTo: acessoryView.centerXAnchor),
            categoryLabel.widthAnchor.constraint(equalTo: acessoryView.widthAnchor, multiplier: 0.5),
            categoryLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            followButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13.71),
            followButton.centerYAnchor.constraint(equalTo: artistImage.centerYAnchor),
            followButton.widthAnchor.constraint(equalToConstant: 75),
            followButton.heightAnchor.constraint(equalToConstant: 31)
        ])
        
        NSLayoutConstraint.activate([
            seeMoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            seeMoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            seeMoreButton.widthAnchor.constraint(equalToConstant: 98),
            seeMoreButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
