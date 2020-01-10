//
//  SecondVC.swift
//  SendValue
//
//  Created by 1 on 2020/01/09.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class SecondVC: UIViewController{
    
    
    @IBOutlet weak var resultTF: UILabel!
    @IBOutlet weak var resultSwit: UILabel!
    @IBOutlet weak var resultStepper: UILabel!
    
    
    var paramTF: String = ""
    var paramSwit: Bool = false
    var paramStepper: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultTF.text = paramTF
        self.resultSwit.text = (self.paramSwit == true ? "자동갱신" : "자동갱신안함")
        self.resultStepper.text = "\(Int(paramStepper)) 마다 갱신"
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
}
