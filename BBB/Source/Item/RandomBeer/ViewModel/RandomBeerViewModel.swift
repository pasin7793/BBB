//
//  RandomBeerViewModel.swift
//  BBB
//
//  Created by 임준화 on 2022/06/23.
//

import Foundation
import Alamofire
import UIKit

final class RandomBeerViewModel{
    private let urlString = "https://api.punkapi.com/v2/beers/random"
    var beer: Dynamic<Beer?> = Dynamic(nil)
    
    func fetchData() {
        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success(let res):
                let decoder = JSONDecoder()
                guard let json = try? decoder.decode([Beer].self, from: res).first else { return }
                self.beer.value = json
                print(json)
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
