//
//  CustomeError.swift
//  AlamofireSample
//
//  Created by Mehdi on 30/01/2020.
//  Copyright © 2020 Mehdi. All rights reserved.
//

import Foundation
import Validator

class CustomeError: ValidationError {
    let message: String
    public init (message : String){
        self.message = message
    }
}
