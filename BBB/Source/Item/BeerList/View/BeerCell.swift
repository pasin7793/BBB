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
    
    let image = UIImageView()
    
    let descriptionLabel = UILabel().then{
        $0.font = UIFont(name: "Helvetica", size: 10)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setLayout(){
        self.addSubview(image)
        self.addSubview(descriptionLabel)
        
        image.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(135)
            make.top.equalTo(30)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
    }
}
