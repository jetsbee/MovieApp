//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 25/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation

class MovieDetailViewModel: DetailViewModel {
    weak var viewDelegate: DetailViewModelViewDelegate?
    weak var coordinatorDelegate: DetailViewModelCoordinatorDelegate?
    
    fileprivate(set) var detail: DataItem? {
        didSet {
            viewDelegate?.detailDidChange(viewModel: self)
        }
    }
    
    var model: DetailModel? {
        didSet {
            model?.detail({ (item) in
                self.detail = item
            })
        }
    }
    
    func done() {
        coordinatorDelegate?.detailViewModelDidEnd(self)
    }
}
