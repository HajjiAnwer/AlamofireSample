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
            return false
        case .valid:
             return true
        }
    }
    
    func displayValidation<T:ValidationRule>(textField: UITextField ,rule:T) ->Bool {
        switch resultOfValidation(textField: textField, rule: rule){
        case true :
            textField.textColor = UIColor.green
            return true
        case false :
            modifierTextFieldWhenInvalid(textField: textField)
            return false
        }
    }
    
    func validateID(textField : UITextField) -> Bool {
        if Int(textField.text!) != nil {
            textField.textColor = UIColor.green
            return true
        }
        modifierTextFieldWhenInvalid(textField: textField)
        return false
    }
    
    func validateCompletedActivity(textField: UITextField) -> Bool {
        let completedRule = ValidationRulePattern(pattern: ".*completed.*", error: CustomeError(message: ConstantValue.errorMessage))
        let notCompletedRule = ValidationRulePattern(pattern: ".*not completed.*", error: CustomeError(message: ConstantValue.errorMessage))
        let resultOfCompleted = textField.validate(rule: completedRule)
        let resultOfnotCompleted = textField.validate(rule: notCompletedRule)
        switch resultOfCompleted {
        case .valid:
            textField.textColor = UIColor.green
            return true
        case .invalid:
            switch resultOfnotCompleted{
            case .valid:
                textField.textColor = UIColor.green
                return true
            case .invalid:
                modifierTextFieldWhenInvalid(textField: textField)
                return false
            }
        }
    }
    
    func modifierTextFieldWhenInvalid (textField : UITextField){
        textField.textColor = UIColor.red
        textField.text = ConstantValue.messageForInvalidField
    }
}
