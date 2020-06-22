//
//  AuthenticationModel.swift
//  Domain
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public struct AuthenticationModel:Codable {
    public let email:String
    public let password:String
    
    public init(email:String, password:String) {
        self.email      = email
        self.password   = password
    }
}
