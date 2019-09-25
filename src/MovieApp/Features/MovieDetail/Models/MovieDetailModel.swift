//
//  MovieDetailModel.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 25/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation

class MovieDetailModel: DetailModel {
    
    fileprivate var item: DataItem?
    
    init(detailItem: DataItem) {
        self.item = detailItem
    }
    
    func detail(_ completionHandler: @escaping (_ item: DataItem?) -> Void) {
        // Simulate Aysnchronous data access
        DispatchQueue.global().async {
            completionHandler(self.item)
        }
    }
}
