//
//  AuthenticationProtocol.swift
//  Domain
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public protocol AuthenticationProtocol {
    typealias ResultLogin = Swift.Result<AccountAuthenticationModel,DomainError>
    func auth(authenticationModel:AuthenticationModel, completion:@escaping(ResultLogin)->Void)
}


