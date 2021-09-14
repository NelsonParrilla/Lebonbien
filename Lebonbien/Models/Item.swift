//
//  item.swift
//  lebonbien (iOS)
//
//  Created by nelson on 11/09/2021.
//

import Foundation

struct Item: Codable, Equatable {
    let id: Int
    let category_id: Int
    let title: String
    let description: String
    let price: Float
    let images_url: [String:String]
    let creation_date: String
    let is_urgent: Bool
}
