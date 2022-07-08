import UIKit

class ArtistCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageArtist: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 45
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.brownEKO.cgColor
        image.image = UIImage(named: "foto8")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameArtist: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        title.text = "Araquém Aráuna"
        title.numberOfLines = 0
        title.textAlignment = .center
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ArtistCollectionViewCell: ViewCode {
    func configureViews() {
        backgroundColor = .clear
    }
    
    func buildViewHierarchy() {
        contentView.addSubview(imageArtist)
        contentView.addSubview(nameArtist)
        nameArtist.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageArtist.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageArtist.topAnchor.constraint(equalTo: topAnchor),
            imageArtist.widthAnchor.constraint(equalToConstant: 90),
            imageArtist.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            nameArtist.topAnchor.constraint(equalTo: imageArtist.bottomAnchor, constant: 7),
            nameArtist.leadingAnchor.constraint(equalTo: imageArtist.leadingAnchor),
            nameArtist.trailingAnchor.constraint(equalTo: imageArtist.trailingAnchor),
            //nameArtist.heightAnchor.constraint(equalToConstant: 30),
            nameArtist.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
        ])
    }
}
