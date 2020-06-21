//
//  DecoratorRemoteAddAccount.swift
//  Main
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Domain

extension MainQueueDecorator:AddAccount where T: AddAccount {
    
    public func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, DomainError>) -> Void) {
        
        instance.add(addAccountModel: addAccountModel) { [weak self] result in
            
            self?.dispatch {
                completion(result)
            }
            
        }
        
    }
    
}
