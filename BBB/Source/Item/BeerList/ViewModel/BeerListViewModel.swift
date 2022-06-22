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
    var dataSource: [Beer] = []
    
    func fetchData(completion: @escaping ()->()) {
        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let json = try decoder.decode([Beer].self, from: response.data ?? .init())
                    self.dataSource = json 
                    print(self.dataSource)
                    completion()
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
