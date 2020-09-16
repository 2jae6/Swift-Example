//
//  ViewController.swift
//  ViewChangeSegue
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

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondViewController = segue.destination as? SecondViewController else{
            return
        }
        secondViewController.str = "재욱"
        
    }

    @IBAction func changeButton(_ sender: Any) {
        
        performSegue(withIdentifier: "SecondView", sender: self)
    }
    
    @IBAction func unwindToVC(_ segue: UIStoryboardSegue){

     
     }
}

