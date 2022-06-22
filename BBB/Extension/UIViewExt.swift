//
//  UIViewExt.swift
//  BBB
//
//  Created by 임준화 on 2022/06/10.
//

import UIKit

extension UIView{
    func addSubViews(_ subView: UIView...) {
        subView.forEach(addSubview(_:))
    }
}
