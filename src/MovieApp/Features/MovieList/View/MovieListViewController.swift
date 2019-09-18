//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 17/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    let labelView = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any aditional setup after loading the view.
        setupViews()
    }
    
    fileprivate func setupViews() {
        labelView.text = "This is movie list view controller"
        addSubviews()
        constrainSubviews()
    }
    
    fileprivate func addSubviews() {
        view.addSubview(labelView)
    }
    
    fileprivate func constrainSubviews() {
        labelView.textAlignment = .center
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        labelView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        labelView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        labelView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
