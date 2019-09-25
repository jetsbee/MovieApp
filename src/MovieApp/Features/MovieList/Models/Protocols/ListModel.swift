//
//  ListModel.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 18/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import Foundation

protocol ListModel {
    func items(_ completionHandler: @escaping (_ items: [DataItem]) -> Void)
    func setItems(_ items: [DataItem])
}
