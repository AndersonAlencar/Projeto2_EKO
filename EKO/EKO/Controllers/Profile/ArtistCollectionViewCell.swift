import UIKit

class ArtistCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageArtist: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = UIImage(named: "uti2")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameArtist: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        title.text = "Mebêngôkre"
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
            imageArtist.topAnchor.constraint(equalTo: topAnchor),
            imageArtist.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageArtist.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageArtist.bottomAnchor.constraint(equalTo: nameArtist.topAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            nameArtist.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameArtist.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameArtist.heightAnchor.constraint(equalToConstant: 30),
            nameArtist.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
}
