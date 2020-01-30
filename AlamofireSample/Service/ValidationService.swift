//
//  ValidationService.swift
//  AlamofireSample
//
//  Created by Mehdi on 30/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import Foundation
import Validator

class ValidationService {
 
    func resultOfValidation<T: ValidationRule>(textField :UITextField, rule : T) ->Bool  {
        let result = textField.validate(rule: rule)
        switch result {
        case .invalid:
            print("invalid inserted field")
            return false
        case .valid:
            print("valid inserted field")
             return true
        }
    }
    
    func displayValidation<T:ValidationRule>(textField: UITextField ,rule:T) ->Bool {
        switch resultOfValidation(textField: textField, rule: rule){
        case true :
            textField.textColor = UIColor.green
            return true
        case false :
            textField.textColor = UIColor.red
            textField.text = "invalid inserted field"
            return false
        }
    }
    
    func validateID(textField : UITextField) -> Bool {
        if Int(textField.text!) != nil {
            textField.textColor = UIColor.green
            return true
        }
        textField.textColor = UIColor.red
        textField.text = "invalid inserted field"
        return false
    }
    
    func validateCompletedActivity(textField: UITextField) -> Bool {
        let completedRule = ValidationRulePattern(pattern: ".*completed.*", error: CustomeError(message: "error"))
        let notCompletedRule = ValidationRulePattern(pattern: ".*not completed.*", error: CustomeError(message: "error"))
        let resultOfCompleted = textField.validate(rule: completedRule)
        let resultOfnotCompleted = textField.validate(rule: notCompletedRule)
        switch resultOfCompleted {
        case .valid:
            print("valid")
            textField.textColor = UIColor.green
            return true
        case .invalid:
            switch resultOfnotCompleted{
            case .valid:
                print("valid")
                textField.textColor = UIColor.green
                return true
            case .invalid:
                print("invalid")
                textField.textColor = UIColor.red
                textField.text = "invalid inserted field"
                return false
            }
        }
    }
}
