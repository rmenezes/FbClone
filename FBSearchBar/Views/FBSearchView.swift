//
//  FBSearchView.swift
//  FBSearchBar
//
//  Created by Raul Menezes on 4/19/19.
//  Copyright © 2019 Raul Menezes. All rights reserved.
//

import UIKit

class FBSearchView: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Placeholder
        attributedPlaceholder = NSAttributedString(string: "Search", attributes: [
            .foregroundColor: fbBluetSearch])
        
        // Icon
        let icon = UIImageView(image: #imageLiteral(resourceName: "IconSearch").withRenderingMode(.alwaysTemplate))
        icon.tintColor = fbBluetSearch
        
        leftView = icon
        leftView?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        leftViewMode = .always
        
        // Background
        backgroundColor = fbBlueDark
        layer.cornerRadius = 15
        
        clipsToBounds = true
        isEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += 10
        return textRect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.textRect(forBounds: bounds)
        textRect.origin.x += 10
        return textRect
    }
}
