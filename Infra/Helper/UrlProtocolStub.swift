//
//  UrlProtocolStub.swift
//  Infra
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

//Serve para simular o HTTP (Redirecionamento da web para cá)
public class UrlProtocolStub: URLProtocol {
    
    public static var completion: ((URLRequest)->Void)?
    
    public static func observerRequest(completion:@escaping(URLRequest)->Void){
        UrlProtocolStub.completion = completion
    }
    
    public override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    public override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    public override func startLoading() {
        UrlProtocolStub.completion?(request)
    }
    
    public override func stopLoading() {}
    
}
