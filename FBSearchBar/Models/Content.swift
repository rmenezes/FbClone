//
//  Post.swift
//  FBSearchBar
//
//  Created by Raul Menezes on 4/19/19.
//  Copyright © 2019 Raul Menezes. All rights reserved.
//

import UIKit

protocol Content {
    var contentType: ContentType { get }
}

enum ContentType: Int {
    case post
    case community
    case jobAd
    case histories
}
