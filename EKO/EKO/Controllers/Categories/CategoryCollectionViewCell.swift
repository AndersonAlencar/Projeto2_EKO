import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    private lazy var imageBanner: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "foto4")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleImage: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-Bold", size: 24)//UIFont.systemFont(ofSize: 24, weight: .bold)
        title.text = "Danças"
        title.textColor = .white
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

extension CategoryCollectionViewCell: ViewCode {
    func configureViews() {
        backgroundColor = .clear
    }
    
    func buildViewHierarchy() {
        contentView.addSubview(imageBanner)
        contentView.addSubview(titleImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageBanner.topAnchor.constraint(equalTo: topAnchor),
            imageBanner.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageBanner.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageBanner.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            titleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}
