//
//  BeerSearchViewModel.swift
//  BBB
//
//  Created by 임준화 on 2022/06/21.
//

import Foundation
import Alamofire
import UIKit

final class BeerSearchViewModel{
    
    private let urlString = "https://api.punkapi.com/v2/beers"
    var dataSource: Beer?
    var beer: Dynamic<Beer?> = Dynamic(nil)
    
    func fetchData(searchText: String) {
        AF.request(urlString+"/\(searchText)").responseData { (response) in
            switch response.result {
            case .success(let res):
                let decoder = JSONDecoder()
                guard let json = try? decoder.decode([Beer].self, from: res).first else { return }
                self.beer.value = json
                print(json)
                print(self.dataSource ?? "")
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
