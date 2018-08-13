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
        let wif = PrivateKey(network: .testnet).toWIF()
        let wallet = try! Wallet(wif: wif)
        let toAddress = wallet.publicKey.toAddress()
        addressLabel.text = "toAddress: \(toAddress)"
        debugLog("toAddress", toAddress)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateBalance()
    }

    private func updateBalance() {

    }
}

