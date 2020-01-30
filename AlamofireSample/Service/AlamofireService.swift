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


class AlamofireService {
    
    func fetchData(completion : @escaping ([Activity]) -> ()){
        let url = "http://fakerestapi.azurewebsites.net/api/Activities"
        Alamofire.request(url).responseArray { (response: DataResponse<[Activity]>) in
            if let activities = response.result.value{
                completion(activities)
                }
            }
        }
    func fetchDataByID(id : Int , completion : @escaping (Activity) -> ()){
        let url = "http://fakerestapi.azurewebsites.net/api/Activities"
        let fullURL = url + "/" + "\(id)"
        print("the ful URl is \(fullURL)")
        Alamofire.request(fullURL, method: .get, encoding: JSONEncoding.default).responseObject { (response: DataResponse<Activity>) in
            if let activity = response.result.value{
                completion(activity)
            }
        }
    }
        
       
    }


