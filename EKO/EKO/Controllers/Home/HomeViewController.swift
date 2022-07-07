import UIKit

class HomeViewController: UIViewController {

    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let sectionSpacing = 0
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()
    
    private lazy var flowLayout2: UICollectionViewFlowLayout = {
        let sectionSpacing = 0
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }()
    
    private lazy var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(HomeMainBannerCell.self, forCellWithReuseIdentifier: "mainBanner")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 20
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var highlightCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout2)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(CategoryItemCollectionViewCell.self, forCellWithReuseIdentifier: "highlightCell")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var highlightLabel: UILabel = {
        let highlightLabel = UILabel()
        highlightLabel.text = "DESTAQUES"
        highlightLabel.textColor = .redEKO
        highlightLabel.font =  UIFont(name: "ArchivoRoman-ExtraBold", size: 24)
        highlightLabel.translatesAutoresizingMaskIntoConstraints = false
        return highlightLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
}

extension HomeViewController: ViewCode {
    func configureViews() {
        self.tabBarController?.tabBar.items![0].image = UIImage(named: "home")
        self.tabBarController?.tabBar.items![0].selectedImage = UIImage(named: "homeSelected")
        view.backgroundColor = .magentaEKO
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func buildViewHierarchy() {
        view.addSubview(mainCollectionView)
        view.addSubview(highlightLabel)
        view.addSubview(highlightCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionView.heightAnchor.constraint(equalToConstant: 360)
        ])
        
        NSLayoutConstraint.activate([
            highlightLabel.topAnchor.constraint(equalTo: mainCollectionView.bottomAnchor, constant: 30),
            highlightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            highlightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            highlightCollectionView.topAnchor.constraint(equalTo: highlightLabel.bottomAnchor, constant: 10),
            highlightCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            highlightCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            highlightCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainCollectionView {
            return CGSize(width: collectionView.frame.width, height: 414)
        }
        return CGSize(width: 190, height: 200)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == mainCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)

    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCollectionView {
            return 10
        }
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mainCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainBanner", for: indexPath) as? HomeMainBannerCell else { return UICollectionViewCell()}
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "highlightCell", for: indexPath) as? CategoryItemCollectionViewCell else { return UICollectionViewCell()}
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainCollectionView {
            let controller = ArtistUIViewController()
            controller.title = "Aqui terá destaque"
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = SelectedPostViewController()
            controller.title = "Aqui terá postagem"
            present(controller, animated: true)
        }
        
    }
}

