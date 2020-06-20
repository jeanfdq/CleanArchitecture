//
//  InfraTests.swift
//  InfraTests
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import XCTest
import Alamofire


class AlamofireAdapter {
    
    private let session: Session

    init( with session:Session = .default) {
        self.session = session
    }

    func post(to url:URL) {
        session.request(url).resume()
    }
    
}


class AlamofireAdapterTeste: XCTestCase {

    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let url = URL(string: "https://any_url.com.br")!
        let config = URLSessionConfiguration.default
        config.protocolClasses = [UrlProtocolStub.self]
        let session = Session(configuration: config)
        let sut = AlamofireAdapter(with: session)
        sut.post(to: url)
        let exp = expectation(description: "waiting")
        UrlProtocolStub.observerRequest { (request) in
            XCTAssertEqual(url, request.url)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }

}

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
