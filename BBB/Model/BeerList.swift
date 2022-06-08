//
//  BeerList.swift
//  BBB
//
//  Created by 임준화 on 2022/06/01.
//

import Foundation

struct Beer: Codable{
    let id: Int
    let imageUrl: String
    let description: String
    
    private enum CodingKeys: String, CodingKey{
        case id
        case description
        case imageUrl = "image_url"
    }
}

