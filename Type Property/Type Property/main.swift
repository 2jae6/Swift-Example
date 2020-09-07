//
//  main.swift
//  Type Property
//
//  Created by 1 on 2020/08/26.
//  Copyright © 2020 wook. All rights reserved.
//

import Foundation

print("Hello, World!")

class ExamClass{
    
    static var typeProperty: Int = 0
    
    var instanceProperty: Int = 0{
        didSet{
            ExamClass.typeProperty = instanceProperty + 10
        }
    }
    
    static var typeComputedProperty: Int{
        get{
            return typeProperty
        }
        set{
            typeProperty = newValue
        }
    }
    
}

ExamClass.typeProperty = 30

let classInstance: ExamClass = ExamClass()
classInstance.instanceProperty = 100

print(ExamClass.typeProperty)
print(ExamClass.typeComputedProperty)
