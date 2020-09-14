//
//  ViewController.swift
//  DelegatePattern
//
//  Created by 1 on 2020/09/12.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit
protocol DeliveryDataProtocol: class{
    func deliveryData(_ data: String)
}

class ViewController: UIViewController, DeliveryDataProtocol {
    func deliveryData(_ data: String) {
        dataLabel.isHidden = false
        dataLabel.text = data
    }
    

    @IBOutlet weak var dataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLabel.isHidden = true
        
    }

    @IBAction func nextButtonAction(_ sender: Any) {
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else{
            return
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        vc.delegate = self
        
    }
    
}

