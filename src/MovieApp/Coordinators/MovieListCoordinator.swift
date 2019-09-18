//
//  MovieListCoordinator.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 17/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import UIKit

protocol MovieListCoordinatorDelegate: class {
    func movieListCoordinatorDidFinish(movieListCoordinator: MovieListCoordinator)
}

class MovieListCoordinator: Coordinator {
    
    var window: UIWindow
    weak var delegate: MovieListCoordinatorDelegate?
    var movieListViewController: MovieListViewController?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        movieListViewController = MovieListViewController()
        
        guard let movieListViewController = movieListViewController else { return }
        
//        let viewModel =  MovieListViewModel()
//        viewModel.model = MovieListModel()
//        viewModel.coordinatorDelegate = self
//        movieListViewController.viewModel = viewModel
        window.rootViewController = movieListViewController
        
    }
    

}
