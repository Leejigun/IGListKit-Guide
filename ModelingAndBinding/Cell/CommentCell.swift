//
//  CommentCell.swift
//  ModelingAndBinding
//
//  Created by Ryan Nystrom on 8/18/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit
import IGListKit
final class CommentCell: UICollectionViewCell, ListBindable {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
}

// MARK: - ListBindable
extension CommentCell {
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? Comment else {
            fatalError()
        }
        self.usernameLabel.text = viewModel.username
        self.commentLabel.text = viewModel.text
    }
}
