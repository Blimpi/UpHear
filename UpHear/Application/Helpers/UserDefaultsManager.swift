//
//  UserDefaultsManager.swift
//  UpHear
//
//  Created by Timothy Ananda on 03/08/21.
//

import Foundation

struct UserProfileCache {
    static let key = "userProfileCache"
    static func save(_ value: User!) {
         UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }
    static func get() -> User! {
        var userData: User!
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            userData = try? PropertyListDecoder().decode(User.self, from: data)
            return userData!
        } else {
            return userData
        }
    }
    static func remove() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
