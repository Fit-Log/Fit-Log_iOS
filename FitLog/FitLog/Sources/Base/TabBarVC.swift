import UIKit
import SnapKit
import Then

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.selectedIndex = 1
    }
    
    func setup() {
        tabBar.tintColor = .main700
        tabBar.barTintColor = .white
        tabBar.unselectedItemTintColor = .gray600
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.clipsToBounds = true
        
        let changeViewController = createNavigationController(title: "변화", image: .changeIcon, viewController: PhysicalChangeViewController())
        let mainViewController = createNavigationController(title: "홈", image: .homeIcon, viewController: MainViewController())
        let recordViewController = createNavigationController(title: "기록", image: .recordIcon, viewController: RecordViewController())
        changeViewController.tabBarItem.imageInsets = UIEdgeInsets(top: -17, left: 0, bottom: 0, right: 0)
        mainViewController.tabBarItem.imageInsets = UIEdgeInsets(top: -17, left: 0, bottom: 0, right: 0)
        recordViewController.tabBarItem.imageInsets = UIEdgeInsets(top: -17, left: 0, bottom: 0, right: 0)
        
        self.setViewControllers([
            changeViewController,
            mainViewController,
            recordViewController
        ], animated: true)
        
    }
    
    func createNavigationController(title: String, image: UIImage, viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
    
}
