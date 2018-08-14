//
//  UtxoResponse.swift
//  bch-wallet
//
//  Created by 下村一将 on 2018/08/14.
//  Copyright © 2018 下村一将. All rights reserved.
//

import Foundation

struct Utxo: Decodable {
    let address: String
    let amount: Double
    let confirmations: Int
    let height: Int
    let satoshis: Int
    let scriptPubKey: String
    let txid: String
    let vout: Int
}
