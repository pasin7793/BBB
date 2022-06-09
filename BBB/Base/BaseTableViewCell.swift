//
//  BaseTableViewCell.swift
//  BBB
//
//  Created by 임준화 on 2022/06/09.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        configureVC()
        addView()
        setLayout()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){}
    func configureVC(){}
    func addView(){}
    func setLayout(){}
}
