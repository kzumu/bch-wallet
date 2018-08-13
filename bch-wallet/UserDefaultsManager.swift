//
//  UserDefaultsManager.swift
//  bch-wallet
//
//  Created by 下村一将 on 2018/08/14.
//  Copyright © 2018 下村一将. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    private init() {}
    static let shared = UserDefaultsManager()
    private let ud = UserDefaults.standard

    func save(item: Item, value: Any) {
        ud.set(value, forKey: item.key)
    }

    func get<T>(item: Item) -> T? {
        switch item {
        case .wif: return ud.object(forKey: item.key) as? T
        }
    }

    enum Item: String {
        case wif

        var key: String {
            return self.rawValue
        }
    }
}
