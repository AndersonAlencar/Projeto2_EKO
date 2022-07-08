//
//  ProfileViewController.swift
//  EKO
//
//  Created by Anderson Bezerra on 16/06/22.
//

import UIKit

struct ArtistModel {
    let name: String
    let imageProfile: String
    let description: String
}

class ProfileViewController: UIViewController {
    
    let favoriteModel = [
        MainModel(imageName: "moda6", artist: "Cymeíma", subtitle: "Moda", imageProfileArtist: "foto5"),
        MainModel(imageName: "pintura10", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6"),
        MainModel(imageName: "pintura5", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6"),
        MainModel(imageName: "pintura4", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6"),
        MainModel(imageName: "artesanato3", artist: "Baraúna Coaraci", subtitle: "Artesanato", imageProfileArtist: "kayapo")
    ]
    
    let artistModel = [
        ArtistModel(name: "Baraúna Coaraci", imageProfile: "kayapo", description: "Povo Kayapó, 25 anos"),
        ArtistModel(name: "Araquém Aráuna", imageProfile: "foto3", description: "Kayapó, 32 anos"),
        ArtistModel(name: "Cymeíma", imageProfile: "foto5", description: "45 anos, Ele/Dele"),
        ArtistModel(name: "Mekrãgnoti", imageProfile: "foto6", description: "Povo Kayapó, 29 anos")
    ]
    
    private lazy var imageProfile: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.image = UIImage(named: "profileUser")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var acessoryView: UIView = {
        let acessoryView = UIView()
        acessoryView.backgroundColor = .black.withAlphaComponent(0.5)
        acessoryView.translatesAutoresizingMaskIntoConstraints = false
        return acessoryView
    }()
    
    private lazy var nameProfile: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-Bold", size: 32)//UIFont.systemFont(ofSize: 32, weight: .bold)
        title.text = "Cymeima Aráuna"
        title.textAlignment = .center
        title.textColor = .magenta2EKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var descriptionProfile: UILabel = {
        let descriptionProfile = UILabel()
        descriptionProfile.font = UIFont(name: "ArchivoRoman-Bold", size: 20)//UIFont.systemFont(ofSize: 20, weight: .bold)
        descriptionProfile.numberOfLines = 0
        descriptionProfile.text = "25 anos, Ele/Dele "
        descriptionProfile.textColor = .magentaEKO
        descriptionProfile.textAlignment = .center
        descriptionProfile.translatesAutoresizingMaskIntoConstraints = false
        return descriptionProfile
    }()
    
    private lazy var editProfileButton: UIButton = {
        let editProfile = UIButton()

        editProfile.setImage(UIImage(named: "editButton"), for: .normal)
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
        title.font = UIFont(name: "ArchivoRoman-ExtraBold", size: 24)//UIFont.systemFont(ofSize: 24, weight: .regular)
        title.numberOfLines = 0
        title.text = "FAVORITOS"
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
        title.font = UIFont(name: "ArchivoRoman-ExtraBold", size: 24)//UIFont.systemFont(ofSize: 24, weight: .regular)
        title.numberOfLines = 0
        title.text = "Artistas Visitados"
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
    
    override func viewWillLayoutSubviews() {
        acessoryView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20)
    }
}

extension ProfileViewController: ViewCode {
    func configureViews() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background1.jpeg")!)
        self.tabBarController?.tabBar.items![2].image = UIImage(named: "profile")
        self.tabBarController?.tabBar.items![2].selectedImage = UIImage(named: "profileSelected")
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func buildViewHierarchy() {
        view.addSubview(imageProfile)
        view.addSubview(acessoryView)
        view.addSubview(nameProfile)
        view.addSubview(descriptionProfile)
        view.addSubview(editProfileButton)
        view.addSubview(favoriteLabel)
        view.addSubview(collectionViewFavorite)
        view.addSubview(artistLabel)
        view.addSubview(collectionViewArtist)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageProfile.topAnchor.constraint(equalTo: view.topAnchor),
            imageProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -2),
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
            nameProfile.leadingAnchor.constraint(equalTo: acessoryView.leadingAnchor),
            nameProfile.trailingAnchor.constraint(equalTo: acessoryView.trailingAnchor),
            nameProfile.topAnchor.constraint(equalTo: acessoryView.topAnchor, constant: 14)
        ])
        
        NSLayoutConstraint.activate([
            descriptionProfile.leadingAnchor.constraint(equalTo: acessoryView.leadingAnchor),
            descriptionProfile.trailingAnchor.constraint(equalTo: acessoryView.trailingAnchor),
            descriptionProfile.topAnchor.constraint(equalTo: nameProfile.bottomAnchor, constant: 5),
            descriptionProfile.bottomAnchor.constraint(lessThanOrEqualTo: acessoryView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            editProfileButton.bottomAnchor.constraint(equalTo: acessoryView.topAnchor, constant: 20),
            editProfileButton.trailingAnchor.constraint(equalTo: acessoryView.trailingAnchor, constant: -13),
            editProfileButton.widthAnchor.constraint(equalToConstant: 40),
            editProfileButton.heightAnchor.constraint(equalToConstant: 40)
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
            collectionViewFavorite.heightAnchor.constraint(equalToConstant: 175)
        ])
        
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            artistLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            artistLabel.topAnchor.constraint(equalTo: collectionViewFavorite.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            collectionViewArtist.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 11),
            collectionViewArtist.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewArtist.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewArtist.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewFavorite {
            return CGSize(width: 160, height: 175)
        }
        return CGSize(width: 100, height: 160)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewFavorite {
            return favoriteModel.count
        } else if collectionView == self.collectionViewArtist {
            return artistModel.count
        }
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewFavorite {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteItem", for: indexPath) as? CategoryItemCollectionViewCell else { return UICollectionViewCell()}
            let model  = favoriteModel[indexPath.row]
            cell.setupCell(title: model.artist, subTitle: model.subtitle, image: model.imageName)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "artistItem", for: indexPath) as? ArtistCollectionViewCell else { return UICollectionViewCell()}
            let model  = artistModel[indexPath.row]
            cell.setup(name: model.name, image: model.imageProfile)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewArtist {
            let controller = ArtistViewController()
            let model = artistModel[indexPath.row]
            controller.setup(name: model.name, description: model.description, image: model.imageProfile)
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = SelectedPostViewController()
            let model = favoriteModel[indexPath.row]
            controller.setup(category: model.subtitle, artistName: model.artist, artistDescription: "Povo Kayapó", image: model.imageName, artistImage: model.imageProfileArtist!)
            present(controller, animated: true)
        }
    }
}
