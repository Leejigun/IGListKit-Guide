//
//  Comment.swift
//  ModelingAndBinding
//
//  Created by Leejigun on 2018. 4. 5..
//  Copyright © 2018년 Ryan Nystrom. All rights reserved.
//

import IGListKit

class Comment:ListDiffable {
    let username:String
    let text:String
    // MARK: - init
    init(username:String,text:String) {
        self.username = username
        self.text = text
    }
}
// MARK: - ListDiffable
extension Comment {
    func diffIdentifier() -> NSObjectProtocol {
        return (username + text) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
}


