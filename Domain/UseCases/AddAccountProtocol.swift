//
//  AddAccount.swift
//  Domain
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public protocol AddAccountProtocol {
    
    //Retorno de api sempre utilizar typealias por conta de mudar o result
    typealias ResultApi = Swift.Result<AccountModel,DomainError>
    func add(addAccountModel:AddAccountModel, completion:@escaping(ResultApi)->Void)
}
