//
//  SignUpViewModel.swift
//  Presentation
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public struct SignUpViewModel: Equatable {
    
    public var name:String?
    public var email:String?
    public var password:String?
    public var passwordConfirmation:String?
    
    public init(name:String?, email:String?, password:String?, passwordConfirmation:String?) {
        self.name                   = name
        self.email                  = email
        self.password               = password
        self.passwordConfirmation   = passwordConfirmation
    }
    
}
