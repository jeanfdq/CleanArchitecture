//
//  HttpPostCliente.swift
//  Data
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public protocol HttpPostClient {
    func post(to url:URL, with data:Data?, completion:@escaping(Result<Data?, HttpError>)->Void)
}
