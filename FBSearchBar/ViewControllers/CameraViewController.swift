//
//  CameraViewController.swift
//  FBSearchBar
//
//  Created by Raul Menezes on 4/22/19.
//  Copyright © 2019 Raul Menezes. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    // MARK: - UI Elements
    fileprivate let storyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        let attrString = NSMutableAttributedString(string: "Express Yourself with Stories\r", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 24),
            NSAttributedString.Key.foregroundColor: UIColor.white
            ])
        attrString.append(NSAttributedString(string: "\rShare your everyday moments right from Facebook", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.white
            ]))
        label.attributedText = attrString
        
        return label
    }()
    
    fileprivate let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "IconClose").withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFill
        
        return button
    }()
    
    fileprivate let allowAccess: UIButton = {
        let button = UIButton(withImage: #imageLiteral(resourceName: "IconCamera"), title: "Allow Access")
        button.imageView?.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFill
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = fbBlueLight
        button.layer.cornerRadius = 20
        button.addLeftPadding(5)
        
        return button
    }()
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(closeButton)
        view.addSubview(storyLabel)
        view.addSubview(allowAccess)
        
        closeButton.addTarget(self, action: #selector(onClose(_:)), for: .touchDown)

        setupConstraints()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Private
    fileprivate func setupConstraints() {
        closeButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 20, bottom: 0, right: 0))
        
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
        storyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        storyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        storyLabel.widthAnchor.constraint(equalToConstant: view.bounds.width / 3 + 50).isActive = true
        
        allowAccess.translatesAutoresizingMaskIntoConstraints = false
        allowAccess.heightAnchor.constraint(equalToConstant: 40).isActive = true
        allowAccess.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        allowAccess.widthAnchor.constraint(equalToConstant: 150).isActive = true
        allowAccess.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
    }
    
    // MARK: - Handlers
    @objc func onClose(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
