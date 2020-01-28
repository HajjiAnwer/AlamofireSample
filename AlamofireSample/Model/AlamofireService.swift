//
//  AlamofireService.swift
//  AlamofireSample
//
//  Created by Mehdi on 28/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import CoreData

class AlamofireService : UITableViewController{
    var modelArray = [EntityModel]()
    let newEntity = EntityModel()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func fetchData(){
        let url = "http://fakerestapi.azurewebsites.net/api/Activities"
        Alamofire.request(url).responseArray { (response: DataResponse<[Activity]>) in
            let activities = response.result.value
            if let activitiesArray = activities{
                DispatchQueue.main.async {
                for activity in activitiesArray{
                    print(activity.title)
                    self.newEntity.id = activity.id 
                    self.newEntity.dueDate = activity.dueDate
                    self.newEntity.name = activity.title
                    self.newEntity.complete = activity.completed!
                    self.modelArray.append(self.newEntity)
                    self.saveData()
                    }
                }
            }
        }
    }
    func saveData(){
        do{
            try context.save()
        }catch{
            print("error saving data \(error)")
        }
        tableView.reloadData()
    }
    
}

