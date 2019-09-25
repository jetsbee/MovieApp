//
//  DetailModel.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 25/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation

protocol DetailModel {
    func detail(_ completionHandler: @escaping (_ item: DataItem?) -> Void)
}
