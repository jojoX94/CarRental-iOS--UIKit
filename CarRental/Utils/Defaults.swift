//
//  Defaults.swift
//  CarRental
//
//  Created by Madiapps on 28/07/2022.
//

import UIKit

enum UserDefaultKeys: String, CaseIterable {
 case isAuth
 case notifEnabled
 case pinCode
}

final class UserDefaultsHelper {
    static func setData<T>(value: T, key: UserDefaultKeys) {
       let defaults = UserDefaults.standard
       defaults.set(value, forKey: key.rawValue)
    }
    static func getData<T>(type: T.Type, forKey: UserDefaultKeys) -> T? {
       let defaults = UserDefaults.standard
       let value = defaults.object(forKey: forKey.rawValue) as? T
       return value
    }
    static func removeData(key: UserDefaultKeys) {
       let defaults = UserDefaults.standard
       defaults.removeObject(forKey: key.rawValue)
    }
}
