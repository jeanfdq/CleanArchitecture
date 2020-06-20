//
//  AccountModel.swift
//  Domain
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public struct AccountModel:Codable, Equatable {
    public let id:String
    public let name:String
    public let email:String
    
    public init(id:String, name:String, email:String, password:String) {
        self.id                     = id
        self.name                   = name
        self.email                  = email
    }
}
