import UIKit

class WorkArtCollectionViewCell: UICollectionViewCell {
    private lazy var imageBanner: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "foto7")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleImage: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-Black", size: 18)
        title.text = "Cymeíma"
        title.textColor = .magentaEKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var acessoryView: UIView = {
        let acessoryView = UIView()
        acessoryView.backgroundColor = .black.withAlphaComponent(0.5)
        acessoryView.translatesAutoresizingMaskIntoConstraints = false
        return acessoryView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    func setup(title: String, imageName: String) {
        self.titleImage.text = title
        self.imageBanner.image = UIImage(named: imageName)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WorkArtCollectionViewCell: ViewCode {
    func configureViews() {
        backgroundColor = .clear
        self.layer.masksToBounds = true
        contentView.layer.cornerRadius = 20
        layer.cornerRadius = 20

    }
    
    func buildViewHierarchy() {
        contentView.addSubview(imageBanner)
        contentView.addSubview(acessoryView)
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
            acessoryView.bottomAnchor.constraint(equalTo: bottomAnchor),
            acessoryView.leadingAnchor.constraint(equalTo: leadingAnchor),
            acessoryView.trailingAnchor.constraint(equalTo: trailingAnchor),
            acessoryView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.27)
        ])
        
        NSLayoutConstraint.activate([
            titleImage.centerYAnchor.constraint(equalTo: acessoryView.centerYAnchor),
            titleImage.leadingAnchor.constraint(equalTo: acessoryView.leadingAnchor, constant: 8),
            titleImage.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
