//
//  HttpError.swift
//  Data
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public enum HttpError:Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbiden
}
