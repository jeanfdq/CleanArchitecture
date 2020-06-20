//
//  EmailValidator.swift
//  Presentation
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public protocol EmailValidator {
    func isValid(email:String) -> Bool
}
