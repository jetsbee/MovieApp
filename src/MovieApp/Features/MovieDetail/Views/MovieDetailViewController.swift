//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 25/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var viewModel: DetailViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
            fillUI()
        }
    }
    
    let backButtonView: UIButton = {
        let backButtonView = UIButton()
        backButtonView.setTitle("뒤로가기!", for: .normal)
        backButtonView.setTitleColor(.black, for: .normal)
        backButtonView.backgroundColor = .yellow
        backButtonView.addTarget(self, action: #selector(pressBackButtonView), for: .touchUpInside)
        
        return backButtonView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any aditional setup after loading the view.
        fillUI()
        setupViews()
        print("Hello, MovieDetailViewController")
        print(viewModel?.detail as Any)
        
    }
    
    fileprivate func fillUI() {
        if !isViewLoaded {
            return
        }
    }
    
    fileprivate func setupViews() {
            addSubviews()
            constrainSubviews()
        }
        
    fileprivate func addSubviews() {
        view.addSubview(backButtonView)
    }
        
    fileprivate func constrainSubviews() {
        backButtonView.translatesAutoresizingMaskIntoConstraints = false
        backButtonView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backButtonView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backButtonView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backButtonView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc
    func pressBackButtonView(sender: UIButton) {
        viewModel?.done()
    }
}

extension MovieDetailViewController: DetailViewModelViewDelegate {
    func detailDidChange(viewModel: DetailViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.fillUI()
        }
    }
}
