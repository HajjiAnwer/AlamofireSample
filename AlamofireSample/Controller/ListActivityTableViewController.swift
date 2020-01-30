//
//  ListActivityTableViewController.swift
//  AlamofireSample
//
//  Created by Mehdi on 29/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import UIKit
import PKHUD

class ListActivityTableViewController: UITableViewController {
    var arrayModel = [Activity]()
    let alamofireService = AlamofireService()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    func loadData(){
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        alamofireService.fetchData { (activities) in
            PKHUD.sharedHUD.hide()
            self.arrayModel = activities
            print(self.arrayModel.count)
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayModel.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellModel", for: indexPath)
        cell.textLabel?.text = self.arrayModel[indexPath.row].title
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        vc?.id = arrayModel[indexPath.row].id
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
