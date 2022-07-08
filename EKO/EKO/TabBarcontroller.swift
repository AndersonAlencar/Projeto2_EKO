import UIKit

class TabBarcontroller: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        self.tabBar.tintColor = .redEKO
        self.tabBar.isTranslucent = false
        //self.tabBar.barTintColor = .purple
        self.tabBar.backgroundColor = .white1EKO
        self.tabBar.unselectedItemTintColor = .redEKO
    }
    
    func setupViewControllers() {
        viewControllers = [
            createNavController(for: HomeViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: CategoriesViewController(), title: NSLocalizedString("Explore", comment: ""), image: UIImage(named: "explore")!),
            createNavController(for: ProfileViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(named: "profile")!)
        ]
    }
    
    
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        //navController.tabBarItem.title = title
        
        //navController.navigationBar.prefersLargeTitles = true
        //rootViewController.navigationItem.title = title
        rootViewController.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.tintColor = .redEKO
        return navController
    }

}
