//
//  Environment.swift
//  Main
//
//  Created by Jean Paull on 21/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public final class Environment {
    
    public static func variable(key: EnvironmentVariables) -> String {
        return Bundle.main.infoDictionary?[key.rawValue] as? String ?? ""
    }
}
