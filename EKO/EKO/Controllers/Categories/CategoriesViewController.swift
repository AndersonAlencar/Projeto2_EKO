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
    
    let moda = [
        MainModel(imageName: "moda1", artist: "Cymeíma", subtitle: "Moda", imageProfileArtist: "foto5"),
        MainModel(imageName: "moda2", artist: "Cymeíma", subtitle: "Moda", imageProfileArtist: "foto5"),
        MainModel(imageName: "moda3", artist: "Cymeíma", subtitle: "Moda", imageProfileArtist: "foto5"),
        MainModel(imageName: "moda4", artist: "Cymeíma", subtitle: "Moda", imageProfileArtist: "foto5"),
        MainModel(imageName: "moda5", artist: "Cymeíma", subtitle: "Moda", imageProfileArtist: "foto5"),
        MainModel(imageName: "moda6", artist: "Cymeíma", subtitle: "Moda", imageProfileArtist: "foto5"),
        MainModel(imageName: "moda7", artist: "Cymeíma", subtitle: "Moda", imageProfileArtist: "foto5"),
        MainModel(imageName: "moda8", artist: "Cymeíma", subtitle: "Moda", imageProfileArtist: "foto5"),
        MainModel(imageName: "moda9", artist: "Cymeíma", subtitle: "Moda", imageProfileArtist: "foto5"),
        MainModel(imageName: "moda10", artist: "Cymeíma", subtitle: "Moda", imageProfileArtist: "foto5")
    ]
    
    let artesanato = [
        MainModel(imageName: "artesanato1", artist: "Baraúna Coaraci", subtitle: "Artesanato", imageProfileArtist: "kayapo"),
        MainModel(imageName: "artesanato2", artist: "Baraúna Coaraci", subtitle: "Artesanato", imageProfileArtist: "kayapo"),
        MainModel(imageName: "artesanato3", artist: "Baraúna Coaraci", subtitle: "Artesanato", imageProfileArtist: "kayapo"),
        MainModel(imageName: "artesanato4", artist: "Baraúna Coaraci", subtitle: "Artesanato", imageProfileArtist: "kayapo"),
        MainModel(imageName: "artesanato5", artist: "Baraúna Coaraci", subtitle: "Artesanato", imageProfileArtist: "kayapo"),
        MainModel(imageName: "artesanato6", artist: "Baraúna Coaraci", subtitle: "Artesanato", imageProfileArtist: "kayapo"),
        MainModel(imageName: "artesanato7", artist: "Baraúna Coaraci", subtitle: "Artesanato", imageProfileArtist: "kayapo"),
        MainModel(imageName: "artesanato8", artist: "Baraúna Coaraci", subtitle: "Artesanato", imageProfileArtist: "kayapo"),
        MainModel(imageName: "artesanato9", artist: "Baraúna Coaraci", subtitle: "Artesanato", imageProfileArtist: "kayapo"),
        MainModel(imageName: "artesanato10", artist: "Baraúna Coaraci", subtitle: "Artesanato", imageProfileArtist: "kayapo")
    ]
    
    let fotografia = [
        MainModel(imageName: "fotografia1", artist: "Araquém Aráuna", subtitle: "Fotografia", imageProfileArtist: "foto3"),
        MainModel(imageName: "fotografia2", artist: "Araquém Aráuna", subtitle: "Fotografia", imageProfileArtist: "foto3"),
        MainModel(imageName: "fotografia3", artist: "Araquém Aráuna", subtitle: "Fotografia", imageProfileArtist: "foto3"),
        MainModel(imageName: "fotografia4", artist: "Araquém Aráuna", subtitle: "Fotografia", imageProfileArtist: "foto3"),
        MainModel(imageName: "fotografia5", artist: "Araquém Aráuna", subtitle: "Fotografia", imageProfileArtist: "foto3"),
        MainModel(imageName: "fotografia6", artist: "Araquém Aráuna", subtitle: "Fotografia", imageProfileArtist: "foto3")
    ]
    
    let pintura = [
        MainModel(imageName: "pintura1", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6"),
        MainModel(imageName: "pintura2", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6"),
        MainModel(imageName: "pintura3", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6"),
        MainModel(imageName: "pintura4", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6"),
        MainModel(imageName: "pintura5", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6"),
        MainModel(imageName: "pintura6", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6"),
        MainModel(imageName: "pintura7", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6"),
        MainModel(imageName: "pintura8", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6"),
        MainModel(imageName: "pintura9", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6"),
        MainModel(imageName: "pintura10", artist: "Mekrãgnoti", subtitle: "Pintura Corporal", imageProfileArtist: "foto6")
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
            cell.setup(title: "EXPLORE")
            return cell
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell()}
        let model = categoryModel[indexPath.row - 1]
        cell.setup(tile: model.title, imageName: model.imageCategory)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = SelectedCategoryViewController()
        var model = [MainModel]()
        switch indexPath.row {
        case 1:
            model = moda
            controller.titleCategory = "VESTUÁRIO"
        case 2:
            model = pintura
            controller.titleCategory = "PINTURA"
        case 3:
            model = artesanato
            controller.titleCategory = "ARTESANATO"
        case 4:
            model = fotografia
            controller.titleCategory = "FOTOGRAFIA"
        default:
            break
        }
        controller.categoryModel = model
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension CategoriesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
}
