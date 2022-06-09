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

final class BeerCell: UITableViewCell{
    
    private var beerImage = UIImageView()
    
    private let descriptionTextView = UITextView().then{
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
        self.addSubview(descriptionTextView)
        
        beerImage.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(135)
            make.top.equalTo(descriptionTextView)
            make.left.equalTo(21)
        }
        descriptionTextView.snp.makeConstraints { make in
            make.width.equalTo(232)
            make.height.equalTo(100)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

