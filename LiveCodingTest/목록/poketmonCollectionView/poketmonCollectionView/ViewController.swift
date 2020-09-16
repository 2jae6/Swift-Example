//
//  ViewController.swift
//  poketmonCollectionView
//
//  Created by 1 on 2020/09/10.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MonsterCell", bundle: .main), forCellWithReuseIdentifier: "MonsterCell")
        
        setupFlowLayout()
        
    }

    private func setupFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10

        let halfWidth = UIScreen.main.bounds.width / 3
        flowLayout.itemSize = CGSize(width: halfWidth * 0.9 , height: halfWidth * 0.9)
        self.collectionView.collectionViewLayout = flowLayout
    }
    
 
    
    
    var poketmons:[UIImage]{
        var poketmons:[UIImage] = []
        for i in 0 ..< 50{
            let index = i % 16
            let image = UIImage(named: "pokemon\(index)")!
            poketmons.append(image)

        }
        return poketmons
    }
    

    
    
    
}

extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonsterCell", for: indexPath) as? MonsterCell else{
            return UICollectionViewCell()
        }
        cell.imageView.image = poketmons[indexPath.row]
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate{
    
    
    
}

