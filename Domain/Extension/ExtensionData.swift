//
//  ExtensionData.swift
//  Domain
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

public extension Data {
     func toModel<T:Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
