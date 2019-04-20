//
//  Post.swift
//  FBSearchBar
//
//  Created by Raul Menezes on 4/20/19.
//  Copyright © 2019 Raul Menezes. All rights reserved.
//

import UIKit

class Post: Content {
    var contentType: ContentType
    let name: String
    let profileImageUrl: String
    let postWhen: Date
    let content: String
    let totalLikes: Int
    let totalComments: Int
    let isLiked: Bool
    
    init(name: String, profileImageUrl: String, postWhen: Date, content: String, totalLikes: Int, totalComments: Int, isLiked: Bool) {
        self.contentType = .post
        self.name = name
        self.profileImageUrl = profileImageUrl
        self.postWhen = postWhen
        self.content = content
        self.totalLikes = totalLikes
        self.totalComments = totalComments
        self.isLiked = isLiked
    }
}
