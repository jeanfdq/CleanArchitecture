//
//  DecoratorRemoteAddAccount.swift
//  Main
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Domain

extension MainQueueDecorator:AddAccountProtocol where T: AddAccountProtocol {
    
    public func add(addAccountModel: AddAccountModel, completion: @escaping (ResultApi) -> Void) {
        
        instance.add(addAccountModel: addAccountModel) { [weak self] result in
            
            self?.dispatch {
                completion(result)
            }
            
        }
        
    }
    
}

extension MainQueueDecorator:AuthenticationProtocol where T: AuthenticationProtocol {
    
    public func auth(authenticationModel: AuthenticationModel, completion: @escaping (ResultLogin) -> Void) {
        
        instance.auth(authenticationModel: authenticationModel) { [weak self] result in
            
            self?.dispatch {
                completion(result)
            }
            
        }
    }
    
}
