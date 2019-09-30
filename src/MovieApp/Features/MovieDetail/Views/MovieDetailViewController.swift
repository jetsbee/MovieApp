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
    
    let titleLabelView: UILabel = {
        let titleLabelView = UILabel()
        titleLabelView.font = UIFont.boldSystemFont(ofSize: titleLabelView.font.pointSize)
        titleLabelView.textAlignment = .center
        titleLabelView.backgroundColor = .white
        
        return titleLabelView
    }()
    
    let yearLabelView: UILabel = {
        let yearLabelView = UILabel()
        yearLabelView.font = UIFont.boldSystemFont(ofSize: yearLabelView.font.pointSize)
        yearLabelView.textAlignment = .center
        yearLabelView.backgroundColor = .white
        
        return yearLabelView
    }()
    
    let coverImageView: UIImageView = {
        let coverImageView = UIImageView()
        coverImageView.backgroundColor = .blue
        return coverImageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any aditional setup after loading the view.
        fillUI()
        setupViews()
        print(viewModel?.detail as Any)
        guard let imageUrl = URL(string: viewModel?.detail?.coverImage ?? "") else { return }
        viewModel?.downloadImage(url: imageUrl) { data in
            guard let image = UIImage(data: data as! Data) else { return }
                DispatchQueue.main.async {
                    self.coverImageView.image = image
                }
        }
    }
    
    fileprivate func fillUI() {
        if !isViewLoaded {
            return
        }
        titleLabelView.text = "Title: \(viewModel?.detail?.title ?? "")"
        yearLabelView.text = "Year: \(viewModel?.detail?.year ?? 0)"
    }
    
    fileprivate func setupViews() {
            addSubviews()
            constrainSubviews()
        }
        
    fileprivate func addSubviews() {
        view.addSubview(backButtonView)
        view.addSubview(titleLabelView)
        view.addSubview(yearLabelView)
        view.addSubview(coverImageView)
    }
        
    fileprivate func constrainSubviews() {
        backButtonView.translatesAutoresizingMaskIntoConstraints = false
        backButtonView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backButtonView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backButtonView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backButtonView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        titleLabelView.translatesAutoresizingMaskIntoConstraints = false
        titleLabelView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        titleLabelView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleLabelView.topAnchor.constraint(equalTo: backButtonView.bottomAnchor).isActive = true
        titleLabelView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        yearLabelView.translatesAutoresizingMaskIntoConstraints = false
        yearLabelView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        yearLabelView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        yearLabelView.topAnchor.constraint(equalTo: titleLabelView.bottomAnchor).isActive = true
        yearLabelView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.topAnchor.constraint(equalTo: yearLabelView.bottomAnchor).isActive = true
        coverImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
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
