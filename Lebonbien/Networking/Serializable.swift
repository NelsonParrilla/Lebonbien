//
//  SerializableType.swift
//  lebonbien (iOS)
//
//  Created by nelson on 11/09/2021.
//

import Foundation

public protocol Serializable: Codable {
    
    func serialize() -> Result<Data, NSError>
}

public extension Serializable {
    
    func serialize() -> Result<Data, NSError> {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self)
            return .success(data)
        } catch let error {
            return .failure(error as NSError)
        }
    }
}
