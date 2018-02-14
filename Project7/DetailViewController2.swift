//
//  DetailViewController2.swift
//  Project7
//
//  Created by Patrick on 2/13/18.
//  Copyright © 2018 patrick. All rights reserved.
//

import UIKit
import WebKit


class DetailViewController2: UIViewController {
    
    var webView: WKWebView!
    var detailItem: [String: String]!
    
    override func loadView() {
        
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard detailItem != nil else {return}
        
        if let body = detailItem["body"] {
            
            var html = "<html>"
            html += "<head>"
            html += "<meta name =\"viewport\" content=\"width=device-width, initial-scale=1\">"
            html += "<style> body { font-zie:1%; } </style>"
            html += "<head>"
            html += "<body>"
            html += body
            html += "<body>"
            html += "<html>"
            
            webView.loadHTMLString(html, baseURL: nil)
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
