//
//  ViewController.swift
//  SendValue
//
//  Created by 1 on 2020/01/09.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var swc: UISwitch!
    @IBOutlet weak var sp: UIStepper!
    
    @IBOutlet weak var updateText: UILabel!
    @IBOutlet weak var intervalText: UILabel!
    
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            self.updateText.text = "갱신"
        }else{
            self.updateText.text = "갱신하지 않음"
        }
    }
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)마다."
    }
    
    @IBAction func submitButton(_ sender: Any) {
        guard let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "VC2") as? SecondVC else{
            return
        }
        
        vc2.paramTF = self.tf.text!
        vc2.paramSwit = self.swc.isOn
        vc2.paramStepper = self.sp.value
        
        self.present(vc2, animated: true)
        
    }
}

