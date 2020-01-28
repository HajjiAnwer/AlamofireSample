//
//  ListActivityViewController.swift
//  AlamofireSample
//
//  Created by Mehdi on 28/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import CoreData

class ListActivityViewController: UITableViewController {
    
    var activities = [EntityModel]()
    let alamofireService = AlamofireService()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveData()
        retrieveData()
        for i in 0 ... (activities.count-1){
            print(activities[i].id)
        }
    }
    
  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! ActivityCell
        cell.titleLabel.text = activities[indexPath.row].name
        return cell
    }
    
    func retrieveData(request : NSFetchRequest<EntityModel> = EntityModel.fetchRequest())  {
        do{
            activities = try context.fetch(request)
        }catch{
            print("error fetching context \(error)")
        }
    }
    
    func saveData()  {
        alamofireService.fetchData { (activitiesArray) in
            let newEntity = EntityModel(context: self.context)
            for activity in activitiesArray {
                newEntity.name = activity.title
                newEntity.id = activity.id
                newEntity.complete = activity.completed!
                newEntity.dueDate = activity.dueDate
                self.activities.append(newEntity)
                self.save()
            }
        }
    }
    func save()  {
        do{
            try context.save()
            print("successufull saving context")
        }catch{
            print("error saving context \(error)")
        }
        tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
