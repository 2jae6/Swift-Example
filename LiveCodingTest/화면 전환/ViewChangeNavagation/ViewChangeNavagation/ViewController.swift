//
//  ViewController.swift
//  ViewChangeNavagation
//
//  Created by 1 on 2020/09/10.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeButton(_ sender: Any) {
//        let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondView")
//        self.navigationController?.pushViewController(uvc!, animated: true)
//
        
        
        guard let uvc = storyboard?.instantiateViewController(identifier: "SecondView") else{
            return
        }
        
        self.navigationController?.pushViewController(uvc, animated: false)
    }
    
}

