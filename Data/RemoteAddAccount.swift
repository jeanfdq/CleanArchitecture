//
//  RemoteAddAccount.swift
//  Data
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Domain

public struct RemoteAddAccount: AddAccount {
    
    fileprivate let url:URL
    fileprivate let httpPostClient:HttpPostCliente
    
    public func add(addAccountModel:AddAccountModel, completion:@escaping(Result<AccountModel,DomainError>)->Void) {
        
        httpPostClient.post(to: url, with: addAccountModel.toData()) { result in
            
            switch result {
            case .success(let data):
                if let modelResponse:AccountModel = data?.toModel() {
                    completion(.success(modelResponse))
                }else {
                    completion(.failure(.unexpected))
                }
                
            case .failure:
                completion(.failure(.unexpected))
                
            }
            
            completion(.failure(.unexpected))
        }
        
    }
}
