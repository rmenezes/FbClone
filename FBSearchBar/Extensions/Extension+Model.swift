//
//  Extension+Model.swift
//  FBSearchBar
//
//  Created by Raul Menezes on 4/19/19.
//  Copyright © 2019 Raul Menezes. All rights reserved.
//
import UIKit

extension Post {
    func calculateViewHeight(withView view: UIView, viewOffset: Int) -> CGFloat {
        let approxContentLabelSize = view.frame.width - 20
        let size = CGSize(width: approxContentLabelSize, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string: content).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame.height + CGFloat(viewOffset)
    }
}
