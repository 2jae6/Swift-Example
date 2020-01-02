//
//  ViewController.swift
//  PushPop
//
//  Created by 1 on 2020/01/02.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func moveBack(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}

