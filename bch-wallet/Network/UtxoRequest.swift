//
//  UtxoRequest.swift
//  bch-wallet
//
//  Created by 下村一将 on 2018/08/14.
//  Copyright © 2018 下村一将. All rights reserved.
//

import Foundation
import APIKit

final class InsightAPI {
    private init() {}

    struct UtxoRequest {
        let address: String
    }
}

extension InsightAPI.UtxoRequest: InsightRequest {
    typealias Response = [Utxo]

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/addr/\(address)/utxo"
    }
}
