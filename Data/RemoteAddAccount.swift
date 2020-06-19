//
//  RemoteAddAccount.swift
//  Data
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Domain

public final class RemoteAddAccount: AddAccount {
    
    private let url:URL
    private let httpPostClient:HttpPostClient
    
    public init(url:URL, httpPostClient:HttpPostClient) {
        self.url = url
        self.httpPostClient = httpPostClient
    }
    
    public func add(addAccountModel:AddAccountModel, completion:@escaping(Result<AccountModel,DomainError>)->Void) {
        
        httpPostClient.post(to: url, with: addAccountModel.toData()) { [weak self] result in
            
            //se aconteceu o deinit o programa n precisa executar a clouser pois o usuario ja saiu da aplicacao
            guard self != nil else {return}
            
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
