//
//  ViewController.swift
//  CollectionView
//
//  Created by 1 on 2020/09/10.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    let palette: [UIColor] = [.red, .orange, .yellow, .green, .blue]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ColorCell.self, forCellWithReuseIdentifier: "\(ColorCell.self)")
         
    }


}

extension ViewController: UICollectionViewDataSource{
    //cell을 몇개를 띄울지를 정하는 필수 메소드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return palette.count
    }
    
    //cell을 띄워주기 위한 필수 메소드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ColorCell else{
            return UICollectionViewCell()
        }
        cell.imageView.backgroundColor = palette[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate{
    
}
