import UIKit

class CarousselTableViewCell: UITableViewCell {
    
    private lazy var imageBanner: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "foto7")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var datePost: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        title.text = "hoje"
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var titlePost: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.text = "Dança de Jacundá"
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var peoplePost: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.text = "Povo Kayapo"
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var location: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        title.text = "Para mato grosso."
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var favoriteButton: UIButton = {
        let editProfile = UIButton()
        editProfile.setImage(UIImage(named: "heart"), for: .normal)
        editProfile.translatesAutoresizingMaskIntoConstraints = false
        return editProfile
    }()
    
    private lazy var shareButton: UIButton = {
        let editProfile = UIButton()
        editProfile.setImage(UIImage(named: "share"), for: .normal)
        editProfile.translatesAutoresizingMaskIntoConstraints = false
        return editProfile
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildLayout()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


extension CarousselTableViewCell: ViewCode {
    func configureViews() {
        backgroundColor = .clear
    }
    
    func buildViewHierarchy() {
        contentView.addSubview(imageBanner)
        contentView.addSubview(datePost)
        contentView.addSubview(titlePost)
        contentView.addSubview(peoplePost)
        contentView.addSubview(location)
        contentView.addSubview(favoriteButton)
        contentView.addSubview(shareButton)

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageBanner.topAnchor.constraint(equalTo: topAnchor),
            imageBanner.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageBanner.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageBanner.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            peoplePost.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            peoplePost.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),
            //peoplePost.widthAnchor.constraint(equalToConstant: 150)
            
        ])
        
        NSLayoutConstraint.activate([
            location.centerYAnchor.constraint(equalTo: peoplePost.centerYAnchor),
            location.leadingAnchor.constraint(equalTo: peoplePost.trailingAnchor, constant: 24)
            
        ])
        NSLayoutConstraint.activate([
            shareButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            shareButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            shareButton.widthAnchor.constraint(equalToConstant: 24),
            shareButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        NSLayoutConstraint.activate([
            favoriteButton.trailingAnchor.constraint(equalTo: shareButton.leadingAnchor, constant: -10),
            favoriteButton.centerYAnchor.constraint(equalTo: shareButton.centerYAnchor),
            favoriteButton.widthAnchor.constraint(equalToConstant: 24),
            favoriteButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            titlePost.bottomAnchor.constraint(equalTo: peoplePost.topAnchor, constant: -8),
            titlePost.leadingAnchor.constraint(equalTo: peoplePost.leadingAnchor),
            titlePost.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            datePost.centerXAnchor.constraint(equalTo: centerXAnchor),
            datePost.bottomAnchor.constraint(equalTo: titlePost.topAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([])
    }
}
