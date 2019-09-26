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
    
    let TitleLabelView: UILabel = {
        let TitleLabelView = UILabel()
        TitleLabelView.font = UIFont.boldSystemFont(ofSize: TitleLabelView.font.pointSize)
        TitleLabelView.textAlignment = .center
        TitleLabelView.backgroundColor = .white
        
        return TitleLabelView
    }()
    
    let YearLabelView: UILabel = {
        let YearLabelView = UILabel()
        YearLabelView.font = UIFont.boldSystemFont(ofSize: YearLabelView.font.pointSize)
        YearLabelView.textAlignment = .center
        YearLabelView.backgroundColor = .white
        
        return YearLabelView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any aditional setup after loading the view.
        fillUI()
        setupViews()
        TitleLabelView.text = "Title: \(viewModel?.detail?.title ?? "")"
        YearLabelView.text = "Year: \(viewModel?.detail?.year ?? 0)"
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
        view.addSubview(TitleLabelView)
        view.addSubview(YearLabelView)
    }
        
    fileprivate func constrainSubviews() {
        backButtonView.translatesAutoresizingMaskIntoConstraints = false
        backButtonView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backButtonView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backButtonView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backButtonView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        TitleLabelView.translatesAutoresizingMaskIntoConstraints = false
        TitleLabelView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        TitleLabelView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        TitleLabelView.topAnchor.constraint(equalTo: backButtonView.bottomAnchor).isActive = true
        TitleLabelView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        YearLabelView.translatesAutoresizingMaskIntoConstraints = false
        YearLabelView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        YearLabelView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        YearLabelView.topAnchor.constraint(equalTo: TitleLabelView.bottomAnchor).isActive = true
        YearLabelView.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
