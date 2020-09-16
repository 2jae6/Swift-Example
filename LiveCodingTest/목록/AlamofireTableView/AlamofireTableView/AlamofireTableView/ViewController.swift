//
//  ViewController.swift
//  AlamofireTableView
//
//  Created by 1 on 2020/09/10.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    
    
    let url = "https://my.api.mockaroo.com/members_with_avatar.json"
    //  let url = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"
    
    let param: Parameters = [
        "key" : "44ce18f0"
    ]
    
    func getData() {
        
//        AF.request(url, method: .get, parameters: param, encoding: URLEncoding.default).responseObject{
//            (response: DataResponse<Member>) in
//            let tmConvertDTO = response.result.value
//
//
//            //defData에 집어넣기
//            self.defData.tmX = tmConvertDTO!.documents![0].x!
//            self.defData.tmY = tmConvertDTO!.documents![0].y!
//
//
//            self.nearChecker()
//
//        }
        
        
        AF.request(url, method: .get, parameters: param, encoding: URLEncoding.default).responseJSON{
            (response) in
            switch response.result{
            case .success(let suc):
                print(suc)
                print("성공")
            case .failure(let err):
                print(err)
                print("실패")
            }
        }
        
    }
    
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
    
}

