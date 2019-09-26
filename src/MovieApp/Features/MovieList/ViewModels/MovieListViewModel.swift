//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 18/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation

class MovieListViewModel: ListViewModel {
    
    weak var viewDelegate: ListViewModelViewDelegate?
    weak var coordinatorDelegate: ListViewModelCoordinatorDelegate?
    private let networking = Networking()
    
    fileprivate var items: [DataItem]? {
        didSet {
            viewDelegate?.itemsDidChange(viewModel: self)
        }
    }
    
    var model: ListModel? {
        didSet {
            items = nil;
            model?.items({ (items) in
                self.items = items
            })
        }
    }
    
    var numberOfItems: Int {
        if let items = items {
            return items.count
        }
        return 0
    }
    
    func itemAtIndex(_ index: Int) -> DataItem? {
        if let items = items , items.count > index {
            return items[index]
        }
        return nil
    }
    
    func useItemAtIndex(_ index: Int) {
        if let items = items, let coordinatorDelegate = coordinatorDelegate  , index < items.count {
            coordinatorDelegate.listViewModelDidSelectData(self, data: items[index])
        }
    }
    
    func getMovies(limit: Int,
                   minimumRating: Int,
                   completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: YTSApi.movies(limit: limit, minimumRating: minimumRating),
                                      type: RawMovies.self) { [weak self] (response) in
                                        //self?.rawMovies = response
                                        var items = [DataItem]()
                                        for movie in response.data.movies {
                                            items.append(MovieDataItem(id: String(movie.id), title: movie.title, year: movie.year))
                                        }
                                        let model = MovieListModel()
                                        model.setItems(items)
                                        self?.model = model
                                        
                                        completion?()
        }
    }
}
