//
//  ExtensionEncodable.swift
//  Domain
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

extension Encodable {
    public func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
