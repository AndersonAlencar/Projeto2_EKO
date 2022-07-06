import UIKit

class HomeMainBannerCell: UICollectionViewCell {
    
    private lazy var imageBanner: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "foto8")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleImage: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-ExtraBold", size: 32)//UIFont.systemFont(ofSize: 32, weight: .bold)
        title.text = "Pinturas Corporais"
        title.textColor = .magentaEKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var subTitle: UILabel = {
        let subTitle = UILabel()
        subTitle.font = UIFont(name: "ArchivoItalic-Light", size: 25)//UIFont.systemFont(ofSize: 30)
        subTitle.text = "Povo Kayapó"
        subTitle.textColor = .magentaEKO
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        return subTitle
    }()
    
    private lazy var highlight: UILabel = {
        let highlight = UILabel()
        highlight.font = UIFont(name: "ArchivoItalic-Light", size: 16)//UIFont.systemFont(ofSize: 30)
        highlight.text = "Destaque do dia"
        highlight.textAlignment = .center
        highlight.textColor = .magentaEKO
        highlight.translatesAutoresizingMaskIntoConstraints = false
        return highlight
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

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeMainBannerCell: ViewCode {
    func configureViews() {
        //
    }
    
    func buildViewHierarchy() {
        contentView.addSubview(imageBanner)
        contentView.addSubview(acessoryView)
        contentView.addSubview(titleImage)
        contentView.addSubview(subTitle)
        contentView.addSubview(highlight)
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
            acessoryView.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: acessoryView.topAnchor, constant: 10),
            titleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleImage.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 5),
            subTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            subTitle.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            highlight.topAnchor.constraint(equalTo: acessoryView.topAnchor, constant: 55),
            highlight.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            highlight.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
}
