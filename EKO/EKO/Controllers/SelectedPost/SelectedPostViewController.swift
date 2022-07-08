import UIKit

class SelectedPostViewController: UIViewController {

    private lazy var imageBanner: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "foto7")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var categoryTag: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoItalic-Bold", size: 16)
        title.text = "Artesanato"
        title.layer.cornerRadius = 15
        title.clipsToBounds = true
        title.backgroundColor = .brownEKO
        title.textAlignment = .center
        title.textColor = .magenta2EKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
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
    
    private lazy var nameArtist: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-ExtraBold", size: 20)
        title.text = "Araquém Aráuna"
        title.textColor = .brownEKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var descriptionArtist: UILabel = {
        let descriptionProfile = UILabel()
        descriptionProfile.font = UIFont(name: "ArchivoRoman-Light", size: 14)
        descriptionProfile.numberOfLines = 0
        descriptionProfile.text = "Povo Kayapó, 25 anos - Ele/Dele"
        descriptionProfile.textColor = .brownEKO
        descriptionProfile.translatesAutoresizingMaskIntoConstraints = false
        return descriptionProfile
    }()
    
    private lazy var followButton: UIButton = {
        let followButton = UIButton()
        followButton.setTitle("seguindo", for: .normal)
        followButton.backgroundColor = .magentaEKO
        followButton.layer.cornerRadius = 15
        followButton.clipsToBounds = true
        followButton.setTitleColor(.brownEKO, for: .normal)
        followButton.titleLabel?.font = UIFont(name: "ArchivoRoman-Light", size: 14)
        followButton.translatesAutoresizingMaskIntoConstraints = false
        return followButton
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
    
    private lazy var otherWorks: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-ExtraBold", size: 24)
        title.numberOfLines = 0
        title.text = "OUTRAS OBRAS"
        title.textColor = .redEKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var collectionViewWorkArt: UICollectionView = {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
}


extension SelectedPostViewController: ViewCode {
    func configureViews() {
        view.backgroundColor = .magentaEKO
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background1.jpeg")!)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func buildViewHierarchy() {
        view.addSubview(imageBanner)
        view.addSubview(categoryTag)
        view.addSubview(artistImage)
        view.addSubview(nameArtist)
        view.addSubview(descriptionArtist)
        view.addSubview(followButton)
        view.addSubview(otherWorks)
        view.addSubview(collectionViewWorkArt)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageBanner.topAnchor.constraint(equalTo: view.topAnchor),
            imageBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageBanner.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55)
        ])
        NSLayoutConstraint.activate([
            categoryTag.centerYAnchor.constraint(equalTo: imageBanner.bottomAnchor),
            categoryTag.centerXAnchor.constraint(equalTo: imageBanner.centerXAnchor),
            categoryTag.widthAnchor.constraint(equalToConstant: 160),
            categoryTag.heightAnchor.constraint(equalToConstant: 34)
        ])
        NSLayoutConstraint.activate([
            artistImage.topAnchor.constraint(equalTo: imageBanner.bottomAnchor, constant: 17),
            artistImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            artistImage.widthAnchor.constraint(equalToConstant: 90),
            artistImage.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            nameArtist.leadingAnchor.constraint(equalTo: artistImage.trailingAnchor, constant: 6),
            nameArtist.centerYAnchor.constraint(equalTo: artistImage.centerYAnchor, constant: -15),
            nameArtist.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionArtist.leadingAnchor.constraint(equalTo: nameArtist.leadingAnchor),
            descriptionArtist.trailingAnchor.constraint(equalTo: nameArtist.trailingAnchor),
            descriptionArtist.topAnchor.constraint(equalTo: nameArtist.bottomAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            followButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12.7),
            followButton.centerYAnchor.constraint(equalTo: artistImage.centerYAnchor),
            followButton.widthAnchor.constraint(equalToConstant: 75),
            followButton.heightAnchor.constraint(equalToConstant: 31)
        ])
        
        NSLayoutConstraint.activate([
            otherWorks.topAnchor.constraint(equalTo: artistImage.bottomAnchor, constant: 17),
            otherWorks.leadingAnchor.constraint(equalTo: artistImage.leadingAnchor),
            otherWorks.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            collectionViewWorkArt.topAnchor.constraint(equalTo: otherWorks.bottomAnchor, constant: 11),
            collectionViewWorkArt.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewWorkArt.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewWorkArt.heightAnchor.constraint(equalToConstant: 175)
        ])
    }
}

extension SelectedPostViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 175)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    }
}

extension SelectedPostViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteItem", for: indexPath) as? CategoryItemCollectionViewCell else { return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("slecionado")
    }
}

