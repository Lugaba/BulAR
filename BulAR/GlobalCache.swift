//
//  Commum.swift
//  BulAR
//
//  Created by Luca Hummel on 14/08/23.
//

import Foundation
import UIKit

class GlobalCache {
    static let shared = GlobalCache()
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func setObject(_ object: UIImage, forKey key: String) {
        cache.setObject(object, forKey: key as NSString)
    }
    
    func getObject(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func removeObject(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    
    func removeAllObjects() {
        cache.removeAllObjects()
    }
}
