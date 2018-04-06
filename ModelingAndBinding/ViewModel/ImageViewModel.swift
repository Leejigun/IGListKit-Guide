//
//  ImageViewModel.swift
//  ModelingAndBinding
//
//  Created by Leejigun on 2018. 4. 5..
//  Copyright © 2018년 Ryan Nystrom. All rights reserved.
//

import IGListKit

class ImageViewModel: ListDiffable {
    let imageURL:URL
    // MARK: - init
    init(url:URL) {
        self.imageURL = url
    }
}
extension ImageViewModel {
    func diffIdentifier() -> NSObjectProtocol {
        return "image" as NSObjectProtocol
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let right = object as? ImageViewModel else {
            return false
        }
        return self.imageURL == right.imageURL
    }
}
