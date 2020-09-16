//
//  MemberItemCell.swift
//  URLSessionTableView
//
//  Created by 1 on 2020/09/11.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit


class MemberItemCell: UITableViewCell{
    
    @IBOutlet var avarta: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var job: UILabel!
    @IBOutlet var age: UILabel!

    func setData(_ data: Member){
        
        
        name.text = data.name
        job.text = data.job
        age.text = "\(data.age)"
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
                self.avarta.image = image
            }
            
            
            
        }
        task.resume()
    }
}
