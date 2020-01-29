//
//  ViewController.swift
//  AlamofireSample
//
//  Created by Mehdi on 29/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var contentLabel: UILabel!
    let alamofireService = AlamofireService()
    override func viewDidLoad() {
        super.viewDidLoad()
//        alamofireService.fetchData { (activity) in
//            self.contentLabel.text = activity.title!
//        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
