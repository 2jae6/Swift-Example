//
//  ViewController.swift
//  CallbackClosure
//
//  Created by 1 on 2020/09/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //기본 콜백 클로져
    func someFunction(someClosure: () -> ()){
        
        
        someClosure()
    }
    
    //
    var handlers: [() -> ()] = []
    
    func mainFunction(completion: @escaping () -> ()) -> Int{
        handlers.append(completion)
    }
    
}



