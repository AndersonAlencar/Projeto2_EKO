//
//  ProfileViewController.swift
//  EKO
//
//  Created by Anderson Bezerra on 16/06/22.
//

import UIKit

class ArtistViewController: UIViewController {
    
    private lazy var imageProfile: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.image = UIImage(named: "foto3")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var acessoryView: UIView = {
        let acessoryView = UIView()
        acessoryView.backgroundColor = .black.withAlphaComponent(0.5)
        acessoryView.translatesAutoresizingMaskIntoConstraints = false
        return acessoryView
    }()
    
    private lazy var artistTag: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoItalic-Bold", size: 14)
        title.text = "Artista"
        title.layer.cornerRadius = 12
        title.clipsToBounds = true
        title.backgroundColor = .brownEKO
        title.textAlignment = .center
        title.textColor = .magenta2EKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var nameProfile: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-Bold", size: 32)
        title.text = "Araquém Aráuna"
        title.textAlignment = .center
        title.textColor = .magenta2EKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var descriptionProfile: UILabel = {
        let descriptionProfile = UILabel()
        descriptionProfile.font = UIFont(name: "ArchivoItalic-Regular", size: 16)
        descriptionProfile.numberOfLines = 0
        descriptionProfile.text = "Povo Kayapó, 25 anos - Ele/Dele"
        descriptionProfile.textColor = .magentaEKO
        descriptionProfile.textAlignment = .center
        descriptionProfile.translatesAutoresizingMaskIntoConstraints = false
        return descriptionProfile
    }()
    
    private lazy var followButton: UIButton = {
        let followButton = UIButton()
        followButton.setTitle("seguindo", for: .normal)
        followButton.backgroundColor = .clear
        followButton.layer.borderColor = UIColor.magentaEKO.cgColor
        followButton.layer.borderWidth = 3
        followButton.layer.cornerRadius = 15
        followButton.clipsToBounds = true
        followButton.setTitleColor(.magentaEKO, for: .normal)
        followButton.titleLabel?.font = UIFont(name: "ArchivoRoman-Light", size: 14)
        followButton.translatesAutoresizingMaskIntoConstraints = false
        return followButton
    }()
    
    private lazy var favoriteLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-ExtraBold", size: 24)//UIFont.systemFont(ofSize: 24, weight: .regular)
        title.numberOfLines = 0
        title.text = "DESTAQUES"
        title.textColor = .redEKO
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
    
    private lazy var artistLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-ExtraBold", size: 24)
        title.numberOfLines = 0
        title.text = "OBRAS"
        title.textColor = .redEKO
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
    
    private lazy var collectionViewWorkArtist: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout2)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(WorkArtCollectionViewCell.self, forCellWithReuseIdentifier: "artistItem")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
    
    override func viewWillLayoutSubviews() {
        acessoryView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20)
    }
}

extension ArtistViewController: ViewCode {
    func configureViews() {
        view.backgroundColor = .magentaEKO
        self.tabBarController?.tabBar.items![2].image = UIImage(named: "profile")
        self.tabBarController?.tabBar.items![2].selectedImage = UIImage(named: "profileSelected")
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func buildViewHierarchy() {
        view.addSubview(imageProfile)
        view.addSubview(acessoryView)
        view.addSubview(artistTag)
        view.addSubview(nameProfile)
        view.addSubview(followButton)
        view.addSubview(descriptionProfile)
        view.addSubview(favoriteLabel)
        view.addSubview(collectionViewFavorite)
        view.addSubview(artistLabel)
        view.addSubview(collectionViewWorkArtist)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageProfile.topAnchor.constraint(equalTo: view.topAnchor),
            imageProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageProfile.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageProfile.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.415)
        ])
        
        NSLayoutConstraint.activate([
            acessoryView.bottomAnchor.constraint(equalTo: imageProfile.bottomAnchor),
            acessoryView.leadingAnchor.constraint(equalTo: imageProfile.leadingAnchor),
            acessoryView.trailingAnchor.constraint(equalTo: imageProfile.trailingAnchor),
            acessoryView.heightAnchor.constraint(equalTo: imageProfile.heightAnchor, multiplier: 0.26)
        ])
        
        NSLayoutConstraint.activate([
            artistTag.centerYAnchor.constraint(equalTo: acessoryView.topAnchor),
            artistTag.centerXAnchor.constraint(equalTo: acessoryView.centerXAnchor),
            artistTag.widthAnchor.constraint(equalToConstant: 115),
            artistTag.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            nameProfile.leadingAnchor.constraint(equalTo: acessoryView.leadingAnchor),
            nameProfile.trailingAnchor.constraint(equalTo: acessoryView.trailingAnchor),
            nameProfile.topAnchor.constraint(equalTo: acessoryView.topAnchor, constant: 14)
        ])
        
        NSLayoutConstraint.activate([
            followButton.centerYAnchor.constraint(equalTo: acessoryView.centerYAnchor, constant: 20),
            followButton.trailingAnchor.constraint(equalTo: acessoryView.trailingAnchor, constant: -12),
            followButton.widthAnchor.constraint(equalToConstant: 75),
            followButton.heightAnchor.constraint(equalToConstant: 31)
        ])
        
        NSLayoutConstraint.activate([
            descriptionProfile.leadingAnchor.constraint(equalTo: acessoryView.leadingAnchor),
            descriptionProfile.trailingAnchor.constraint(equalTo: acessoryView.trailingAnchor),
            descriptionProfile.topAnchor.constraint(equalTo: nameProfile.bottomAnchor, constant: 5),
            descriptionProfile.bottomAnchor.constraint(lessThanOrEqualTo: acessoryView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            favoriteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            favoriteLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            favoriteLabel.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            collectionViewFavorite.topAnchor.constraint(equalTo: favoriteLabel.bottomAnchor, constant: 11),
            collectionViewFavorite.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewFavorite.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewFavorite.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            artistLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            artistLabel.topAnchor.constraint(equalTo: collectionViewFavorite.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            collectionViewWorkArtist.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 11),
            collectionViewWorkArtist.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewWorkArtist.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewWorkArtist.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
}

extension ArtistViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewFavorite {
            return CGSize(width: 160, height: 180)
        }
        return CGSize(width: 190, height: 170)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}

extension ArtistViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewFavorite {
            return 10
        } else if collectionView == self.collectionViewWorkArtist {
            return 8
        }
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewFavorite {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteItem", for: indexPath) as? CategoryItemCollectionViewCell else { return UICollectionViewCell()}
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "artistItem", for: indexPath) as? WorkArtCollectionViewCell else { return UICollectionViewCell()}
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("slecionado")
    }
}
