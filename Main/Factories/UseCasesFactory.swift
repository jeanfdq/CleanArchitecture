//
//  UseCasesFactory.swift
//  Main
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Data
import Infra
import Domain

class UseCases{
    
    private static let httpClient = AlamofireAdapter()
    
    static func makeRemoteAddAccount() -> AddAccount {
        let url = URL(string: HttpUrls.urlAddAccount)!
        let remoteAddAccount = RemoteAddAccount(url: url, httpPostClient: httpClient)
        
        return MainQueueDecorator(remoteAddAccount) //Feito isso para aplicar o design pattern DEcorator para colocar o processo todo na Main Thread
    }
    
    
    private static let emailValidator = EmailValidatorAdapter()
    
    static func makeRemoteEmailValidator(email:String?) -> ValidEmail {
        return RemoteEmailValidator(email: email, emailValidator: emailValidator)
    }
    
}



