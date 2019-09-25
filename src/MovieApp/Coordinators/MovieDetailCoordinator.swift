//
//  MovieDetailCoordinator.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 25/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import UIKit

protocol MovieDetailCoordinatorDelegate: class {
    func detailCoordinatorDidFinish(movieDetailCoordinator: MovieDetailCoordinator)
}

class MovieDetailCoordinator: Coordinator {
    weak var delegate: MovieDetailCoordinatorDelegate?
    var window: UIWindow
    let dataItem: DataItem
    
    init(window: UIWindow, dataItem: DataItem) {
        self.window = window
        self.dataItem = dataItem
    }
    
    func start() {
        let movieDetailViewController = MovieDetailViewController()
        let viewModel =  MovieDetailViewModel()
        viewModel.model = MovieDetailModel(detailItem: dataItem)
        viewModel.coordinatorDelegate = self
        movieDetailViewController.viewModel = viewModel
        window.rootViewController = movieDetailViewController
    }
}

extension MovieDetailCoordinator: DetailViewModelCoordinatorDelegate {
    
    func detailViewModelDidEnd(_ viewModel: DetailViewModel) {
        delegate?.detailCoordinatorDidFinish(movieDetailCoordinator: self)
    }
    
}
