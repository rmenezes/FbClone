//
//  ViewController.swift
//  FBSearchBar
//
//  Created by Raul Menezes on 4/18/19.
//  Copyright © 2019 Raul Menezes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let transition = CircularTransition()
    fileprivate var collectionView: UICollectionView!
    fileprivate var datasource: [Content] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupNavigationBar()
        setupConstraints()
        
        // Load Data
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }
    
    // MARK: - Private
    fileprivate func setupNavigationBar() {        
        // Camera button
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "IconCamera").withRenderingMode(.alwaysTemplate),
                                                           style: .plain,
                                                           target: self,
                                                           action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "IconMessenger").withRenderingMode(.alwaysTemplate),
                                                            style: .plain,
                                                            target: self,
                                                            action: nil)
        
        // Search
        let search = FBSearchView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 30))
        
        // Bar custom
        navigationItem.titleView = search
    }
    
    fileprivate func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 8
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = fbBg
        
        // UICollectionViewCell
        collectionView.register(HistoriesContentViewCell.self, forCellWithReuseIdentifier: HistoriesContentViewCell.identifier())
        collectionView.register(CommunityPostContentViewCell.self, forCellWithReuseIdentifier: CommunityPostContentViewCell.identifier())
        collectionView.register(PostContentViewCell.self, forCellWithReuseIdentifier: PostContentViewCell.identifier())
        
        // UICollectionReusableView
        collectionView.register(UserNewPostViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: UserNewPostViewCell.identifier())
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
    }
    
    fileprivate func loadData() {
        datasource = MockData.mockContent()
    }
    
    fileprivate func setupConstraints() {
        collectionView.fillSuperview()
    }
}

// MARK: - Extensions
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = datasource[indexPath.row]

        switch item.contentType {
        case .histories:
            return CGSize(width: view.bounds.width, height: 210)
        case .community:
            guard let post = item as? CommunityPost else { return .zero }

            return CGSize(width: view.bounds.width, height: post.calculateViewHeight(withView: view, viewOffset: 115))
        case .post:
            guard let post = item as? Post else { return .zero }
            
            return CGSize(width: view.bounds.width, height: post.calculateViewHeight(withView: view, viewOffset: 115))
        default:
            return CGSize(width: view.bounds.width, height: 60)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.width - 32, height: 100)
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        if velocity.y > 0 {
            UIView.animate(withDuration: 2.5, delay: 0, options: [], animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
            }, completion: nil)

        } else {
            UIView.animate(withDuration: 2.5, delay: 0, options: [], animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
            }, completion: nil)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = datasource[indexPath.row]
        
        switch item.contentType {
        case .histories:
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoriesContentViewCell.identifier(), for: indexPath) as! HistoriesContentViewCell
            viewCell.data = item as? HistoriesContent
            viewCell.delegate = self
            return viewCell
        case .community:
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CommunityPostContentViewCell.identifier(), for: indexPath) as! CommunityPostContentViewCell
            viewCell.data = item as? CommunityPost
            return viewCell
        case .post:
            let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PostContentViewCell.identifier(), for: indexPath) as! PostContentViewCell
            viewCell.data = item as? Post
            return viewCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let viewCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: UserNewPostViewCell.identifier(), for: indexPath) as! UserNewPostViewCell
        return viewCell
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = (presented as! StoryViewController).data.position
        transition.circleColor = fbBlueLight
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = (dismissed as! StoryViewController).data.position
        transition.circleColor = fbBlueLight
        
        return transition
    }
}

extension ViewController: HistoryDelegate {
    func didSelectHistory(history: HistoryTransitionObject) {
        let storyViewController = StoryViewController()
        storyViewController.data = history
        storyViewController.transitioningDelegate = self
        storyViewController.modalPresentationStyle = .custom
        
        present(storyViewController, animated: true, completion: nil)
    }
}
