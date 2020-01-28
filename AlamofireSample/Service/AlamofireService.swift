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

class AlamofireService {
    func fetchData(completion: @escaping ([Activity]) -> ()){
        let url = "http://fakerestapi.azurewebsites.net/api/Activities"
        Alamofire.request(url).responseArray { (response: DataResponse<[Activity]>) in
            let activities = response.result.value
            if let activitiesArray = activities{
                        completion(activitiesArray)
                    }
                }
            }
}

