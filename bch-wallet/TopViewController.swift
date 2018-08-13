//
//  ViewController.swift
//  bch-wallet
//
//  Created by 下村一将 on 2018/08/07.
//  Copyright © 2018 下村一将. All rights reserved.
//

import UIKit
import BitcoinCashKit

class TopViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let privateKey = PrivateKey(network: .testnet, isPublicKeyCompressed: false)
        let wallet = Wallet(privateKey: privateKey)
        print(wallet.serialized().description)
    }
}

