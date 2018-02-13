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
    let activityIndicator = UIActivityIndicatorView()

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
            
            performUIUpdatesOnMain {
                if let data = try? Data(contentsOf: url) {
                    
                    let json = JSON(data:data)
                    
                    if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                        
                        self.parse(json: json)
                        
                        return
                        //return will break viewDidLoad
                    }
                }

            }
        }
        
//        showError()
        
    }
    
    func parse(json:JSON) {
        
        for result in json["results"].arrayValue {
            
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = ["title": title,"body": body,"sigs": sigs]
            
            petitions.append(obj)
            print("%%% parse got called inside the loop %%%%%%%%%   ")

        }
        print("%%% parse got called %%%%%%%%%   ")

        tableView.reloadData()
    }
    
    
    //MARK: showError in alerView
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "there was a problem loading the feed;please try again", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //MARK: - set up indicator
//        activityIndicator.center = view.center
//        activityIndicator.hidesWhenStopped = true
//        activityIndicator.activityIndicatorViewStyle = .gray
//        self.view.addSubview(activityIndicator)
//        activityIndicator.startAnimating()
//        UIApplication.shared.beginIgnoringInteractionEvents()
        

//        //stop indicator after view appear
//        activityIndicator.stopAnimating()
//        UIApplication.shared.endIgnoringInteractionEvents()

        print("%%% numberOfRowsInSection got called %%%%%%%%%   ")
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row] // read out dictionary
        cell.textLabel?.text = petition["title"]
        cell.detailTextLabel?.text = petition["body"]
        print("%%% cellForRowAt got called %%%%%%%%%   ")

        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }


}

