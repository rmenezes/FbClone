//
//  PostContentViewCell.swift
//  FBSearchBar
//
//  Created by Raul Menezes on 4/20/19.
//  Copyright © 2019 Raul Menezes. All rights reserved.
//

import UIKit

class PostContentViewCell<PostType>: UICollectionViewCell, ContentViewCell where PostType: Post {
    typealias ContentType = PostType
    
    // MARK: - Properties
    var data: ContentType! {
        didSet {
            onDataUpdated()
        }
    }
    
    // MARK: - UI Elements
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = fbDarkGray
        label.numberOfLines = 0
        return label
    }()
    
    let postedWhen: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let postContent: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = fbDarkGray
        label.numberOfLines = 0
        return label
    }()
    
    let totalOfLikeButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let totalOfComments: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(withImage: #imageLiteral(resourceName: "IconLike"), title: "Like")
        return button
    }()
    
    let commentButton: UIButton = {
        let button = UIButton(withImage: #imageLiteral(resourceName: "IconComments"), title: "Comment")
        return button
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "IconMore").withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = fbDarkGray
        return button
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = UIStackView.Distribution.fillEqually
        stack.alignment = UIStackView.Alignment.center
        stack.axis = .horizontal
        return stack
    }()
    
    // MARK: - Overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        // Setup Views
        setupViews()
        
        // Constraints
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(moreButton)
        addSubview(postContent)
        addSubview(stackView)
        
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(commentButton)
    }
    
    // MARK: - Private
    func setupConstraints() {
        // Profile Image
        profileImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 8, right: 8))
        profileImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        // Name
        nameLabel.anchor(top: topAnchor, leading: profileImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        // More Button
        moreButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 10, right: 10))
        
        // Content
        postContent.anchor(top: profileImage.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        // Buttons
        stackView.anchor(top: postContent.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 5, bottom: 5, right: 5))
        stackView.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    func onDataUpdated() {
        // Profile Image
        profileImage.sd_setImage(with: URL(string: data.profileImageUrl))
        
        // Name
        nameLabel.text = data.name
        
        // Post
        postContent.text = data.content
    }
    
    // MARK: - Content Protocol
    public class func identifier() -> String {
        return "kPostContentViewCell"
    }
}
