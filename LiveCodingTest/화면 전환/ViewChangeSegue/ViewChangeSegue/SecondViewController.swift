//
//  SecondViewController.swift
//  ViewChangeSegue
//
//  Created by 1 on 2020/09/10.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    var str =  ""
    @IBOutlet var textLabel: UILabel!
    
    override func viewDidLoad() {
        print(str)
        textLabel?.text = str
    }

}
