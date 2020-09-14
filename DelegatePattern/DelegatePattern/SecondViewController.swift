//
//  SecondViewController.swift
//  DelegatePattern
//
//  Created by 1 on 2020/09/12.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    
    weak var delegate:DeliveryDataProtocol?
    
    @IBAction func preButtonAction(_ sender: Any) {
        delegate?.deliveryData("이게바로 델리게이트다!!!")
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
}
