//
//  UserViewModel.swift
//  ModelingAndBinding
//
//  Created by Leejigun on 2018. 4. 5..
//  Copyright © 2018년 Ryan Nystrom. All rights reserved.
//

import IGListKit

final class UserViewModel: ListDiffable {
    
    let username: String
    let timestamp: String
    
    init(username: String, timestamp: String) {
        self.username = username
        self.timestamp = timestamp
    }
    
    // MARK: ListDiffable
    func diffIdentifier() -> NSObjectProtocol {
        return "user" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        // 2
        guard let object = object as? UserViewModel else  { return false }
        return username == object.username
            && timestamp == object.timestamp
    }
    
}
