//
//  RemoteEmailValidator.swift
//  Data
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Domain

public class RemoteEmailValidator:ValidEmail {
    
    private let emailValidator:EmailValidatorData
    private let email:String?
    
    public init(email:String?, emailValidator:EmailValidatorData) {
        self.email = email
        self.emailValidator = emailValidator
    }
    
    public func validEmailDomain(email: String?) -> Bool {
        
        return emailValidator.isValid(email: email)
        
    }
    
    
}
