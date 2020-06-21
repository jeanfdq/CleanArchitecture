//
//  UseCasesFactory.swift
//  Main
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import Data
import Infra
import Domain

class UseCases{
    
    private static let httpClient = AlamofireAdapter()
    
    static func makeRemoteAddAccount() -> AddAccount {
        let url = URL(string: HttpUrls.urlAddAccount)!
        return RemoteAddAccount(url: url, httpPostClient: httpClient)
    }
}
