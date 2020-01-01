//
//  ViewController.swift
//  PresentDismiss
//
//  Created by 1 on 2020/01/01.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}

