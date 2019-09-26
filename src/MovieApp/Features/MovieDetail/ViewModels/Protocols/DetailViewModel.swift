//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 25/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewModelViewDelegate: class {
    func detailDidChange(viewModel: DetailViewModel)
}

protocol DetailViewModelCoordinatorDelegate: class {
    func detailViewModelDidEnd(_ viewModel: DetailViewModel)
}

protocol DetailViewModel {
    var model: DetailModel? { get set }
    var viewDelegate: DetailViewModelViewDelegate? { get set }
    var coordinatorDelegate: DetailViewModelCoordinatorDelegate? { get set}
    var detail: DataItem? { get }
    func done()
    func downloadImage(url: URL, view: UIImageView)
}
