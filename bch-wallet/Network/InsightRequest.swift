//
//  InsightRequest.swift
//  bch-wallet
//
//  Created by 下村一将 on 2018/08/14.
//  Copyright © 2018 下村一将. All rights reserved.
//

import Foundation
import APIKit

protocol InsightRequest: Request {
}

extension InsightRequest {
    var baseURL: URL {
        return URL(string: "https://test-bch-insight.bitpay.com/api")!
    }
}

extension InsightRequest where Response: Decodable {
    var dataParser: DataParser {
        return DecodableDataParser()
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}
