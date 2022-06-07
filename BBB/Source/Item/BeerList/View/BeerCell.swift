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

class BeerCell: UITableViewCell{
    
    var beerImage = UIImageView()
    
    let descriptionLabel = UITextView().then{
        $0.font = UIFont(name: "Helvetica-bold", size: 16)
        $0.textAlignment = .center
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setLayout(){
        self.addSubview(beerImage)
        self.addSubview(descriptionLabel)
        
        beerImage.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(135)
            make.top.equalTo(descriptionLabel)

        }
        descriptionLabel.snp.makeConstraints { make in
            make.width.equalTo(232)
            make.height.equalTo(100)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

