//
//  ValidEmail.swift
//  Domain
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public protocol ValidEmail {
    func validEmailDomain(email:String?) -> Bool
}
