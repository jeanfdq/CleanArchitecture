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
    static func makeRemoteAddAccount() -> AddAccount {
        let url = URL(string: HttpUrls.urlAddAccount)!
        let alamofireAdapter = AlamofireAdapter()
        return RemoteAddAccount(url: url, httpPostClient: alamofireAdapter)
    }
}
