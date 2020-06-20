//
//  IntegrationTest.swift
//  IntegrationTest
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import XCTest
import Data
import Infra
import Domain

class IntegrationTest: XCTestCase {

    func test_AddAccount_with_succes() {
        
        let url = URL(string: "https://clean-node-api.herokuapp.com/api/signup")!
        let alamofireAdapter = AlamofireAdapter()
        let addAccountModel = AddAccountModel(name: "Jean Paull", email:"jean123@jean.com", password:"secret", passwordConfirmation: "secret")
        let sut = RemoteAddAccount(url: url, httpPostClient: alamofireAdapter)
        let exp = expectation(description: "waiting")
        sut.add(addAccountModel: addAccountModel) { result in
            
            switch result {
                
                case .failure: XCTFail("Expected only Success")
                case .success(let account):
                    XCTAssertNotNil(account.id)
                    XCTAssertEqual(account.name, addAccountModel.name)
                    XCTAssertEqual(account.email, addAccountModel.email)
                
            }
            
            exp.fulfill()
        }

        wait(for: [exp], timeout: 5)
    }
    
    func test_AddAccount_with_failure() {
        
        let url = URL(string: "https://clean-node-api.herokuapp.com/api/signup")!
        let alamofireAdapter = AlamofireAdapter()
        let addAccountModel = AddAccountModel(name: "Jean Paull", email:"jean123@jean.com", password:"secret", passwordConfirmation: "secret2")
        let sut = RemoteAddAccount(url: url, httpPostClient: alamofireAdapter)
        let exp = expectation(description: "waiting")
        sut.add(addAccountModel: addAccountModel) { result in
            
            switch result {
                
            case .failure (let error): XCTAssertEqual(error, .unexpected)
            case .success: XCTFail("Expected only Error")
                
            }
            
            exp.fulfill()
        }

        wait(for: [exp], timeout: 5)
    }


}
