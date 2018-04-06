//
//  ActionViewModel.swift
//  ModelingAndBinding
//
//  Created by Leejigun on 2018. 4. 5..
//  Copyright © 2018년 Ryan Nystrom. All rights reserved.
//

import IGListKit

final class ActionViewModel: ListDiffable {
    let likes: Int
    // MARK: - init
    init(likes: Int) {
        self.likes = likes
    }
}
// MARK: - ListDiffable
extension ActionViewModel {
    func diffIdentifier() -> NSObjectProtocol {
        return "action" as NSObjectProtocol
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ActionViewModel
            else {
                return false
        }
        return likes == object.likes
    }
}
