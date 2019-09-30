//
//  RawMovies.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 19/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation

struct RawMovies: Codable {
    struct Data: Codable {
        let movies: [Movies]
    }
    
    struct Movies: Codable {
        let id: Int
        let title: String
        let year: Int
        let large_cover_image: String
    }
    
    var data: Data
}
