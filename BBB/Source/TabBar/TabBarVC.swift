//
//  TabBarVC.swift
//  BBB
//
//  Created by 임준화 on 2022/05/30.
//

import UIKit

class TabBarVC: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = BeerListVC()
        let vc2 = BeerSearchVC()
        let vc3 = RandomBeerVC()
        
        
    }
}
