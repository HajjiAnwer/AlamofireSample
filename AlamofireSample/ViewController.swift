//
//  ViewController.swift
//  AlamofireSample
//
//  Created by Mehdi on 26/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {
    @IBOutlet weak var contentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "http://fakerestapi.azurewebsites.net/api/Activities"
//        Alamofire.request(url).responseObject { (response: DataResponse<[Activity]>) in
//
//        }
        
        Alamofire.request(url).responseArray { (DataResponse<[Activity]>) in
            
        }
    }
}




