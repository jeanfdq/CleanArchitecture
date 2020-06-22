//
//  LoginViewModel.swift
//  Presentation
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Domain

public struct LoginRequestViewModel {
    public let email:String?
    public let password:String?
    
    public init(email:String?, password:String?) {
        self.email      = email
        self.password   = password
    }
    
        
    func toAuthenticationModel() -> AuthenticationModel? {
        
        guard let email = self.email, let password = self.password else {return nil}
        
        return AuthenticationModel(email: email, password: password)
    }

}
