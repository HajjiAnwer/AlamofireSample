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
    
    required init?(map: Map) {

    }
    func mapping(map: Map) {
        id <- map["ID"]
        title <- map["Title"]
        dueDate <- map["DueDate"]
        completed <- map["Completed"]
    }
}
