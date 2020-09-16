//
//  ViewController.swift
//  URLSessionTableView
//
//  Created by 1 on 2020/09/10.
//  Copyright © 2020 wook. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    let url = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"
    var memberArray: [Member] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    func copy(){
 
        let task = URLSession.shared.dataTask(with: URL(string: url)!){ data, _, error in
            if let error = error{
                print(error)
                return
            }
            
            guard let data = data,
                let members = try? JSONDecoder().decode([Member].self, from: data) else{
                    
                    return
            }
        }
            
        
    }
    
    func getData(){
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            guard let memberData = data,
                let members = try? JSONDecoder().decode([Member].self, from: memberData)  else {
                    print("성공")
                    return
            }
            self.memberArray = members
            //print(members)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        
        task.resume()
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberItemCell", for: indexPath) as! MemberItemCell
        let item = memberArray[indexPath.row]
        cell.setData(item)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("전")
        guard let uvc = segue.destination as? DetailViewController,
        let data = sender as? Member
            else{
            print("죽음")
            return
        }
        uvc.memberArray = data
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("후")
        let item = memberArray[indexPath.row]
        performSegue(withIdentifier: "toNext", sender: item)

    }
    
    
    
}
