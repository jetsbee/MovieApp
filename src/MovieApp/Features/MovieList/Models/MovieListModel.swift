//
//  MovieListModel.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 18/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation

class MovieListModel: ListModel {
    fileprivate var items = [DataItem]()
    
    init() {
        createDataItems()
    }
    
    fileprivate func createDataItems() {
        items.append(MovieDataItem(id: "0", title: "해리포터1"))
        items.append(MovieDataItem(id: "1", title: "해리포터2"))
        items.append(MovieDataItem(id: "2", title: "해리포터3"))
        items.append(MovieDataItem(id: "3", title: "해리포터4"))
        items.append(MovieDataItem(id: "4", title: "해리포터5"))
    }
    
    func items(_ completionHandler: @escaping (_ items: [DataItem]) -> Void) {
        // Simulate Aysnchronous data access
        DispatchQueue.global().async {
            completionHandler(self.items)
        }
    }
}
