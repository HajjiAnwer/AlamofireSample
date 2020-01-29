//
//  Activity.swift
//  AlamofireSample
//
//  Created by Mehdi on 27/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import Foundation
import ObjectMapper

class Activity: Mappable {
    var id : Int = 0
    var title : String? = ""
    var dueDate : String? = ""
    var completed : Bool? = false
    init(id : Int?, title: String?,dueDate: String?, completed: Bool?) {
        self.id = id!
        self.title = title!
        self.dueDate = dueDate!
        self.completed = completed!
    }
    required init?(map: Map) {

    }
    func mapping(map: Map) {
        id <- map["ID"]
        title <- map["Title"]
        dueDate <- map["DueDate"]
        completed <- map["Completed"]
    }
}
