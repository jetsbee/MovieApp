//
//  YTSApi.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 19/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation

enum YTSApi {
    case movies(limit: Int, minimumRating: Int)
}

extension YTSApi: EndpointType {
    var baseURL: URL {
        return URL(string: "https://yts.lt/api/v2/list_movies.json")!
    }
    
    var path: String {
        switch self {
        case .movies(let limit, let minimumRating):
            return "?limit=\(limit)&minimum_rating=\(minimumRating)"
        }
    }
}
