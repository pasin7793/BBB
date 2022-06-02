//
//  BeerList.swift
//  BBB
//
//  Created by 임준화 on 2022/06/01.
//

import Foundation

struct BeerList: Codable{
    let beers: [Beer]
}

struct Beer: Codable{
    let image_url: URL
    let description: String
    
    enum CodingKeys: String,CodingKey{
        case image_url = "image_url"
        case description
    }
}

