//
//  DetailViewController3.swift
//  Project7
//
//  Created by sam on 2/13/18.
//  Copyright © 2018 patrick. All rights reserved.
//

import UIKit
import WebKit


class DetailViewController3: UIViewController {

    override func viewDidLoad() {
        let photo = UIImageView()
        photo.frame = CGRect(x: 170, y: 318, width: 200, height: 200)
        photo.image = UIImage(named: "finn")
        
        view.addSubview(photo)
        
    }
    
}
