//
//  ViewController.swift
//  Gesture
//
//  Created by 1 on 2020/09/14.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapGesture(_ sender: Any) {
        
        print("fff")
        
        self.view.endEditing(true)
    }
    

}

