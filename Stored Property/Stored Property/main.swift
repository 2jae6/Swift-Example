//
//  main.swift
//  Stored Property
//
//  Created by 1 on 2020/08/21.
//  Copyright © 2020 wook. All rights reserved.
//

import Foundation

struct Point{
    var x: Int
    var y: Int
}

let pointObject: Point = Point(x: 5, y: 10)


class Position{
    var point: Point
    
    let name: String
    
    init(name: String, currentPoint: Point){
        self.name = name
        self.point = currentPoint
    }
    
}

let position: Position = Position(name: "이재욱", currentPoint: Point(x: 5, y: 10))
