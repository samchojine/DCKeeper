//
//  File.swift
//  DCKeeper
//
//  Created by fwn on 2020/12/2.
//

import Foundation


extension UserDefaults {
    
    // 存复杂对象
    func setItem<T: Encodable>(_ object: T, forKey key: String) {
        
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(object) else {
            return
        }
        
        self.set(encoded, forKey: key)
    }
    
    // 取复杂对象
    func getItem<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        
        guard let data = self.data(forKey: key) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        guard let object = try? decoder.decode(type, from: data) else {
            print("Couldnt find key")
            return nil
        }
        
        return object
    }
}
