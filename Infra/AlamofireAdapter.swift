//
//  AlamofireAdapter.swift
//  Infra
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Alamofire
import Data


public class AlamofireAdapter:HttpPostClient {
    
    private let session: Session
    
    public init( with session:Session = .default) {
        self.session = session
    }
    
    public func post(to url:URL, with data:Data?, completion:@escaping(Result<Data?,HttpError>)->Void) {
        
        session.request(url, method: HTTPMethod.post, parameters: data?.toJSON(), encoding: JSONEncoding.default).response { (dataResponse) in
            
            guard let statusCode = dataResponse.response?.statusCode else { return completion(.failure(.noConnectivity)) }
            
            
            switch dataResponse.result {
                case .failure: completion(.failure(.noConnectivity))
                case .success(let data):
                    
                    switch statusCode {
                    case 200...299:
                        completion(.success(data!))
                    case 401:
                        completion(.failure(.unauthorized))
                    case 403:
                        completion(.failure(.forbiden))
                    case 400...499:
                        completion(.failure(.badRequest))
                    case 500...599:
                        completion(.failure(.serverError))
                    default:
                        completion(.failure(.noConnectivity))
                    }
                    
                }
            
        }
    }
    
}
