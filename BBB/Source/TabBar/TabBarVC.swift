
import UIKit

final class TabBarVC: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let vc1 = BeerListVC()
        let vc2 = BeerSearchVC()
        let vc3 = RandomBeerVC()
        
        vc1.tabBarItem = UITabBarItem(title: "BeerList", image: UIImage(systemName: "1.circle.fill"), selectedImage: UIImage(systemName: "1.circle.fill"))
        
        vc2.tabBarItem = UITabBarItem(title: "BeerSearch", image: UIImage(systemName: "2.circle.fill"), selectedImage: UIImage(systemName: "2.circle.fill"))
        
        vc3.tabBarItem = UITabBarItem(title: "RandomBeer", image: UIImage(systemName: "3.circle.fill"), selectedImage: UIImage(systemName: "3.circle.fill"))
        self.viewControllers = [vc1,vc2,vc3]
    }
}
