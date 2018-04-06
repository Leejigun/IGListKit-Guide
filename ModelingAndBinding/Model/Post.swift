//
//  post.swift
//  ModelingAndBinding
//
//  Created by Leejigun on 2018. 4. 5..
//  Copyright © 2018년 Ryan Nystrom. All rights reserved.
//

import IGListKit

final class Post: ListDiffable {
    
    // 1
    let username: String
    let timestamp: String
    let imageURL: URL
    let likes: Int
    let isClickedLikes:Bool
    let comments: [Comment]
    
    // 2
    init(username: String, timestamp: String, imageURL: URL, likes: Int,isClickedLikes:Bool, comments: [Comment]) {
        self.username = username
        self.timestamp = timestamp
        self.imageURL = imageURL
        self.likes = likes
        self.isClickedLikes = isClickedLikes
        self.comments = comments
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        // 1
        return (username + timestamp) as NSObjectProtocol
    }
    
    // 2
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
}
