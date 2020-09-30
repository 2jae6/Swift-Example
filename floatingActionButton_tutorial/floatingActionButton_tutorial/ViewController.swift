//
//  ViewController.swift
//  floatingActionButton_tutorial
//
//  Created by 1 on 2020/09/29.
//

import UIKit
import JJFloatingActionButton

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let actionButton = JJFloatingActionButton()

        actionButton.addItem(title: "item 1", image: UIImage(named: "First")?.withRenderingMode(.alwaysTemplate)) { item in
          // do something
        }

        actionButton.addItem(title: "item 2", image: UIImage(named: "Second")?.withRenderingMode(.alwaysTemplate)) { item in
          // do something
        }

        actionButton.addItem(title: "item 3", image: nil) { item in
          // do something
        }

        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true

        // last 4 lines can be replaced with
        // actionButton.display(inViewController: self)
    }


}

