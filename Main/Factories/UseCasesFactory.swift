//
//  UseCasesFactory.swift
//  Main
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Domain
import Data

//class UseCases{
//    
//    private static let httpClient = AlamofireAdapter()
//    
//    static func makeRemoteAddAccount() -> AddAccount {
//        let remoteAddAccount = RemoteAddAccount(url: URL(string: HttpUrls.urlAddAccount)!, httpPostClient: httpClient)
//        
//        return MainQueueDecorator(remoteAddAccount) //Feito isso para aplicar o design pattern DEcorator para colocar o processo todo na Main Thread
//    }
//    
//    
//    private static let emailValidator = EmailValidatorAdapter()
//    
//    static func makeRemoteEmailValidator(email:String?) -> ValidEmail {
//        return RemoteEmailValidator(email: email, emailValidator: emailValidator)
//    }
//    
//}

func MakeRemoteAddAccount() -> AddAccountProtocol {
    let remoteAddAccount = RemoteAddAccount(url: URL(string: HttpUrls.urlAddAccount)!, httpPostClient: MakeAlamofireAdapter())
    
    return MainQueueDecorator(remoteAddAccount) //Feito isso para aplicar o design pattern DEcorator para colocar o processo todo na Main Thread
}

func MakeRemoteEmailValidator(email:String?) -> ValidEmail {
    return RemoteEmailValidator(email: email, emailValidator: MakeEmailValidatorAdapter())
}

func MakeRemoteAuthentication() -> AuthenticationProtocol {
    let remoteAuthentication = RemoteAuthentication(url: URL(string: HttpUrls.urlAddAccount)!, httpPostClient: MakeAlamofireAdapter())
    return MainQueueDecorator(remoteAuthentication)
}



