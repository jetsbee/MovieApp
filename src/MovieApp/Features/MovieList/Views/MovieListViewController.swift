//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 17/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    var viewModel: ListViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
            fillUI()
        }
    }
    
    let labelView = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any aditional setup after loading the view.
        fillUI()
        setupViews()
    }
    
    fileprivate func fillUI() {
        if !isViewLoaded {
            return
        }
        
        guard let viewModel = viewModel else {
            return
        }
        
        // Debug
        print("viewModel.numberOfItems: ", viewModel.numberOfItems)
        print("viewModel.title: ", viewModel.title)
        for idx in 0..<viewModel.numberOfItems {
            guard let item = viewModel.itemAtIndex(idx) else { continue }
            print("item: ", item)
        }
    }
    
    fileprivate func setupViews() {
        labelView.text = "This is movie list view controller"
        labelView.textAlignment = .center
        labelView.backgroundColor = .red
        addSubviews()
        constrainSubviews()
    }
    
    fileprivate func addSubviews() {
        view.addSubview(labelView)
    }
    
    fileprivate func constrainSubviews() {
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        labelView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        labelView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        labelView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}

extension MovieListViewController: ListViewModelViewDelegate {
    func itemsDidChange(viewModel: ListViewModel) {
        return
    }
}
