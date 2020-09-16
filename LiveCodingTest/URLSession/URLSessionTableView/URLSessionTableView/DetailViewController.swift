//
//  DetailViewController.swift
//  URLSessionTableView
//
//  Created by 1 on 2020/09/12.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var memberArray: Member!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
    
    
    override func viewDidLoad() {
        
        setData(memberArray)
    }
    
    func setData(_ data: Member){

        name.text = data.name
        self.loadImage(url: data.avatar)
 
    }
    
    
    func loadImage(url: String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            guard let memberImage = data,
                let image = UIImage(data:memberImage)  else {
                    print("성공")
                    return
            }
            DispatchQueue.main.async {
                self.imageView.image = image
                print(image)
            }
            
            
            
        }
        task.resume()
    }
    
//
//    @IBAction override func unwind(Segue: ) {
//        
//    }
}

