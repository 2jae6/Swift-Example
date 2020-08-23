//
//  main.swift
//  Computed Properties
//
//  Created by 1 on 2020/08/22.
//  Copyright © 2020 wook. All rights reserved.
//

import Foundation
/*
struct Point{
    var x: Int
    var y: Int
    
    
    func oppsitePoint() -> Point{
        return Point(x: -x, y: -y)
    }
    
    mutating func setOppositePoint(_ opposite: Point){
        x = -opposite.x
        y = -opposite.y
    }
}

var position: Point = Point(x: 10, y: 20)

print(position)
print(position.oppsitePoint())
position.setOppositePoint(Point(x: 15, y: 10))
print(position)

*/


struct Point {
    var x: Int
    var y: Int
    
    var oppositionPoint: Point{
        get{
            return Point(x: 10, y: 20)
        }
        set(something){
            x = -something.x
            y = -something.y
        }
    }
}
