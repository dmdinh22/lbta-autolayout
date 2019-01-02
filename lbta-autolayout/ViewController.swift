//
//  ViewController.swift
//  lbta-autolayout
//
//  Created by David D on 1/1/19.
//  Copyright © 2019 David D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // here's the entry point into our app
//        view.backgroundColor = .yellow
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        view.addSubview(imageView)
//        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        // this enables autolayout for the image view
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true // anchor to view's topAnchor with 100pts padding
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }


}

