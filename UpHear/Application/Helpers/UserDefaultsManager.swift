//
//  UserDefaultsManager.swift
//  UpHear
//
//  Created by Timothy Ananda on 03/08/21.
//

import Foundation

struct UserProfileCache {
    static let key = "userProfileCache"
    static let idKey = "userIdCache"
    
    static func save(_ value: User!, id: String) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(id), forKey: idKey)
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
    
    static func getId() -> String! {
        var userId: String!
        if let data = UserDefaults.standard.value(forKey: idKey) as? Data {
            userId = try? PropertyListDecoder().decode(String.self, from: data)
            return userId!
        } else {
            return userId
        }
    }
    static func remove() {
        UserDefaults.standard.removeObject(forKey: idKey)
        UserDefaults.standard.removeObject(forKey: key)
    }
}
