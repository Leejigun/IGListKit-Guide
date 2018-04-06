//
//  UserCell.swift
//  ModelingAndBinding
//
//  Created by Ryan Nystrom on 8/18/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit
import IGListKit
final class UserCell: UICollectionViewCell,ListBindable {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

}
// MARK: - ListBindable
extension UserCell {
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? UserViewModel else { fatalError() }
        
        self.usernameLabel.text = viewModel.username
        self.dateLabel.text = viewModel.timestamp
    }
}
