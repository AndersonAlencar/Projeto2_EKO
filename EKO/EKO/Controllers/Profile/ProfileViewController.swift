//
//  ProfileViewController.swift
//  EKO
//
//  Created by Anderson Bezerra on 16/06/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var imageProfile: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 70
        image.image = UIImage(named: "foto5")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameProfile: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-Bold", size: 32)//UIFont.systemFont(ofSize: 32, weight: .bold)
        title.text = "José Silva"
        title.textColor = .brown2EKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var descriptionProfile: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-Bold", size: 20)//UIFont.systemFont(ofSize: 20, weight: .bold)
        title.numberOfLines = 0
        title.text = "Ele/Dele 20 anos."
        title.textColor = .brown2EKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var editProfileButton: UIButton = {
        let editProfile = UIButton()

        editProfile.setImage(UIImage(named: "botaoEditPDF"), for: .normal)
        editProfile.translatesAutoresizingMaskIntoConstraints = false
        return editProfile
    }()
    
    private lazy var favoriteButton: UIButton = {
        let editProfile = UIButton()
        editProfile.setImage(UIImage(named: "heart"), for: .normal)
        editProfile.translatesAutoresizingMaskIntoConstraints = false
        return editProfile
    }()
    
    private lazy var favoriteLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-Regular", size: 24)//UIFont.systemFont(ofSize: 24, weight: .regular)
        title.numberOfLines = 0
        title.text = "Favoritos"
        title.textColor = .brown2EKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let sectionSpacing = 0
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()
    
    private lazy var collectionViewFavorite: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(CategoryItemCollectionViewCell.self, forCellWithReuseIdentifier: "favoriteItem")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var artistButton: UIButton = {
        let editProfile = UIButton()
        editProfile.setImage(UIImage(named: "artista"), for: .normal)
        editProfile.translatesAutoresizingMaskIntoConstraints = false
        return editProfile
    }()
    
    private lazy var artistLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-Regular", size: 24)//UIFont.systemFont(ofSize: 24, weight: .regular)
        title.numberOfLines = 0
        title.text = "Artistas Visitados"
        title.textColor = .brown2EKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var flowLayout2: UICollectionViewFlowLayout = {
        let sectionSpacing = 0
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()
    
    private lazy var collectionViewArtist: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout2)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(ArtistCollectionViewCell.self, forCellWithReuseIdentifier: "artistItem")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
}

extension ProfileViewController: ViewCode {
    func configureViews() {
        view.backgroundColor = .magentaEKO
        self.tabBarController?.tabBar.items![2].image = UIImage(named: "profile")
        self.tabBarController?.tabBar.items![2].selectedImage = UIImage(named: "profileSelected")
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func buildViewHierarchy() {
        view.addSubview(imageProfile)
        view.addSubview(nameProfile)
        view.addSubview(descriptionProfile)
        view.addSubview(editProfileButton)
        view.addSubview(favoriteButton)
        view.addSubview(favoriteLabel)
        view.addSubview(collectionViewFavorite)
        view.addSubview(artistButton)
        view.addSubview(artistLabel)
        view.addSubview(collectionViewArtist)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            imageProfile.widthAnchor.constraint(equalToConstant: 140),
            imageProfile.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            nameProfile.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 33),
            nameProfile.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameProfile.centerYAnchor.constraint(equalTo: imageProfile.centerYAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            descriptionProfile.leadingAnchor.constraint(equalTo: nameProfile.leadingAnchor),
            descriptionProfile.trailingAnchor.constraint(equalTo: nameProfile.trailingAnchor),
            descriptionProfile.topAnchor.constraint(equalTo: nameProfile.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            editProfileButton.topAnchor.constraint(equalTo: descriptionProfile.bottomAnchor, constant: 10),
            editProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29),
            editProfileButton.widthAnchor.constraint(equalToConstant: 32),
            editProfileButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 115),
            favoriteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            favoriteButton.widthAnchor.constraint(equalToConstant: 32),
            favoriteButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            favoriteLabel.leadingAnchor.constraint(equalTo: favoriteButton.trailingAnchor, constant: 10),
            favoriteLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            favoriteLabel.centerYAnchor.constraint(equalTo: favoriteButton.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            collectionViewFavorite.topAnchor.constraint(equalTo: favoriteLabel.bottomAnchor, constant: 23),
            collectionViewFavorite.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewFavorite.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewFavorite.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            artistButton.topAnchor.constraint(equalTo: collectionViewFavorite.bottomAnchor, constant: 30),
            artistButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            artistButton.widthAnchor.constraint(equalToConstant: 32),
            artistButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: artistButton.trailingAnchor, constant: 10),
            artistLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            artistLabel.centerYAnchor.constraint(equalTo: artistButton.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            collectionViewArtist.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 23),
            collectionViewArtist.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewArtist.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewArtist.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewFavorite {
            return CGSize(width: 160, height: 135)
        }
        return CGSize(width: 180, height: 160)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewFavorite {
            return 10
        } else if collectionView == self.collectionViewArtist {
            return 8
        }
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewFavorite {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteItem", for: indexPath) as? CategoryItemCollectionViewCell else { return UICollectionViewCell()}
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "artistItem", for: indexPath) as? ArtistCollectionViewCell else { return UICollectionViewCell()}
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = ArtistUIViewController()
        if indexPath.section == 0 {
            controller.title = "Aqui terá um Favorito"
        } else {
            controller.title = "Aqui terá um artista"
        }
        navigationController?.pushViewController(controller, animated: true)
    }
}
