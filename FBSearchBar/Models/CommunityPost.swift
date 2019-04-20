//
//  CommunityPost.swift
//  FBSearchBar
//
//  Created by Raul Menezes on 4/19/19.
//  Copyright © 2019 Raul Menezes. All rights reserved.
//

import UIKit

class CommunityPost: Post {
    let communityName: String
    
    init(name: String, profileImageUrl: String, postWhen: Date, content: String, totalLikes: Int, totalComments: Int, isLiked: Bool, communityName: String) {
        self.communityName = communityName
        
        super.init(name: name, profileImageUrl: profileImageUrl, postWhen: postWhen, content: content, totalLikes: totalLikes, totalComments: totalComments, isLiked: isLiked)
        
        self.contentType = .community
    }
}
