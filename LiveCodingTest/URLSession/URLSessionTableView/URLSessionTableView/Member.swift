//
//  Member.swift
//  URLSessionTableView
//
//  Created by 1 on 2020/09/11.
//  Copyright © 2020 wook. All rights reserved.
//

import Foundation

struct Member: Decodable {
    var id: Int
    var name: String
    var avatar: String
    var job: String
    var age: Int
}
