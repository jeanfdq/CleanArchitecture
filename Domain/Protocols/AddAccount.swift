//
//  AddAccount.swift
//  Domain
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public protocol AddAccount {
    func add(addAccountModel:AddAccountModel, completion:@escaping(Result<AccountModel,DomainError>)->Void)
}
