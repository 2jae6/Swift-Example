//
//  ViewController.swift
//  SingletonPattern
//
//  Created by 1 on 2020/09/12.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit
class SingletonClass{
    static let shared = SingletonClass()
    var x = 0
    
    private init(){
        
    }
}
class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let sing1 = SingletonClass.shared
        sing1.x = 5
        
        let sing2 = SingletonClass.shared
        sing2.x = 10
        
        
    }


}

