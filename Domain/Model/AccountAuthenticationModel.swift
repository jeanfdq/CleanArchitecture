//
//  AccountAuthenticationModel.swift
//  Domain
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public struct AccountAuthenticationModel:Decodable {
    public let accessToken:String
    public let name:String
    
    public init(ccessToken:String, name:String) {
        self.accessToken = ccessToken
        self.name        = name
    }
}
