//
//  ViewController.swift
//  PresentDismiss
//
//  Created by 1 on 2020/01/01.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNext(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else{
            return
        }

        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical

        self.present(uvc, animated: true)
    }
    
}

