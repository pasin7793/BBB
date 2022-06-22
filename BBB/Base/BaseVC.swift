//
//  BaseVC.swift
//  BBB
//
//  Created by 임준화 on 2022/05/30.
//

import Foundation
import UIKit

class BaseVC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        configureVC()
        addView()
        setLayout()
    }
    func setUp(){}
    func configureVC(){}
    func addView(){}
    func setLayout(){}
}
