//
//  StoragePropertyWrapper.swift
//  Crypty
//
//  Created by Nikita Kirshin on 23.06.2022.
//

import Foundation

@propertyWrapper
struct UserDefaultsStorage<T: Codable> {
    var wrappedValue: T {
        get {
            guard let data = userDefaults.data(forKey: key) else {
                return defaultValue
            }
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
        set {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(newValue)
                
                userDefaults.set(data, forKey: key)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    private let key: String
    private let userDefaults = UserDefaults.standard
    private let defaultValue: T
    
    init(key: String, default: T, userDefaults: UserDefaults = UserDefaults.standard) {
        self.key = key
        self.defaultValue = `default`
    }
}
