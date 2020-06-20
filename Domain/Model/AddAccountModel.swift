//
//  AddAccountModel.swift
//  Domain
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public struct AddAccountModel:Encodable , Equatable{
    
    public let name:String
    public let email:String
    public let password:String
    public let passwordConfirmation:String
    
    public init(name:String, email:String, password:String, passwordConfirmation:String) {
        self.name                   = name
        self.email                  = email
        self.password               = password
        self.passwordConfirmation   = passwordConfirmation
    }
}
