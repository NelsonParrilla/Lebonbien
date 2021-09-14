//
//  String+Date.swift
//  Lebonbien
//
//  Created by nelson on 14/09/2021.
//

import Foundation

extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter.date(from: self) ?? Date()
    }
}
