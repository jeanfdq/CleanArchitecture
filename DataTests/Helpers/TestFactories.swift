//
//  TestFactories.swift
//  DataTests
//
//  Created by Jean Paull on 19/06/20.
//  Copyright © 2020 Jean Paull. All rights reserved.
//

import Foundation

func makeEmptyData() -> Data {
    return Data()
}

func makeInvalidData() -> Data {
    return Data("invalid_data_json".utf8)
}

func makeValidData() -> Data {
    return Data("{\"name\": \"Jean\"}".utf8)
}

func makeUrl() -> URL {
    return URL(string: "http://any-url.com.br")!
}

func makeError() -> Error {
    return NSError(domain: "any_error", code: 0)
}

func makeHttpResponse(statusCode: Int = 200) -> HTTPURLResponse {
    return HTTPURLResponse(url: makeUrl(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
}
