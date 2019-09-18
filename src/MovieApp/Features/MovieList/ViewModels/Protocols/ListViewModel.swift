//
//  ListViewModel.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 18/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation

protocol ListViewModelViewDelegate: class {
    func itemsDidChange(viewModel: ListViewModel)
}

protocol ListViewModelCoordinatorDelegate: class {
    func listViewModelDidSelectData(_ viewModel: ListViewModel, data: DataItem)
}

protocol ListViewModel {
    var model: ListModel? { get set }
    var viewDelegate: ListViewModelViewDelegate? { get set }
    var coordinatorDelegate: ListViewModelCoordinatorDelegate? { get set}
    
    var title: String { get }
    
    var numberOfItems: Int { get }
    func itemAtIndex(_ index: Int) -> DataItem?
    func useItemAtIndex(_ index: Int)
}
