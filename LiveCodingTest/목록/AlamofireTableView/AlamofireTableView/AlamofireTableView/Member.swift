//
//  Member.swift
//  AlamofireTableView
//
//  Created by 1 on 2020/09/11.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit
import ObjectMapper

struct Member: Mappable {
    var id: Int
    var name: String
    var avatar: String
    var job: String
    var age: Int

    required init?(map: Map) {
    }
    
     func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        avatar <- map["avatar"]
        job <- map["job"]
        age <- map["age"]
        
    }
    
}
