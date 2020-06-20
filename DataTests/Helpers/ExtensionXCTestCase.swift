//
//  ExtensionXCTestCase.swift
//  Data
//
//  Created by Jean Paull on 20/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    func checkMemoryLeak(for instance:AnyObject, file: StaticString = #file, line:UInt = #line) {
        addTeardownBlock { [weak instance] in
            
            XCTAssertNil(instance, file: file, line: line)
            
        }
    }
}
