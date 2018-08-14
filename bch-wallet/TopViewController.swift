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
    @IBOutlet private weak var addressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateBalance()
    }

    private func setup() {
        var wif: String? = UserDefaultsManager.shared.get(item: .wif)
        if wif == nil {
            debugLog("Create new PrivateKey")
            wif = PrivateKey(network: .testnet).toWIF()
            UserDefaultsManager.shared.save(item: .wif, value: wif!)
        } else {
            debugLog("Found exists PrivateKey", "wif: ", wif!)
        }

        let wallet = try! Wallet(wif: wif!)
        let toAddress = wallet.publicKey.toAddress()
        addressLabel.text = "toAddress: \(toAddress)"
        debugLog("toAddress", toAddress)
    }

    private func updateBalance() {
        
    }
}

