//
//  UIView+Layer.swift
//  FBSearchBar
//
//  Created by Raul Menezes on 4/19/19.
//  Copyright © 2019 Raul Menezes. All rights reserved.
//

import UIKit

extension UIView {
    func withShadow() {
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 1
        layer.masksToBounds = false
    }
}
