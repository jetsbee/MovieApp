//
//  AppCoordinator.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 17/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var window: UIWindow
    var coordinators = [String:Coordinator]()
    
    fileprivate let MOVIELIST_KEY: String  = "MovieList"
    
    init(window: UIWindow)
    {
        self.window = window
    }
    
    func start() {
        showMovieList()
    }
    
}

extension AppCoordinator: MovieListCoordinatorDelegate {
    
    func showMovieList() {
        let movieListCoordinator = MovieListCoordinator(window: window)
        coordinators[MOVIELIST_KEY] = movieListCoordinator
        movieListCoordinator.delegate = self
        movieListCoordinator.start()
    }
    
    func movieListCoordinatorDidFinish(movieListCoordinator: MovieListCoordinator) {
        coordinators[MOVIELIST_KEY] = nil
    }
}
