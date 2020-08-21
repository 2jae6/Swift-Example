//
//  main.swift
//  LazyStoedProperties
//
//  Created by 1 on 2020/08/21.
//  Copyright © 2020 wook. All rights reserved.
//

import Foundation

struct Point{
    var x: Int = 0
    var y: Int = 0
}

class Position{
    lazy var point: Point = Point()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let position: Position = Position(name: "재욱")
//현재 lazy 키워드 덕에 point를 사용하지 않아서 Point 객체 생성 X
