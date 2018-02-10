//
//  ViewController.swift
//  Project7
//
//  Created by Patrick on 2/9/18.
//  Copyright © 2018 patrick. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [[String: String]]() //array of dictionary

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("current tag in navigation Controller is : \(navigationController?.tabBarItem.tag)")
        print("current tag in Tabbar Controller is : \(tabBarController?.tabBarItem.tag)")
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
            
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }
        if let url = URL(string: urlString) {
            
            if let data = try? Data(contentsOf: url) {
                
                let json = JSON(data:data)
                
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    
                    parse(json: json)
                    
                    return
                    //return will return to the
                }
            }
        }
        
        showError()
        
    }
    
    func parse(json:JSON) {
        
        for result in json["results"].arrayValue {
            
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = ["title": title,"body": body,"sigs": sigs]
            
            petitions.append(obj)
            
        }
        tableView.reloadData()
    }
    
    
    //MARK: showError in alerView
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "there was a problem loading the feed;please try again", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row] // read out dictionary
        cell.textLabel?.text = petition["title"]
        cell.detailTextLabel?.text = petition["body"]
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }


}

