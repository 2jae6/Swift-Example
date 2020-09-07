//
//  main.swift
//  Property Observers
//
//  Created by 1 on 2020/08/24.
//  Copyright © 2020 wook. All rights reserved.
//

import Foundation

class Number{
    
    var num: Int = 0{
        willSet{
            print("num이 \(num)에서 \(newValue)으로 변경 될 예정")
        }
        didSet{
            print("num이 \(oldValue)에서 \(num)으로 변경 완료")
        }
        
    }
}

let number: Number = Number()
number.num = 10
//num이 0에서 10으로 변경 될 예정
//num이 0에서 10으로 변경 완료

