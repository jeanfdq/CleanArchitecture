//
//  EmailValidatorAdapter.swift
//  Infra
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import UIKit
import Data
import EmailValidator

public class EmailValidatorAdapter: EmailValidatorData {
    
    public init(){}
    
    public func isValid(email:String?) -> Bool {
        
        guard let email = email else {return false}
        return EmailValidator.validate(email: email)
    }
    
    
}

