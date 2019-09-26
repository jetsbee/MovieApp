//
//  MovieDataItem.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 18/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation

struct MovieDataItem: DataItem {
    let id: String
    let title: String
    let year: Int
    
    init(id: String, title: String, year: Int) {
        self.id = id
        self.title = title
        self.year = year
    }
}
