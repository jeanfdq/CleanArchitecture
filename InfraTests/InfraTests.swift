//
//  InfraTests.swift
//  InfraTests
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import XCTest
import Alamofire
import Data
import Infra

class AlamofireAdapterTeste: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_post_should_make_valid_url_and_method_and_not_null_body() throws {
        
        let url = makeUrl()
        let config = URLSessionConfiguration.default
        config.protocolClasses = [UrlProtocolStub.self]
        let session = Session(configuration: config)
        let sut = AlamofireAdapter(with: session)
        sut.post(to: url, with: makeValidData()) { result in }
        let exp = expectation(description: "waiting")
        UrlProtocolStub.observerRequest { (request) in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual(HTTPMethod.post, request.method)
            XCTAssertNotNil(request.httpBodyStream)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        
    }
    
    func test_post_should_make_valid_url_and_method_and_null_body() throws {
        
        let url = makeUrl()
        let config = URLSessionConfiguration.default
        config.protocolClasses = [UrlProtocolStub.self]
        let session = Session(configuration: config)
        let sut = AlamofireAdapter(with: session)
        sut.post(to: url, with: nil) { result in }
        
        let exp2 = expectation(description: "waiting")
        UrlProtocolStub.observerRequest { (request) in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual(HTTPMethod.post, request.method)
            XCTAssertNil(request.httpBodyStream)
            exp2.fulfill()
        }
        wait(for: [exp2], timeout: 1)
    }
    
}
