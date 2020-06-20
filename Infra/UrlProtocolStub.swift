//
//  UrlProtocolStub.swift
//  Infra
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

class UrlProtocolStub: URLProtocol {
    
    static var completion: ((URLRequest)->Void)?
    
    static func observerRequest(completion:@escaping(URLRequest)->Void){
        UrlProtocolStub.completion = completion
    }
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        UrlProtocolStub.completion?(request)
    }
    
    override func stopLoading() {}
    
}
