//
//  BeerList.swift
//  BBB
//
//  Created by 임준화 on 2022/06/01.
//

import Foundation

struct BeerList: Codable{
    let beers: [Beer]
    
    private enum CodingKeys: String, CodingKey{
        case beers
        
    }
}

struct Beer: Codable{
    let image_url: String
    let description: String
    
    private enum CodingKeys: String, CodingKey{
        case description
        case image_url = "image_url"
    }
}

