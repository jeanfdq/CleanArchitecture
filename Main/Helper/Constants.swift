//
//  Constants.swift
//  Main
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public enum HttpUrls {
    static let urlAddAccount =  Environment.variable(key: .apiBaseURL) + "signup"
}

public enum EnvironmentVariables : String {
    case apiBaseURL = "API_BASE_URL"
}
