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
        Alamofire.request(ConstantValue.fetchingUrl).responseArray { (response: DataResponse<[Activity]>) in
            if let activities = response.result.value{
                completion(activities)
                }
            }
        }
    func fetchDataByID(id : Int , completion : @escaping (Activity) -> ()){
        let fullURL = ConstantValue.fetchingUrl + "/" + "\(id)"
        Alamofire.request(fullURL, method: .get, encoding: JSONEncoding.default).responseObject { (response: DataResponse<Activity>) in
            if let activity = response.result.value{
                completion(activity)
            }
        }
    }
    func addData (param : [String : String], completion : @escaping () ->()){
        Alamofire.request(ConstantValue.addDataUrl, method: .post, parameters: param, encoding: JSONEncoding.default).responseJSON { (response) in
            let result = response.response?.statusCode
            if result == 200{
                completion()
            }
        }
    }
}
        
       
    


