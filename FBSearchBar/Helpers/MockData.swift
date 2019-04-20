//
//  MockData.swift
//  FBSearchBar
//
//  Created by Raul Menezes on 4/19/19.
//  Copyright © 2019 Raul Menezes. All rights reserved.
//

import UIKit

class MockData: NSObject {
    static let mainUserProfileUrl: String = "https://pbs.twimg.com/profile_images/563105554822737921/F-iH3BMT_400x400.png"
    
    static func mockContent() -> [Content] {
        return [
            // Histories
            HistoriesContent(histories: mockHistories()),
            
            // Community Posts
            CommunityPost(name: "Steve Carell", profileImageUrl: mainUserProfileUrl, postWhen: Date(), content: "Shiny available for trade!", totalLikes: 5, totalComments: 30, isLiked: false, communityName: "Pokemon Go"),
            CommunityPost(name: "Patrick Swayze", profileImageUrl: "https://www.biography.com/.image/t_share/MTQ1NDY1NDcxMDMyODk1MjQ5/patrick-swayze---early-years-as-a-dancer.jpg", postWhen: Date(), content: "Looking for shinies!!!!!", totalLikes: 5, totalComments: 30, isLiked: false, communityName: "Pokemon Go"),
            CommunityPost(name: "Jeff Goldblum", profileImageUrl: "https://image-ticketfly.imgix.net/00/03/11/86/92-og.jpg?w=650&h=409", postWhen: Date(), content: "They're using our own satellites against us. And the clock is ticking. Hey, take a look at the earthlings. Goodbye! So you two dig up, dig up dinosaurs? Yeah, but your scientists were so preoccupied with whether or not they could, they didn't stop to think if they should.", totalLikes: 5, totalComments: 30, isLiked: false, communityName: "Jurassic Park"),
            CommunityPost(name: "Wesley Snipess", profileImageUrl: "https://cdn-images-1.medium.com/max/1200/1*Nelp2ZwXmlCKPzuLZMAN-g@2x.jpeg", postWhen: Date(), content: "Thanks for accepting my request :)", totalLikes: 5, totalComments: 30, isLiked: false, communityName: "Pokemon Go"),
            
            // General Posts
            Post(name: "Jeff Goldblum", profileImageUrl: "https://image-ticketfly.imgix.net/00/03/11/86/92-og.jpg?w=650&h=409", postWhen: Date(), content: "Hi.", totalLikes: 5, totalComments: 30, isLiked: false),
        ]
    }
    
    static func mockHistories() -> [History] {
        return [
            History(name: "Steve Carell", profileUrl: mainUserProfileUrl, histories: [String](), isSelfPost: true),
            History(name: "John Leguizamo", profileUrl: "https://media.wnyc.org/i/800/0/l/85/1/Leguiza.jpg", histories: [String](), isSelfPost: false),
            History(name: "Patrick Swayze", profileUrl: "https://www.biography.com/.image/t_share/MTQ1NDY1NDcxMDMyODk1MjQ5/patrick-swayze---early-years-as-a-dancer.jpg", histories: [String](), isSelfPost: false),
            History(name: "Wesley Snipes", profileUrl: "https://cdn-images-1.medium.com/max/1200/1*Nelp2ZwXmlCKPzuLZMAN-g@2x.jpeg", histories: [String](), isSelfPost: false),
            History(name: "Jeff Goldblum", profileUrl: "https://image-ticketfly.imgix.net/00/03/11/86/92-og.jpg?w=650&h=409", histories: [String](), isSelfPost: false),
        ]
    }
}
