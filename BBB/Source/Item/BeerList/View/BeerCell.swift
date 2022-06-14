//
//  BeerCell.swift
//  BBB
//
//  Created by 임준화 on 2022/06/02.
//

import Foundation
import SnapKit
import UIKit
import Then

final class BeerCell: BaseTableViewCell{
    
    let beerImage = UIImageView()
    
    let descriptionLabel = UILabel().then{
        $0.font = UIFont(name: "Helvetica-bold", size: 16)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    override func addView() {
        self.addSubViews(beerImage,descriptionLabel)
    }
    override func setLayout(){
        
        beerImage.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(135)
            make.top.equalTo(descriptionLabel)
            make.left.equalTo(21)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.width.equalTo(232)
            make.height.equalTo(100)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

