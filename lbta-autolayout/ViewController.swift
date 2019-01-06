//
//  ViewController.swift
//  lbta-autolayout
//
//  Created by David D on 1/1/19.
//  Copyright © 2019 David D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // let's avoid polluting viewDidLoad
    // {} referred to as closure / anon function
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        
        // this enables autolayout for the image view
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // images width and height stays same regardless of imageView size
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
//        textView.text = "Join us today in our fun and games!"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // make sure correct encapsulation principles are applied to classes
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.customPink, for: .normal)
        
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = .customPink
        pageControl.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        
        return pageControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // entry pt into app
        view.addSubview(descriptionTextView)
        
        setupLayout()
        
        setupBottomControls()
    }

    private func setupLayout() {
        // create container for top half
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true // multiplier sets container size to half of screen height
        
        topImageContainerView.addSubview(bearImageView)
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true // scale img height to container height
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true // pin to bottom of top image container
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        view.addSubview(bottomControlsStackView)
        
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        // alternative to setting constraints and not having to set .isActive = true
        NSLayoutConstraint.activate([
            // using safeAreaLayoutGuide to not be in the phone's safe area - iPhone X+
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

extension UIColor {
    static var customPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}
