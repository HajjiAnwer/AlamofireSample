//
//  ConstantValue.swift
//  AlamofireSample
//
//  Created by Mehdi on 30/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import Foundation
import Validator

struct ConstantValue {
    
    static let messageForInvalidField = "invalid inserted field"
    static let errorMessage = "error"
    static let completedActivity = "This activity is completed"
    static let notCompletedActivity = "This activity is not completed"
    static let fetchingUrl = "http://fakerestapi.azurewebsites.net/api/Activities"
    static let addDataUrl = "http://fakerestapi.azurewebsites.net/api/Activities"
    
    static let ruleLength = ValidationRuleLength(min: 3, max: 10, lengthType: .characters, error: CustomeError(message: "errorMsg"))
    static let ruleDueDate = "\\d{4}\\-\\d{2}\\-\\d{1,2}T\\d{2}\\:\\d{2}\\:\\d{2}\\.\\d{2,5}\\+\\d{2}\\:\\d{2}"
    
}
