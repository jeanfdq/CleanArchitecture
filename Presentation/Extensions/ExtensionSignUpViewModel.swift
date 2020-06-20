//
//  ExtensionSignUpViewModel.swift
//  Presentation
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Domain

extension SignUpViewModel {
    
    func toAddAccountModel() -> AddAccountModel? {
        
        guard let name = self.name, let email = self.email, let password = self.password, let passwordConfirmation = self.passwordConfirmation else {return nil}
        
        return AddAccountModel(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
    }
}
