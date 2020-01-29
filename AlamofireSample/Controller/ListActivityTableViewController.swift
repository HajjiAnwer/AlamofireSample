//
//  ListActivityTableViewController.swift
//  AlamofireSample
//
//  Created by Mehdi on 29/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import UIKit

class ListActivityTableViewController: UITableViewController {
    var arrayModel = [Activity]()
    let alamofireService = AlamofireService()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    func loadData(){
        alamofireService.fetchData { (activities) in
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
        alamofireService.fetchData { (activities) in
            self.arrayModel = activities
            cell.textLabel?.text = self.arrayModel[indexPath.row].title
        }
        return cell
    }
    
}
