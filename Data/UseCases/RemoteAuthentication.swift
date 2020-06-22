//
//  RemoteAuthentication.swift
//  Data
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Domain

public final class RemoteAuthentication:AuthenticationProtocol {
    
    
    
    private let url:URL
    private let httpPostClient:HttpPostClient
    
    public init(url:URL, httpPostClient:HttpPostClient) {
        self.url = url
        self.httpPostClient = httpPostClient
    }
    
    public func auth(authenticationModel:AuthenticationModel, completion:@escaping(AuthenticationProtocol.ResultLogin)->Void) {
        
        httpPostClient.post(to: url, with: authenticationModel.toData()) { [weak self] result in
            
            //se aconteceu o deinit o programa n precisa executar a clouser pois o usuario ja saiu da aplicacao
            guard self != nil else {return}
            
            switch result {
                
            case .success(let data):
                
                if let modelResponse:AccountAuthenticationModel = data?.toModel() {
                    
                    completion(.success(modelResponse))
                    
                }else {
                    
                    completion(.failure(.unexpected))
                }
                
            case .failure (let error):
                
                if error == .badRequest{
                    completion(.failure(.dataRequestError))
                }else{
                    completion(.failure(.unexpected))
                }
                
                
                
            }
            
        }
        
    }
}
