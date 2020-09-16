//
//  ViewController.swift
//  CollectionView
//
//  Created by 1 on 2020/09/12.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let url = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"
    var memberArray: [Member] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
    }
    
    
    
    
    func getData(){
        let task = URLSession.shared.dataTask(with: URL(string: url)!){ data, _, error in
            if let error = error{
                print(error)
                return
            }
            guard let data = data,
                let member = try? JSONDecoder().decode([Member].self, from: data) else{
                    print("성공")
                    return
            }
            self.memberArray = member
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        task.resume()
    }
    
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(memberArray.count)
        return memberArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemberCell", for: indexPath) as! CustomCell
        let item = memberArray[indexPath.row]
        cell.setData(item)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewCellWithd = collectionView.frame.width / 3 - 1
        
        return CGSize(width: collectionViewCellWithd, height: collectionViewCellWithd)
        
    }
    //윗라인
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

            return 1

        }

        //옆 라인 간격

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

            return 1

        }

    

   
    
}
class CustomCell: UICollectionViewCell{
    
    @IBOutlet var imageView: UIImageView!
    //var member: Member!
    
    func setData(_ data: Member){
        
        self.loadImage(img: data.avatar)
    }
    
    
    
    func loadImage(img: String){
        var returnImage: UIImage?
        let task = URLSession.shared.dataTask(with: URL(string: img)!){data, _, err in
            if let err = err{
                print("에러")
                return
            }
            
            guard let data = data,
                let image = UIImage(data: data) else{
                    print("에러")
                    return
            }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
           
        }
        task.resume()
    
    }
}
