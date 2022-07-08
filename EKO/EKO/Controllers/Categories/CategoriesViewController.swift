import UIKit

struct CategoryModel {
    let title: String
    let imageCategory: String
}

class CategoriesViewController: UIViewController {
    
    let categoryModel = [
        CategoryModel(title: "Vestuário", imageCategory: "moda5"),
        CategoryModel(title: "Pintura Corporal", imageCategory: "pintura6"),
        CategoryModel(title: "Artesanato", imageCategory: "artesanato15"),
        CategoryModel(title: "fotografia", imageCategory: "fotografia6")
    ]
    
    private lazy var searchController: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "O que você procura?"
        return search
    }()
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let sectionSpacing = 0
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "categoryCell")
        collectionView.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: "exploreCell")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildLayout()
    }
}

extension CategoriesViewController: ViewCode {
    func configureViews() {
        view.backgroundColor = .magentaEKO
        navigationItem.searchController = self.searchController
        searchController.searchResultsUpdater = self
        self.tabBarController?.tabBar.items![1].image = UIImage(named: "explore")
        self.tabBarController?.tabBar.items![1].selectedImage = UIImage(named: "exploreSelected")
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func buildViewHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: self.view.frame.width*0.95, height: self.view.frame.height*0.1)
        }
        return CGSize(width: self.view.frame.width*0.95, height: self.view.frame.height*0.28)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.categoryModel.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as? ExploreCollectionViewCell else { return UICollectionViewCell()}
            return cell
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell()}
        let model = categoryModel[indexPath.row - 1]
        cell.setup(tile: model.title, imageName: model.imageCategory)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = ArtistViewController()
        controller.title = "Aqui terá Postagens"
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension CategoriesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
}
