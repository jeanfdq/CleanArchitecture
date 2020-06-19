//
//  AddAccountModel.swift
//  Domain
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public struct AddAccountModel:Encodable , Equatable{
    
    let name:String
    let email:String
    let password:String
    let passwordConfirmation:String
    
}
