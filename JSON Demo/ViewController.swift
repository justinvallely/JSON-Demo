//
//  ViewController.swift
//  JSON Demo
//
//  Created by Justin Vallely on 5/21/15.
//  Copyright (c) 2015 JMVapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlPath = "http://www.telize.com/geoip"
        
        let url = NSURL(string: urlPath)
        
        let session = NSURLSession.sharedSession()
        
        // Downloads content of the URL and perfoms the task on completion
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            
            if error != nil {
                
                println(error)
                
            } else {
                
                // Take JSON data and convert it to an array or dictionary that we can work with
                let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                
                println(jsonResult)
                println(jsonResult["country_code3"]!)
            }
            
        })
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

