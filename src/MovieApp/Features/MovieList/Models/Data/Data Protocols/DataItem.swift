//
//  DataItem.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 18/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation

protocol DataItem {
    var id: String { get }
    var title: String { get }
    var year: Int { get }
    var coverImage : String { get }
}
