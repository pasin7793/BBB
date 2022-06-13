//
//  BeerListViewModel.swift
//  BBB
//
//  Created by 임준화 on 2022/06/10.
//

import Foundation
import Alamofire
import UIKit

final class BeerListViewModel{
    
    private let urlString = "https://api.punkapi.com/v2/beers"
    var dataSource: [Beer]?
    
    func fetchData(completion: @escaping ()->()) {
        AF.request(urlString).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                //let res = response.result
                //print(res)
                do {
                    let decoder = JSONDecoder()
                    let json = try! decoder.decode([Beer].self, from: response.data ?? .init())
                    self.dataSource = json
                    print(self.dataSource!)
                    completion()
                } catch(let err) {
                    print(err.localizedDescription)
                    let alert = UIAlertController(title: "오류", message: "응 아니야", preferredStyle: UIAlertController.Style.alert)
                    let defaultAction = UIAlertAction(title: "확인", style: .destructive, handler : nil)
                    alert.addAction(defaultAction)
                    alert.present(alert, animated: true)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
