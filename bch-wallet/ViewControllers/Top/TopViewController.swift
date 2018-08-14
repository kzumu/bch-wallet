//
//  ViewController.swift
//  bch-wallet
//
//  Created by 下村一将 on 2018/08/07.
//  Copyright © 2018 下村一将. All rights reserved.
//

import UIKit
import BitcoinCashKit
import APIKit

class TopViewController: UIViewController {
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var balanceLabel: UILabel!

    private let toAddress: String = {
        var wif: String? = UserDefaultsManager.shared.get(item: .wif)
        if wif == nil {
            debugLog("Create new PrivateKey")
            wif = PrivateKey(network: .testnet).toWIF()
            UserDefaultsManager.shared.save(item: .wif, value: wif!)
        } else {
            debugLog("Found exists PrivateKey", "wif: ", wif!)
        }

        let wallet = try! Wallet(wif: wif!)
        return wallet.publicKey.toAddress()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateBalance()
    }

    private func setup() {
        addressLabel.text = "toAddress: \(toAddress)"
        debugLog("toAddress", toAddress)
    }

    private func updateBalance() {
        Session.send(InsightAPI.UtxoRequest(address: toAddress), callbackQueue: nil) { [weak self] (result) in
            guard let me = self else { return }
            switch result {
            case .failure(let e):
                debugLog(e, level: .error)
            case .success(let r):
                let sum = r.reduce(0.0, { (prev, utxo) -> Double in
                    return prev + utxo.amount
                })
                me.balanceLabel.text = "\(sum) BCH"
            }
        }
    }
}

