//
//  EndpointType.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 19/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
}
