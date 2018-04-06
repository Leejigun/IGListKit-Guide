//
//  PostSectionController.swift
//  ModelingAndBinding
//
//  Created by Leejigun on 2018. 4. 6..
//  Copyright © 2018년 Ryan Nystrom. All rights reserved.
//

import IGListKit

final class PostSectionController: ListBindingSectionController<Post> {
    
    var localLikes: Int? = nil
    var localIsClickedLikes:Bool? = nil
    override init() {
        super.init()
        dataSource = self
    }
}

// MARK: - DataSource
extension PostSectionController: ListBindingSectionControllerDataSource {
    
    /// make [ViewModel] using Post object
    ///
    /// - Parameters:
    ///   - sectionController: PostSectionViewController
    ///   - object: Post object
    /// - Returns: [ViewModel]
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let post = object as? Post else {fatalError()}
        let result:[ListDiffable] = [UserViewModel(username: post.username, timestamp: post.timestamp),
                ImageViewModel(url: post.imageURL),
                ActionViewModel(likes: localLikes ?? post.likes)]
        return result + post.comments
    }
    
    /// get CGSize of cell
    ///
    /// - Parameters:
    ///   - sectionController: PostSectionViewController
    ///   - viewModel: [ListDiffable] of Post
    ///   - index: index of cell in Post collectionView
    /// - Returns: CGSize of cell
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        print("call sizeForViewModel")
        guard let width = collectionContext?.containerSize.width else { fatalError() }
        let height:CGFloat
        
        switch viewModel {
        case is ImageViewModel:
            height = 250
        case is Comment:
            height = 35
        default: // UserViewModel,ActionViewModel
            height = 55
        }
        
        return CGSize(width: width, height: height)
    }
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell {
        print("call cellForViewModel")
        
        let identifier:String
        switch viewModel {
        case is UserViewModel: identifier = "user"
        case is ImageViewModel: identifier = "image"
        case is ActionViewModel: identifier = "action"
        case is Comment: identifier = "comment"
        default:
            fatalError()
        }
        guard let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: identifier, for: self, at: index) else {
            fatalError()
        }
        if let cell = cell as? ActionCell {
            cell.delegate = self
        }
        return cell
    }
}

// MARK: - ActionCellDelegate
extension PostSectionController: ActionCellDelegate {
    func didTapHeart(cell: ActionCell) {
        // localLikes가 nil 이면 object?.likes 값을 찾아 꺼내보고 이것도 nil이면 0을 사용
        if localIsClickedLikes ?? object?.isClickedLikes ?? false {
            localLikes = (localLikes ?? object?.likes ?? 1) - 1
        } else {
            localLikes = (localLikes ?? object?.likes ?? 0) + 1
        }
        
        localIsClickedLikes = !(localIsClickedLikes ?? object?.isClickedLikes ?? false)
        
        update(animated: true, completion: nil)
    }
}
